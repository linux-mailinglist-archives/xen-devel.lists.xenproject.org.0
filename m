Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1462941A9A5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:24:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197640.350809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7TX-0007Tq-UD; Tue, 28 Sep 2021 07:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197640.350809; Tue, 28 Sep 2021 07:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7TX-0007RU-PA; Tue, 28 Sep 2021 07:24:27 +0000
Received: by outflank-mailman (input) for mailman id 197640;
 Tue, 28 Sep 2021 07:24:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mV7TV-0007RO-S2
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:24:25 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0acda29-5a6c-473c-a736-f6c46ef65ba6;
 Tue, 28 Sep 2021 07:24:24 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S7K45F007122; 
 Tue, 28 Sep 2021 07:24:23 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bbxjhr0fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 07:24:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4753.eurprd03.prod.outlook.com (2603:10a6:208:cf::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Tue, 28 Sep
 2021 07:24:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 07:24:20 +0000
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
X-Inumbo-ID: c0acda29-5a6c-473c-a736-f6c46ef65ba6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzE9eBe/B77iZa4XI3mqUJCRDTUrn8zaL5J9jxr7ZUFJ6BNLp+JYjRN2QBomEIFqY9/cISqmaPrVPOpZ5QxvgW20XpOU/mZhNp2XaQFIEhB6va9+Q2AA49qNE8m1lJa9+sZkcGh1uRlZMIXnTK89heMl7xwl9f7hIf7Md9x7KRKTedKxfG6czifmp1puJLa85hdk2xprR5Jds5kUm6iHE43bBynAVnCy12+FgQOISNZJdYwGXFt28InyfExPIN/mUWVSKgdfWKh3P11v0/KaasNy9JSGCbEqzDaJup54229jHotULk0MsXaPPj5AYf9k7q5VJkUuy+1RcZpuNpnscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mAxXwc/lmDEJhB8z+TYsCvxH9s7PYkzE+3n7odRNMe8=;
 b=FY1qcC7KV66Ofc9ws+5Q3IMR2FPPZawxFGlJkKwMq4e+OTRGepmiC/krym9B9ifAcTfBT9x7LiH9BO9s7B6rwc3cqbNE4GyCnEBFf49cMkaJGHAviUO8uQ9++1lFHk/zKsQp6aEc349JoSe2MyfeV3DGbXU26dZB69DX23BxKuxx9uYnMhVrT8brCk2Hq4lagNrFalAiRU+hl+FQ0XSU2NNKEDmr5mj7A/P51ck7m7v/d1YBlsBD0zK6EEpFSf2h5MNOafPub6bjrbFShrMl2rzYQTFCeZnUDXliUm3aXg3cok05xFxDXywu+6aOUQaSv8J+cDgKJyZGiVJt1pgYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAxXwc/lmDEJhB8z+TYsCvxH9s7PYkzE+3n7odRNMe8=;
 b=nO1l5S6yYAQu2MOgOr0xoxfhla7QUcS4TEwRY84wOVKGpY6AR3J07xxh+Ae0QED+wQnCdy/xdtKY2GdpMFXoUeR+D7Wl8ikcNIS8LayUh3AAiU5amBXDTj4FF0xYLc0WHVMromxQInmt1lE9q1MX4BwVSVtkAxH7HmbqkWX2H6xXnGOYzcXj1Rd3d1TzvQ5+Bc5QpoDkKIYbQL6i95GROMXNYQjlp5BCTeMLrhhb8S879riKBV4eS3EksioukWjgvkrluD2gsIUA1QkAWXRZ3wPtyHUboENhFjenAYHTMqrA/0XJ60hgsobtOhY4qz5pRKtcrJbgJlZTgmezOUH9yA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>
CC: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org" <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and
 PV
Thread-Index: 
 AQHXs20TiZWMfq6cRkakGi7ds9CK56u3ezoAgAACbACAAAVGAIABVeSAgAAoPoCAAAP7gIAAAMWAgAAFAACAAADnAIAAASSA
Date: Tue, 28 Sep 2021 07:24:20 +0000
Message-ID: <b835b135-1113-2762-459a-b6e31053336a@epam.com>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
 <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
 <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
 <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com>
 <b4c8b964-56d7-c693-98e0-ecb435925eb0@epam.com>
 <da921aa0-0259-cd2e-5f43-5e2934ad3f82@suse.com>
 <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>
 <2b4dc684-a00f-1a08-92b0-7b0b614aeb24@suse.com>
In-Reply-To: <2b4dc684-a00f-1a08-92b0-7b0b614aeb24@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35720c18-cbc3-4583-75dc-08d98250fcea
x-ms-traffictypediagnostic: AM0PR03MB4753:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4753BB921DCD325EEA801D1EE7A89@AM0PR03MB4753.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cJ4fVsW5yWGUAQnDuQIYkLqDEh2p2deQ7Avtk2aFNohrevOfeQJBFBIZil6G2jbZFwsMwHg5sqn/jTXFS40/67FyEiLCQprccbMt5H6Ncl183AoE5nB/O873olRveli+lWu1bOPOru+yWjPNwM3xontvRULSwuiSA4O+n9oTSsS9LsQVpRTTknp/FveIJ6Q2WAI5ovhMa/Y2RYk28itu0TLP8Ei38tIuJOlSL5iG5MKazvDtcJWJhnylxx6AtH1A6SLQ4Ld49pT7SSVNHn+Ic3sarPf6YACQZg1xEh+PAeyrA4CNwXL1MtpAu2MT8xFcSnt3BNI2fXhec+HNvskq2SxlfXKtcR8NBHdXJP0mHSiTOEdrjIkTiBEYscbE/aKq4Or2lb+Hl80X/3wjmWZ16a/NFysZslGp0IFei2rPVf3uBJxbs3E3yLqsq1rRRYOlnIpQiIzOtVNrAV4x9ZXrlehn37cm1VQemddTHB9eol9N5nXEVeomtkurRcdvwyy6pISepupU8yE+dYRzzvIDUXr7t9AF4rsnJcWmZEjE7ytXrxrByMjmVORFwzBh0yQXrzL2yJ5nF6xPgqHBFIhGm+G+95KHsIKTJiQ7+UDhPoZsOvUv+l3f2dx7siE3/E6oMvu+03sV9VVfGuEezFi+O/cuGcdY+yDCC2rSkal6Whq+oSMGueiyOfkGcojC7lEeCPm0G4/Jp6i8RjVvf57YiTuUoJHPDaVmBCql4UdDQLRSurzAd78nmbl4u2cDkyWL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(6512007)(122000001)(55236004)(26005)(71200400001)(6486002)(4326008)(2616005)(2906002)(6506007)(316002)(38100700002)(38070700005)(53546011)(83380400001)(54906003)(110136005)(86362001)(8936002)(36756003)(31686004)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(91956017)(508600001)(31696002)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YW9CWjgxR25RR0d3eEVzSFA2a28yZHlza0FydnhjVzlUZnpkUE9NY0pDMFZu?=
 =?utf-8?B?L0psd3gwdFp4WHB1WkVqNXJqUVZtci82VzNYZFU3SzZHZnJyb0hDdDVGcGww?=
 =?utf-8?B?c2hlbTcyOHdOem95eERka3BTcTJzaTh2Mi9pTmt4WjhDY2hoVXlET3dlSkdJ?=
 =?utf-8?B?blZZVVNLSmRqZXhNNnNHMkdMTEQvQUpRL2ZXZ0FxZVBOTGlDaHBuMlZrTlVO?=
 =?utf-8?B?aHYweTJPV1BlVnh6MlhPc2MrMFpYd0JrTmVvbjJoRWxsa0dDcTNNa2l2WGxN?=
 =?utf-8?B?aVVsdVZ1anI1dnVqbGp4QjV5Njdxa3UreDNYVHdyQTdPazhzLzhZc252K0Yv?=
 =?utf-8?B?MGVTU2lCMEFjNmdMalhwMmhad3VkY2VoQ0VOUFhLTTlVemFHeGF0bHdTV0ht?=
 =?utf-8?B?RTh3TExZbjhLREt2ZHBTQWhRM3AxQjFTcXVyME1WUlJMQWFISlEraTBGdkRE?=
 =?utf-8?B?dHFROHBFRy9WMDlLNE5Ncm5SL0NyVVVGdkJvNTBIT3ViZ0xMNCs3ZFBSOXBw?=
 =?utf-8?B?WVZOZ2oyWjRqdVNxdjY5UkJNWEN6WHFDMzBJN1hOYUdrOGo1THFRZXp4NUIy?=
 =?utf-8?B?cktjUlpHdzFFcjVZcVRyMkQ3ZWxCTldFU2hVUlZmQW1QdnNHOEZHQVRKSE1t?=
 =?utf-8?B?WVNHQjVHTWhFVGpNL3A0T2EwNCtoaVFSekMvZUFMQk5ka3R3dzhKa2pZd2FC?=
 =?utf-8?B?TjlDeVVvK01rSFJ5Nm9TSWxJUm5pd3k0dHZHY0Via012dEpqOGg5SFoyUHNz?=
 =?utf-8?B?eUpXMzRMc3NlMmhWeEJJNHZCd1BjY1BpVlFYNTdGWm8vcnl2RjhxTnBSeGly?=
 =?utf-8?B?Um1MS053cW1NWTlDN0loWWRWTUFLT041c2tjN0ZoTlNGR3RYSldyaVBLclZ5?=
 =?utf-8?B?WGlOSDVFMDA4K0Z4Vk54SCt1YTd3dXNKbDhYL0lpL3ZGV0o5Nm9xZi9tZFRw?=
 =?utf-8?B?d1UwRzJLU2o5TU9RZEdpOElJZHpvYWxWK3IzSDRjVnVNZUhMVG12ZzlzMHEv?=
 =?utf-8?B?d1pHTjZlaWEzOVJYSzZSbG9BcjlVeWN6VjZES2FBa3ZGeGpObnc3czJIZ2F1?=
 =?utf-8?B?RHRId0F6SURjYlNmY2tnT0k1M3JQbFJLSDVzSll6ODJEeHRWUWlOMk9PVG1R?=
 =?utf-8?B?Ukt3dXhUQ2pmbncvWWZaN1lRUnE5R09UNTlZNEs3blNRSjR0c3I0WTZJNjBo?=
 =?utf-8?B?TmhsME9ZUHR1TSsremFUZWFKd05MVjRISlh6enBTbkVxUGFZN0xtL2NiRVFR?=
 =?utf-8?B?U0tmUDBDNVZhWmNId2F1NitxaFZISXMrRnVFMThhdVV5Uld2R1EzSFh6WUpU?=
 =?utf-8?B?RVhNU05rUUE5MEtPeE5sQkNFYW5nWnZ2ZldCWlBrNFNpWlRUR2JMMU4zVTZ3?=
 =?utf-8?B?RnRpRUVoZDFpNWlUbFVva241dm1yak04cUt4U3lvdDBTN0V2NjBnYmxTSld0?=
 =?utf-8?B?QmVRSXFOWlo3Qkl1SXkyajNMVHBheGVTR0JFTXp3OVZSWUdSYVF2ajdjRnE4?=
 =?utf-8?B?cU0yRGRkOEFTd2hlMXBaM0djd0lCcDRGWWxPcVBOZGNBQVcyVldaSzBBTzNa?=
 =?utf-8?B?bVJ0cjR6anJPYzhLN1ZpMHZ4aXkzMkI4SlVFNVZxTjdkeU9iUDBJejI4bFBX?=
 =?utf-8?B?dHlrWHRZL292RXNzNXY2YkhmNlZGRXI1ZFRtRkJkQVNGYWhCTHB3S1ZPOEU0?=
 =?utf-8?B?dnh6RER6Zk4yeHUzZnZGbVhSeCt2a0p0TlltNEd5Ylo1eitVQkNkNStnRkt3?=
 =?utf-8?B?QlFybk1paWV2bVJwSE5NQUxBdG9pUFVvQVY5MUVtSVdjdDZjRXgxbXRRYW9i?=
 =?utf-8?B?WTluYnFkVDhyUmpIWGJuZz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <45E2F3D65AC7AC4DB51E3898B43EAD75@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35720c18-cbc3-4583-75dc-08d98250fcea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 07:24:20.0420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qwdfh/VQNcZ9nfnjwC1ihm8v0E0/aBRlKTYZCNbxzTg3MiVbnPO03dcEJDDL9+4Nn+Il695ONbKE4TrBjYuMdrMw/DNOFBoV7Iu8Gb5P/B5EXBcL+3IQQSv8XdROmFRw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4753
X-Proofpoint-GUID: OMB24DAL9WbY340xhbfeUwvvIfUOi5lF
X-Proofpoint-ORIG-GUID: OMB24DAL9WbY340xhbfeUwvvIfUOi5lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109280042

DQpPbiAyOC4wOS4yMSAxMDoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjguMDkuMjEg
MDk6MTcsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4NCj4+IE9uIDI4LjA5LjIx
IDA5OjU5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDI4LjA5LjIxIDA4OjU2LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4NCj4+Pj4gT24gMjguMDkuMjEgMDk6NDIs
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMjguMDkuMjAyMSAwNjoxOCwgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+IE9uIE1vbiwgMjcgU2VwIDIwMjEsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+Pj4+IE9uIDI3LjA5LjIxIDA5OjM1LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+Pj4+IE9uIDI3LjA5LjIxIDEwOjI2LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+Pj4+Pj4+PiBPbiAyNy4wOS4yMDIxIDA4OjU4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+Pj4+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtz
YW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBDdXJy
ZW50bHkgUENJIGJhY2tlbmQgaW1wbGVtZW50cyBtdWx0aXBsZSBmdW5jdGlvbmFsaXRpZXMgYXQg
YSB0aW1lLg0KPj4+Pj4+Pj4+PiBUbyBuYW1lIGEgZmV3Og0KPj4+Pj4+Pj4+PiAxLiBJdCBpcyB1
c2VkIGFzIGEgZGF0YWJhc2UgZm9yIGFzc2lnbmFibGUgUENJIGRldmljZXMsIGUuZy4geGwNCj4+
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgcGNpLWFzc2lnbmFibGUte2FkZHxyZW1vdmV8bGlzdH0g
bWFuaXB1bGF0ZXMgdGhhdCBsaXN0LiBTbywNCj4+Pj4+Pj4+Pj4gd2hlbmV2ZXINCj4+Pj4+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqAgdGhlIHRvb2xzdGFjayBuZWVkcyB0byBrbm93IHdoaWNoIFBDSSBk
ZXZpY2VzIGNhbiBiZSBwYXNzZWQgdGhyb3VnaA0KPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBp
dCByZWFkcyB0aGF0IGZyb20gdGhlIHJlbGV2YW50IHN5c2ZzIGVudHJpZXMgb2YgdGhlIHBjaWJh
Y2suDQo+Pj4+Pj4+Pj4+IDIuIEl0IGlzIHVzZWQgdG8gaG9sZCB0aGUgdW5ib3VuZCBQQ0kgZGV2
aWNlcyBsaXN0LCBlLmcuIHdoZW4gcGFzc2luZw0KPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB0
aHJvdWdoIGEgUENJIGRldmljZSBpdCBuZWVkcyB0byBiZSB1bmJvdW5kIGZyb20gdGhlIHJlbGV2
YW50DQo+Pj4+Pj4+Pj4+IGRldmljZQ0KPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBkcml2ZXIg
YW5kIGJvdW5kIHRvIHBjaWJhY2sgKHN0cmljdGx5IHNwZWFraW5nIGl0IGlzIG5vdCByZXF1aXJl
ZA0KPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB0aGF0IHRoZSBkZXZpY2UgaXMgYm91bmQgdG8g
cGNpYmFjaywgYnV0IHBjaWJhY2sgaXMgYWdhaW4gdXNlZCBhcyBhDQo+Pj4+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgIGRhdGFiYXNlIG9mIHRoZSBwYXNzZWQgdGhyb3VnaCBQQ0kgZGV2aWNlcywgc28g
d2UgY2FuIHJlLWJpbmQgdGhlDQo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIGRldmljZXMgYmFj
ayB0byB0aGVpciBvcmlnaW5hbCBkcml2ZXJzIHdoZW4gZ3Vlc3QgZG9tYWluIHNodXRzDQo+Pj4+
Pj4+Pj4+IGRvd24pDQo+Pj4+Pj4+Pj4+IDMuIERldmljZSByZXNldCBmb3IgdGhlIGRldmljZXMg
YmVpbmcgcGFzc2VkIHRocm91Z2gNCj4+Pj4+Pj4+Pj4gNC4gUGFyYS12aXJ0dWFsaXNlZCB1c2Ut
Y2FzZXMgc3VwcG9ydA0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBUaGUgcGFyYS12aXJ0dWFsaXNl
ZCBwYXJ0IG9mIHRoZSBkcml2ZXIgaXMgbm90IGFsd2F5cyBuZWVkZWQgYXMgc29tZQ0KPj4+Pj4+
Pj4+PiBhcmNoaXRlY3R1cmVzLCBlLmcuIEFybSBvciB4ODYgUFZIIERvbTAsIGFyZSBub3QgdXNp
bmcgYmFja2VuZC1mcm9udGVuZA0KPj4+Pj4+Pj4+PiBtb2RlbCBmb3IgUENJIGRldmljZSBwYXNz
dGhyb3VnaC4gRm9yIHN1Y2ggdXNlLWNhc2VzIG1ha2UgdGhlIHZlcnkNCj4+Pj4+Pj4+Pj4gZmly
c3Qgc3RlcCBpbiBzcGxpdHRpbmcgdGhlIHhlbi1wY2liYWNrIGRyaXZlciBpbnRvIHR3byBwYXJ0
czogWGVuDQo+Pj4+Pj4+Pj4+IFBDSSBzdHViIGFuZCBQQ0kgUFYgYmFja2VuZCBkcml2ZXJzLg0K
Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbw0KPj4+Pj4+Pj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4+PiBDaGFuZ2VzIHNpbmNlIHYzOg0KPj4+
Pj4+Pj4+PiAtIE1vdmUgQ09ORklHX1hFTl9QQ0lERVZfU1RVQiB0byB0aGUgc2Vjb25kIHBhdGNo
DQo+Pj4+Pj4+Pj4gSSdtIGFmcmFpZCB0aGlzIHdhc24ndCBmdWxseSBkb25lOg0KPj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+Pj4+
Pj4+Pj4+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+Pj4+Pj4+Pj4+
IEBAIC0xLDUgKzEsNiBAQA0KPj4+Pj4+Pj4+PiDCoMKgwqDCoMKgICMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjANCj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoCBvYmotJChDT05GSUdfWEVO
X1BDSURFVl9CQUNLRU5EKSArPSB4ZW4tcGNpYmFjay5vDQo+Pj4+Pj4+Pj4+ICtvYmotJChDT05G
SUdfWEVOX1BDSURFVl9TVFVCKSArPSB4ZW4tcGNpYmFjay5vDQo+Pj4+Pj4+Pj4gV2hpbGUgYmVu
aWduIHdoZW4gYWRkZWQgaGVyZSwgdGhpcyBhZGRpdGlvbiBzdGlsbCBkb2Vzbid0IHNlZW0gdG8N
Cj4+Pj4+Pj4+PiBiZWxvbmcgaGVyZS4NCj4+Pj4+Pj4+IE15IGJhZC4gU28sIGl0IHNlZW1zIHdp
dGhvdXQgQ09ORklHX1hFTl9QQ0lERVZfU1RVQiB0aGUgY2hhbmdlIHNlZW1zDQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gdG8gYmUgbm9uLWZ1bmN0aW9uYWwuIFdpdGggQ09ORklHX1hFTl9QQ0lERVZfU1RV
QiB3ZSBmYWlsIHRvIGJ1aWxkIG9uIDMyLWJpdA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGFyY2hpdGVj
dHVyZXMuLi4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBXaGF0IHdvdWxkIGJlIHRoZSBwcmVmZXJlbmNl
IGhlcmU/IFN0ZWZhbm8gc3VnZ2VzdGVkIHRoYXQgd2Ugc3RpbGwgZGVmaW5lDQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gQ09ORklHX1hFTl9QQ0lERVZfU1RVQiwgYnV0IGluIGRpc2FibGVkIHN0YXRlLCBl
LmcuIHdlIGFkZCB0cmlzdGF0ZSB0byBpdA0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGluIHRoZSBzZWNv
bmQgcGF0Y2gNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBBbm90aGVyIG9wdGlvbiBpcyBqdXN0IHRvIHNx
dWFzaCB0aGUgdHdvIHBhdGNoZXMuDQo+Pj4+Pj4+IFNxdWFzaGluZyB3b3VsZCBiZSBmaW5lIGZv
ciBtZS4NCj4+Pj4+PiDCoMKgwqAgSXQgaXMgZmluZSBmb3IgbWUgdG8gc3F1YXNoIHRoZSB0d28g
cGF0Y2hlcy4NCj4+Pj4+Pg0KPj4+Pj4+IEJ1dCBpbiBhbnkgY2FzZSwgd291bGRuJ3QgaXQgYmUg
YmV0dGVyIHRvIG1vZGlmeSB0aGF0IHNwZWNpZmljIGNoYW5nZSB0bzoNCj4+Pj4+Pg0KPj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZSBiL2RyaXZlcnMv
eGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+Pj4+Pj4gaW5kZXggZTJjYjM3NjQ0NGE2Li5lMjNj
NzU4Yjg1YWUgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFr
ZWZpbGUNCj4+Pj4+PiArKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZQ0KPj4+
Pj4+IEBAIC0xLDYgKzEsNSBAQA0KPj4+Pj4+IMKgwqDCoCAjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wDQo+Pj4+Pj4gLW9iai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9
IHhlbi1wY2liYWNrLm8NCj4+Pj4+PiAtb2JqLSQoQ09ORklHX1hFTl9QQ0lERVZfU1RVQikgKz0g
eGVuLXBjaWJhY2subw0KPj4+Pj4+ICtvYmotJChDT05GSUdfWEVOX1BDSV9TVFVCKSArPSB4ZW4t
cGNpYmFjay5vDQo+Pj4+PiBCdXQgdGhhdCB3b3VsZG4ndCBhbGxvdyB0aGUgZHJpdmVyIHRvIGJl
IGEgbW9kdWxlIGFueW1vcmUsIHdvdWxkIGl0Pw0KPj4+Pg0KPj4+PiBFeGFjdGx5LiBJIGZvcmdv
dCB0aGF0IHdoZW4gcGxheWluZyB3aXRoIG1vZHVsZS9idWlsdC1pbiBJIHdhcyBub3QgYWJsZQ0K
Pj4+Pg0KPj4+PiB0byBjb250cm9sIHRoYXQgYW55bW9yZSBiZWNhdXNlIENPTkZJR19YRU5fUENJ
X1NUVUIgd2lsbCBhbHdheXMgYmUNCj4+Pj4NCj4+Pj4gaW4gInkiIHN0YXRlLCB0aHVzIGV2ZW4g
aWYgeW91IGhhdmUgQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORD1tDQo+Pj4+DQo+Pj4+IHlvdSB3
b24ndCBiZSBhYmxlIHRvIGJ1aWxkIGl0IGFzIG1vZHVsZS4gU28sIEkgd2lsbCBwcm9iYWJseSBw
dXQgYSBjb21tZW50DQo+Pj4+DQo+Pj4+IGFib3V0IHRoYXQgaW4gdGhlIE1ha2VmaWxlIGV4cGxh
aW5pbmcgdGhlIG5lZWQgZm9yDQo+Pj4+DQo+Pj4+IG9iai0kKENPTkZJR19YRU5fUENJREVWX0JB
Q0tFTkQpICs9IHhlbi1wY2liYWNrLm8NCj4+Pj4gb2JqLSQoQ09ORklHX1hFTl9QQ0lERVZfU1RV
QikgKz0geGVuLXBjaWJhY2subw0KPj4+DQo+Pj4gSW4gY2FzZSB0aGUgcmVhbCBzcGxpdCBiZXR3
ZWVuIGJvdGggcGFydHMgb2YgeGVuLXBjaWJhY2sgaXMgZG9uZSB0aGlzDQo+Pj4gd2lsbCBiZSBu
ZWVkZWQgYW55d2F5Lg0KPj4NCj4+IFllcywgaXQgd2lsbA0KPj4NCj4+IFNvLCBJJ2xsIHB1dCBh
IGNvbW1lbnQgaW4gdGhlIE1ha2VmaWxlOg0KPj4NCj4+ICMgTi5CLiBUaGlzIGNhbm5vdCBiZSBl
eHByZXNzZWQgd2l0aCBhIHNpbmdsZSBsaW5lIHVzaW5nIENPTkZJR19YRU5fUENJX1NUVUINCj4+
DQo+PiAjIGFzIGl0IGFsd2F5cyByZW1haW5zIGluICJ5IiBzdGF0ZSwgdGh1cyBwcmV2ZW50aW5n
IHRoZSBkcml2ZXIgdG8gYmUgYnVpbHQgYXMNCj4+DQo+PiAjIGEgbW9kdWxlLg0KPj4NCj4+IG9i
ai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9IHhlbi1wY2liYWNrLm8NCj4+IG9iai0k
KENPTkZJR19YRU5fUENJREVWX1NUVUIpICs9IHhlbi1wY2liYWNrLm8NCj4+DQo+PiBXaWxsIHRo
aXMgYmUgb2sgb3IgbmVlZHMgc29tZSByZS13b3JkaW5nPw0KPg0KPiBJJ2QgYWRkIHRoYXQgQ09O
RklHX1hFTl9QQ0lERVZfQkFDS0VORCBhbmQgQ09ORklHX1hFTl9QQ0lERVZfU1RVQiBhcmUNCj4g
bXV0dWFsbHkgZXhjbHVzaXZlLg0KIyBOLkIuIFRoZSBiZWxvdyBjYW5ub3QgYmUgZXhwcmVzc2Vk
IHdpdGggYSBzaW5nbGUgbGluZSB1c2luZw0KIyBDT05GSUdfWEVOX1BDSV9TVFVCIGFzIGl0IGFs
d2F5cyByZW1haW5zIGluICJ5IiBzdGF0ZSwNCiMgdGh1cyBwcmV2ZW50aW5nIHRoZSBkcml2ZXIg
dG8gYmUgYnVpbHQgYXMgYSBtb2R1bGUuDQojIFBsZWFzZSBub3RlLCB0aGF0IENPTkZJR19YRU5f
UENJREVWX0JBQ0tFTkQgYW5kDQojIENPTkZJR19YRU5fUENJREVWX1NUVUIgYXJlIG11dHVhbGx5
IGV4Y2x1c2l2ZS4NCm9iai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9IHhlbi1wY2li
YWNrLm8NCm9iai0kKENPTkZJR19YRU5fUENJREVWX1NUVUIpICs9IHhlbi1wY2liYWNrLm8NCg0K
Pg0KPg0KPiBKdWVyZ2VuDQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

