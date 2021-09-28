Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350C41AA7A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197768.350996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8Fr-0006lo-HE; Tue, 28 Sep 2021 08:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197768.350996; Tue, 28 Sep 2021 08:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8Fr-0006jk-E8; Tue, 28 Sep 2021 08:14:23 +0000
Received: by outflank-mailman (input) for mailman id 197768;
 Tue, 28 Sep 2021 08:14:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mV8Fq-0006je-Cs
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:14:22 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14ef27c4-2034-11ec-bc72-12813bfff9fa;
 Tue, 28 Sep 2021 08:14:20 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S7X6ur008553; 
 Tue, 28 Sep 2021 08:14:19 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bbxjkg7ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 08:14:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 08:09:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 08:09:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 14ef27c4-2034-11ec-bc72-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaQrLDAYolf39rXzjfJ7Soijgr+Bsxd4vQn2AUUJr78qdXbSlxNyC75VsQw0Konc4s6e2JBeCmoxh9K0t3nwxlflQqPXRrvMtr1Rqgtt/GWBqek5ptL1pEaepTe2E9C1MelAtVvr2n066J0wJdAvu2iujXdlj6LavT+EEAun27FXrt6qqjUNo1GSAR4VCjKbVLQ6XMOgLY/nMD4GrV9OSlQ9VDkdCY4gXfArXbrm6N6KqkTx0ENY1ROSeO8eJxlIZJQHecQclfvZC4EEc4G/120ihKIiwxFDkilqZzdf21v8W4loGfeoLsax/VG6MxDtgrJMxNmmFa/G6Q0qsXrXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hsuIGcsZzN2xj8wYvl3rUSlfMOMLL9AzmFQUnjKsn+A=;
 b=GVWuPpsn/LghhVjvkt8qU50XgiwgL2zBp4iFVyrSmhd7NTrej64W2hyS12AlXgcZQ/esPfLKdRePbVu2V9yQWCnEVz+HS+X7Rwop1oZXj/LXWcrueeRQDX/QOBVUD0uYKnaEDXHWW24hGO1N/eVawhuCrdxsVlQb10Rp+2Z5+9gUaMQdEPx6DbAmRH08lXsbBNY0nZk2CV2YDh21XjtssPGYEpux56kNg0vNUVpiBgWAdgfAGZkFxfYUP/5kCZd+UN9Lada2jjKGT6MKr/ei/fvAF23SPe/ckoLvQDlLwtM4fLoLj5/s1Fg+3LFBY84hcUtDWEDem1efSOF0sbRjeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsuIGcsZzN2xj8wYvl3rUSlfMOMLL9AzmFQUnjKsn+A=;
 b=wi9o8ud6rgb5nW+leKeyP/Vsz+PeEbXuey1JfQWk3NS25VSlfqMYbq2R4jAR14yu2UkgyG1bY5elPZMyCoi1oStmaFuP21IAo2vkMYyUJQ1UGPPM/Rv82Gs2sZf4Bs2wtEoVDkoklM33Ig9njdm3b8pYhzCIbWCI7ktTXBEUp6jsXWu0MBVFmhVYbsdRhwUIZyvfeRmfNs+V5MxQNktDsewtmKTT30G+6UxNJq5ktPfuJkhgIAuU1SSycnqDF2K+oeWAUXBjnjxNkSLDiz/weq/fgae2An5kl0YvL6joqGqBHZa8dwbnDlMwZgcFksUVkkgZbTjUwjk9NKTT4mFqbA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: 
 AQHXsHoyHtx3VKSfZEKPQekyrs7GEau3hnIAgAAQrICAAAldgIAABLUAgAAG9wCAAAEGAIAABhwAgAFsAgA=
Date: Tue, 28 Sep 2021 08:09:15 +0000
Message-ID: <2e8f4316-002f-17d8-b9ec-9886c6bc28fa@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
 <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
 <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
 <a119740d-02c2-315f-432e-67aec806ada6@epam.com>
 <6eefff6f-97ed-e7f5-37f2-96065bd1f27e@suse.com>
In-Reply-To: <6eefff6f-97ed-e7f5-37f2-96065bd1f27e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07657679-a156-4e38-0844-08d98257433f
x-ms-traffictypediagnostic: AM9PR03MB6881:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB688175102C88204058ED7559E7A89@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Gg8KWbL5/XEjtwbNMEuj4L9CizOqP5mCrT0saxAKbeJW6860IKiEzRdIB7lzEj4bV5wFeiDG5AsjZ6vkKajmxbKBMbyklmD2n6dowKV4w/1duLHLR9mXoDAoZ7ItHgCp2/yd3wjO3P/98s6HWDe5yak5JsJpu6TjPVqbHaj17HARdlTfDgxIjEheKMCCby1AQU3uK3ETkPOupEWqVzbpPLHprPRGCDUS1qOdedryq3Ohx4Yu9V3t3MTzSfCz1wIDcEkEPNMAR8lUMjZgwWbATPBMRK+RUULByQmcy/kc8ptkPyMU2Q3C13s9gYNGxoJA/NR/AWC6EvqOKWYOsCi7LzU4K5ZNgemLw1Tu8LC0kHsWyEDwQ1g4ZQfuedKlCS+GxYzXIm+TAzUoh3FVYgzYA4FIQPs64maiWJ0vQad0kkBQEsiDeaqzAxbyqnk4zgiuepflcoxS9gBCoR8bDCBfE/uXt88ZEtP9/Pv6RuXpO4qwsFV98jXehcLyEeBK8WkcKBW8L2HzD4HFpmkowxyD78tNRYEloAJMmtIVRm1K7OfDEPlLJZ7ytcATDdSVfG6+TEC8V/GztZMNmFF3jzRDV3ydnCRxlNL4ipnRNDc8cLxacXRyAcCN64xPFnLRwcD9hAJ2DHo/a6u/bLKO127tGF0fMMu8zmTCFvio/Ke2TWKvofG+e5Tr7xo6ftsB5CzSqV/P9sdTMZK2VHyk1Twbhx6Nosbkwjuf5XXpbBkxN8w4GKtiILnBLN14ofLyXnlR
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(55236004)(38070700005)(8676002)(26005)(8936002)(64756008)(66446008)(5660300002)(66556008)(66476007)(91956017)(66946007)(6512007)(186003)(31696002)(71200400001)(86362001)(53546011)(6486002)(6506007)(508600001)(76116006)(122000001)(2616005)(38100700002)(54906003)(31686004)(316002)(36756003)(4326008)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TklCNGxyKysyN0hGNnBmYmJBYXBwQVJwMnE0LzZDZ2FidTIzS3ZiZkpmbXdn?=
 =?utf-8?B?Sll3REpLY29sU2NYRWZFdzkrS3UvNkZsaFB2dFpoZ2hXdDVScFBBMFg0SHVs?=
 =?utf-8?B?Q3RlbmhTQ1hHL3VabnlPaXFrUUN2NjUwTE4vT1VqTVlqQ3FPbTdJUkYvZE5x?=
 =?utf-8?B?djl0R0pQaGJHWElLSU4weWhMMjNZOFVCK1Fmc0ozYTRTbk4yNS9PelRHU1Vp?=
 =?utf-8?B?Y3V3bVVLNGRCaUhtaUU1U21TajhtQ05abkY1Z0RDWnIvOHNPS3pnNVB3anQy?=
 =?utf-8?B?NkMrdE12ZjdwNloxUzRJSThGaDRTM1JrbkRxZ1QxZmtRWDduM2hkb0Y2UHAr?=
 =?utf-8?B?TmpRVXhpeUVjckFsdll3M2ZHbGRzMUNXMlk3TnVmVjdqZ2ZsbWVkUWxGWkN6?=
 =?utf-8?B?aEN2dlR0dG1WbkxyYXhOYUxLQ25mb2J3TjVlVWxscW9iUG5Sdk53NlNvdDcr?=
 =?utf-8?B?c0FFbFhuT2hma2kzVzliV3pNU3NvQmtjd0lISzIvQVhLMXRzMkFnMWNvTXBQ?=
 =?utf-8?B?UHRuKzBXcHA1ZWR2RjdraWVkZG9zdExEVDZvQmJHaVFwQ21uL2k1REgwRjhF?=
 =?utf-8?B?MENDYlJkQWV0Nkh3TXFGOGVPemtUczdINXpHYmlpR2xrUUNGdDVRaEJUWC9Y?=
 =?utf-8?B?WXNnQ1Z3Q2tmM3NEbW51TlltVEZ5cEkrcER5QWwwcFZkMXRXSE9MQWhKWmVJ?=
 =?utf-8?B?NTcyYlFQclpZL0lsYml6eTFmcmNMcXp3amxPUThnNUh5YmVIM3BJZVJ5V3JW?=
 =?utf-8?B?N0dMaDFCNGVPeGhpclpGa0d0alo2b0JUbFZrM1Nlem1aZkhTcmo3RFNyaWha?=
 =?utf-8?B?MW15UXpNMk9xdzhIOTBNanN1SUJZYzRKTmdOWWtaYUlMRzhoRmpqa3JtRFFD?=
 =?utf-8?B?eUJmaE5Zcko1QWpwaVVDWUtDM0ZBbFk0Q0x3SzUxTlY2Ujk5Q1ViWGlaTHNX?=
 =?utf-8?B?Z3FLMDlDL3BDRG82TzNQWExQYWw3RUxocEZHSWtYNFIzdVRicjdLc3UzMUNN?=
 =?utf-8?B?cTdKUTBreWNQMkVmZ1NUcUFNUHRnQjdhTWtKWkRuc20yVzM0VFlTWkJYanJI?=
 =?utf-8?B?NW4zWE00V01IazVsdGhsMHRZRElxSTQ3MlBJK1UvWnpHK2V1YnFJdnk2VnZB?=
 =?utf-8?B?VlRVUmpYUXhmU2JZbTZaQVozQm95KzJTZ21Bb01UNk81T3c3czNXaGZsQVNj?=
 =?utf-8?B?WHlQd3Q1MXVINzdBaVFiZWZDMFAyc1pCZDhQeHM0YlBRQk5uQy9CT1MxcTJ4?=
 =?utf-8?B?cGNGVXJ4LzFYbURjdmFjOTFJOGVTbGw2MmlrK0RBdU5VcEgxV2M2MFBQb0Qy?=
 =?utf-8?B?Si91YVJBM1J1TlBGV1dkaDVBcXo3NU1Gc2lya1N2SzZJaTQrR1BLZkZzNStN?=
 =?utf-8?B?T1hIV3JuZW8xWDljb25nMDJ5d3hCUjFiRytpRnk1M2Q0NEtsWWNPanB2eTVN?=
 =?utf-8?B?aHdBZVBJWllHcmo1aEswNURGZnNYcVVNQUhKWlRKYmtteStsenVrdVRQRmI1?=
 =?utf-8?B?VVdZUldIZWtnbWZpcUdjZ1ZxWFU4QSt5eEx6ZDA1aUVwc28wREEwL2VlYnNx?=
 =?utf-8?B?OHNXdjI1U0drLytSYkpXTUliR21TMjY1RUN2djlrL1dxb1ozemMyZUNmNHZs?=
 =?utf-8?B?WnZkZ1dxcFFra0xWcnNiSC9vL3pNS2lOMU8zeGRCeklQbklBNzdhNWFJbVVJ?=
 =?utf-8?B?T1lZUzdLNjcyVFB1Vm54SVpGZFRRMlY1TS9FQll4dXgwamR0YW1JNTU3dmVy?=
 =?utf-8?B?SjlGQWpmT1RKbXhaM2FSMllZVjYwMmdCR0dtd21zaUNpR1BaOHpJN2x6aE1I?=
 =?utf-8?B?bHBXK3g4MnZNZ29PdUE3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7824461F8853B347899D2F7A62E95F77@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07657679-a156-4e38-0844-08d98257433f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 08:09:15.0640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qsFzBaagI7tNF3uHlP78+q45qik55YQ21PJ2knUWoqvPrkEpfiktousicSJtoM+nMBy+BXtNaNsonVdtakvK/+TWeo+h149YOpIp2Fvws6XC10nSH7D+HpmKRMxjHIP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-GUID: 6Na1QEaPdzrL6tSDb2M_XirLdSZRJ2ME
X-Proofpoint-ORIG-GUID: 6Na1QEaPdzrL6tSDb2M_XirLdSZRJ2ME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_04,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280048

DQpPbiAyNy4wOS4yMSAxMzoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjEg
MTI6MDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjcuMDkuMjEgMTM6
MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI3LjA5LjIwMjEgMTE6MzUsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyNy4wOS4yMSAxMjoxOSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAyNy4wOS4yMDIxIDEwOjQ1LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAyNy4wOS4yMSAxMDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDIzLjA5LjIwMjEgMTQ6NTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+
Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4+PiBAQCAtMzI4
LDYgKzMyOCw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqYWxsb2NfcGRldihzdHJ1Y3QgcGNp
X3NlZyAqcHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+Pj4+Pj4+ICAgICAgICAgICooKHU4Kikg
JnBkZXYtPmJ1cykgPSBidXM7DQo+Pj4+Pj4+PiAgICAgICAgICAqKCh1OCopICZwZGV2LT5kZXZm
bikgPSBkZXZmbjsNCj4+Pj4+Pj4+ICAgICAgICAgIHBkZXYtPmRvbWFpbiA9IE5VTEw7DQo+Pj4+
Pj4+PiArI2lmZGVmIENPTkZJR19BUk0NCj4+Pj4+Pj4+ICsgICAgcGNpX3RvX2RldihwZGV2KS0+
dHlwZSA9IERFVl9QQ0k7DQo+Pj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4+IEkgaGF2ZSB0byBhZG1p
dCB0aGF0IEknbSBub3QgaGFwcHkgYWJvdXQgbmV3IENPTkZJR188YXJjaD4gY29uZGl0aW9uYWxz
DQo+Pj4+Pj4+IGhlcmUuIEknZCBwcmVmZXIgdG8gc2VlIHRoaXMgZG9uZSBieSBhIG5ldyBhcmNo
IGhlbHBlciwgdW5sZXNzIHRoZXJlIGFyZQ0KPj4+Pj4+PiBvYnN0YWNsZXMgSSdtIG92ZXJsb29r
aW5nLg0KPj4+Pj4+IERvIHlvdSBtZWFuIHNvbWV0aGluZyBsaWtlIGFyY2hfcGNpX2FsbG9jX3Bk
ZXYoZGV2KT8NCj4+Pj4+IEknZCByZWNvbW1lbmQgYWdhaW5zdCAiYWxsb2MiIGluIGl0cyBuYW1l
OyAibmV3IiBpbnN0ZWFkIG1heWJlPw0KPj4+PiBJIGFtIGZpbmUgd2l0aCBhcmNoX3BjaV9uZXdf
cGRldiwgYnV0IGFyY2ggcHJlZml4IHBvaW50cyB0byB0aGUgZmFjdCB0aGF0DQo+Pj4+IHRoaXMg
aXMganVzdCBhbiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgcGFydCBvZiB0aGUgcGRldiBhbGxvY2F0
aW9uIHJhdGhlciB0aGFuDQo+Pj4+IGFjdHVhbCBwZGV2IGFsbG9jYXRpb24gaXRzZWxmLCBzbyB3
aXRoIHRoaXMgcmVzcGVjdCBhcmNoX3BjaV9hbGxvY19wZGV2IHNlZW1zDQo+Pj4+IG1vcmUgbmF0
dXJhbCB0byBtZS4NCj4+PiBUaGUgYnVsayBvZiB0aGUgZnVuY3Rpb24gaXMgYWJvdXQgcG9wdWxh
dGluZyB0aGUganVzdCBhbGxvY2F0ZWQgc3RydWN0Lg0KPj4+IFRoZXJlJ3Mgbm8gYXJjaC1zcGVj
aWZpYyBwYXJ0IG9mIHRoZSBhbGxvY2F0aW9uIChzbyBmYXIsIGxlYXZpbmcgYXNpZGUNCj4+PiBN
U0ktWCksIHlvdSBvbmx5IHdhbnQgYW5kIGFyY2gtc3BlY2lmaWMgcGFydCBvZiB0aGUgaW5pdGlh
bGl6YXRpb24uIEkNCj4+PiB3b3VsZCBhZ3JlZSB3aXRoICJhbGxvYyIgaW4gdGhlIG5hbWUgaWYg
ZnVydGhlciBhbGxvY2F0aW9uIHdhcyB0bw0KPj4+IGhhcHBlbiB0aGVyZS4NCj4+IEhtLCB0aGVu
IGFyY2hfcGNpX2luaXRfcGRldiBzb3VuZHMgbW9yZSByZWFzb25hYmxlDQo+IEZpbmUgd2l0aCBt
ZS4NCg0KRG8gd2Ugd2FudCB0aGlzIHRvIGJlIHZvaWQgb3IgcmV0dXJuaW5nIGFuIGVycm9yIGNv
ZGU/IElmIGVycm9yIGNvZGUgaXMgbmVlZGVkLA0KDQp0aGVuIHdlIHdvdWxkIGFsc28gbmVlZCBh
IHJvbGwtYmFjayBmdW5jdGlvbiwgZS5nLiBhcmNoX3BjaV9mcmVlX3BkZXYgb3INCg0KYXJjaF9w
Y2lfcmVsZWFzZV9wZGV2IG9yIGFyY2hfcGNpX2ZpbmlfcGRldiBvciBzb21ldGhpbmcsIHNvIGl0
IGNhbiBiZSB1c2VkIGluDQoNCmNhc2Ugb2YgZXJyb3Igb3IgaW4gZnJlZV9wZGV2IGZ1bmN0aW9u
Lg0KDQpJZiBzbywgdGhlbiB3aGF0J3MgeW91ciBwcmVmZXJlbmNlIG9uIHRoZSBuYW1lIG9mIHRo
YXQgZnVuY3Rpb24/DQoNCj4NCj4gSmFuDQo+DQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

