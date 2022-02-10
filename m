Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D74B0E00
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 14:00:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269843.463972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI93C-0007zu-Gw; Thu, 10 Feb 2022 12:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269843.463972; Thu, 10 Feb 2022 12:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI93C-0007wM-Bo; Thu, 10 Feb 2022 12:59:54 +0000
Received: by outflank-mailman (input) for mailman id 269843;
 Thu, 10 Feb 2022 12:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=06a2=SZ=epam.com=prvs=40400e4a88=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nI93B-0007wE-6H
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 12:59:53 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 551319e7-8a71-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 13:59:51 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21ACxSGN021845;
 Thu, 10 Feb 2022 12:59:48 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e51tnr9fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 12:59:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB3718.eurprd03.prod.outlook.com (2603:10a6:209:30::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Thu, 10 Feb
 2022 12:59:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.012; Thu, 10 Feb 2022
 12:59:44 +0000
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
X-Inumbo-ID: 551319e7-8a71-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZtWKUS//MwzmvIqmRxkIHShBvOehNNfjG4rzF0EWgCrdeow7wzPEG5S5NESj4fk1xkjTigDysxu4UNNkaFDCsdULBZ7DyNBvm5D3a/e0SNScS00/X5in2cR60HjWYqMfX4Z9oi5JB48uFmxf6LN4VUMTynIZRJWH1NKpGUcQMzLVKm4naDbuWrouwexxrUqy8GSAnTFd6DHg9IxpKgJpbmaUlzfzIWlyo833vKy4GIRMNoeGe3/D2A0gGq80oHFHwaNq1FIKR1OlkKN9vEqNqZzodKJEgsdp8+xuwSqTzgfnSN2FQ3/QwC+B/QSec4KT7o5dID/rWWrfA/iUYyDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swY1Ix3iZMo5/0ZSEOQp8FRaPBVH//4V5vHtgReeJk4=;
 b=ChhBohv80v9FpgIjbxa7FTUgVThega7yVnUfg1c6HCOsndZHeSuHYDZeSH3cXZPvWPA1tFDCs1VnLO84VIZxokFzAx9KSZbopMgx7QXzz+/HPJ2tLeUKOa24EpSrtSY/EZCgnDPEODdblidFsDw78HZp9QiXBz6owba2HOT2RDs8jii5fQzB5zWrBL5BiGjwZ26bo7BNeM/Z0idQMR/flr/fzl3D0KAWyh1jeZNWplksI4P0of5qaGU3Uq9+QerQvvUKA3+W1S8BSOD/vcha5DNI/KFG6PGQxckWPn7vgQZnMKAOCfse3OWEcYgCrvBaUArITFEx7Ky9TYvFK/tOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swY1Ix3iZMo5/0ZSEOQp8FRaPBVH//4V5vHtgReeJk4=;
 b=PVPZC6Qvdkdk2Kp3IGAJu1AOcew0Or7IkqoG7VGlXeljEhJTntXy1RG3Rk0mcsfimZKqOJ551b8IcPINeI/b9VR4h0TOwgsx7fqpFzPcBBTZFmc3MTV7xIXahoy5SPhxU1g0JsWkJn1AbwI7UxR8IalyUxnpfeBu7z6+SVSndGRQpBv9jBgQH7t4rLgSfdIAleXM8+HdqTJAsj07lL56bpFhZ3UYWBzfjfruWLW0rxAZKj/nISIcY0by6cnHrjl9PwIgLr4rfvzXkC+9dVXN4DCOrkSY9ivi3qq/qwfwLtg7mAICETZGk5k3ClZPLmj+gLjSOAnQDjBH6CdEjl0/1Q==
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
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: 
 AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgAgAAT4YCAAAOjAIAAAPCAgAAXGICAAAPHAIAEnXaA
Date: Thu, 10 Feb 2022 12:59:44 +0000
Message-ID: <6b88e547-5e8c-1f03-1ca7-ac364fb9bb46@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
In-Reply-To: <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a31ed90-af07-4e07-c080-08d9ec9535b5
x-ms-traffictypediagnostic: AM6PR03MB3718:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB37186DED3EF763E79B2F8374E72F9@AM6PR03MB3718.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BRtTlKN0+nD5I4XlBqM3rb7QlspIe6yz9ARdNuc1TV+fjBjcsk69nD7mHxqVg+78ot0ubibIwKgIZdKHnPw8wvSjaf76Vj4tXbd5R/X5U+mP0B7S7V1nANL73kKpS8GUHtcqTsqrFvr+JM76yX43wF4B4ugcQF9/Y6CclZo/ZKsdHnjvQRadBGRCJRAKdZy2Sn7kF+bjORKEhISGDiYFUj8lIMfHT3rNsSY6+Ziymomb/3YC8tfZAP5bcEfM6exG7vEC0JTKw/KKeBXFYG0cthIIQnigefZibmtXjfBNINUnfS3ClEpVqYWbPU1jDK9JniF5G07eKeHLJwZeRdQeU9Vzk+IG5DnRmMVk0gwCRIZXqhzil8p+9lHNgbHd3LXXqPR/VgjWnbMQp2wyUK1LB/6xzu7sGmNOWQzW4UNuRgvOsnteZGyUsVYuJ8GueAxRZVfokd2KyFqzAWAmVOh7qw7O5smPO/m3SpLFEoabddypB4ogkBCq4eaaPADSe7x7RAx8zSpXRnR750rFWpG7MPow34Iz3jKTD1MuDgnRCmCA+/bvFWvudjePJKJT4YqvxKe8WsNO6c52zlMqLl9iYMOQV3WRZnFpkOrygP+7eim82fi928M7DhiIUMCvDpl6YDCv1i4d8ZkGWcR0wNaM4kTZeHPrjrFSi/Zd37oBvYRNETRFW5cRTHVo1d02oX/KRz6b5bR62JRydNBxx5ywc/SIyiipXVDTslu5/CJSaKTy1bOlzFCwU8BAmFkAMh7+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(31686004)(186003)(66556008)(508600001)(64756008)(2616005)(83380400001)(8676002)(6486002)(2906002)(26005)(4326008)(36756003)(53546011)(122000001)(6916009)(5660300002)(76116006)(54906003)(66946007)(316002)(31696002)(38070700005)(66476007)(6512007)(91956017)(66446008)(7416002)(71200400001)(6506007)(107886003)(8936002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NTZDK0tiREZhOUhOWllTUkNmbmk2bFVqai94TXF4RUhyWkxUZ3VYRjBqTEky?=
 =?utf-8?B?enRiSFJyUldXSE00cm1jYVVYQ0psakNGVFloTDBacGJlRGdCeUpqUlBpWnV3?=
 =?utf-8?B?WjlzNUZyNzFKRCtOTFI2YmNNSDJLUW1KMnpNRjdWai9nSHQvTXBwOHBkRUls?=
 =?utf-8?B?TzlRbXdwRWM4STNpSHhjMzdsMmZyUGRYTlFqa3ljVDR1cy84dFhrcndrYkZB?=
 =?utf-8?B?eWdQdjdnOFFWWHVIUTJLSmZHK1MrSWRralhtVTYrVlRLZXMxZjBjVHF0U29t?=
 =?utf-8?B?anZlNEtXRG1LbkkyMXBoT2ZmcVlKalFNRUNVWExVWkRqUWIzTDNkbFhWLzE1?=
 =?utf-8?B?VGdXM0YxbVpaWUVnb2ZGVDR0dGRVMElQekVqa2dhL1pIMzk1djcra0d3bHN6?=
 =?utf-8?B?dnRsdm9UOGw2L3B2UENnbTllclRjTmNaZCtpTDV3SkxlYlVLWE9tOVl2STR2?=
 =?utf-8?B?UVE1ZTY2SGQvQWJFVDI1SURsSjJqNTc4WUM3cHp5UXNKWjRwTUZNV3Z3RDlE?=
 =?utf-8?B?WVFXMUZNU0NORFdaYmYzSGp1ZUc1czFiMGxoZFlDcVphdHNTNXltSEtFWUxC?=
 =?utf-8?B?cVVDOFlreUZuSHNBRVl2L2F4RlhLL3ArK0JOdjg4cnkxUTRpSkhBQ1V1Nkll?=
 =?utf-8?B?eVYvbU5vTkF4NUVnMHlkYmpXYkowRU1jVWVzdVV1OWdEZHF4UzV4QThpVlcx?=
 =?utf-8?B?K2xNbzVDT2txUVBMZ3BuZHB1eDFjYitUMXQ1NzFxR2lZRXRQMXN2TUx2dkRo?=
 =?utf-8?B?S0Y2RUtHbnUzdC9lSDJ2RWpsbXdLckttVFdPUkJBU2JkZWMzTFdGNmQzMm90?=
 =?utf-8?B?VVBpTDgrekFoRmtxV0tQcDlzWGJoaEJ5MjVxaFlVVFZoSW9iOVoxb1h2NHBF?=
 =?utf-8?B?TmVkTDcyRlo2b2w2U1MwandGTWRRa1pTT1RJTzdSVHJLeXRTR3JGZ3pDbWN5?=
 =?utf-8?B?NEoxL1F1WFV5bm9vMFVFdDd2OVVzNnlzTGdJRVlSVHZrT0twaFduL2doMjBX?=
 =?utf-8?B?WS9kblFQWUZKbDhnZ21Ga3EyRVVjMG0xR01VcEZscW0xL2tWa2xKVVZmcFA2?=
 =?utf-8?B?cVZ0TTduYU5EWUhLd050dnJkcUF1ZG5kOWNxQ3J2MjlQOEtmUDQzVjM4Rld5?=
 =?utf-8?B?Q3lPeDNRT2Znc2RmdXRVSGFOM3l4NnRpeitqN2pLb1FWeFhOdkxQUDh2L29r?=
 =?utf-8?B?YSsxK0xMeDdnNDJLZGw3UHlJdnQwVUxjazRrWGxJVGEvOWtDVyt4UlZaREpJ?=
 =?utf-8?B?ZWg0OHJpdGRBcHMraWtucnI4MVlmQkM3NzBTZVRlelBBVHZBTmd4SW82WE5R?=
 =?utf-8?B?WXJ6OS9uM0Y3d1BZOWlwekNac0pnbnRVbExjMGNlcngrMXJWQ2pCdWRuRWdU?=
 =?utf-8?B?K05aS1pPaWN0QzFkckVmQ3Blb1lSOFhGNVIvZkVYbmhiYnNhUHAwb09nTzBq?=
 =?utf-8?B?YjBCRHEzZGRJcjZVamZuLy9XSW82VlhrREgwZVphNzFWQ2JCL2FweUphVXQ4?=
 =?utf-8?B?VlhLNnlRYkN4dFQyTU9hMVdwRjM4MU0ydXJLRnR3TU9uTjNnQWFlVmZYUGhF?=
 =?utf-8?B?YlNIU3dvL0Q4RGZUeVJyMzNRQUsrc1V3R3lIZTNwT21Oc1BPMmtTbW8vdWhF?=
 =?utf-8?B?TnBWUXhjTnZVSTA2bCsrdGRLcGxwc1ZackdJSVBNLzNlZXoxU21wMnRoME5U?=
 =?utf-8?B?d1ljTk13WjhMazh6c1lJUW02VFRJNFMzOXFidGFBT0lWY1Y0Q1JIZUZCU2Ez?=
 =?utf-8?B?bm1GMytseDE2bURXQkxSYXNRTXgyQzJqbVhHTm1NOVZSQ3IwSnJOaUNsUGRD?=
 =?utf-8?B?Tzgwa3dZVm05Skp3Yk5NL2FYV2dYZTEvWWRJUHdhMUc1THk0UWJ3MUVleVFU?=
 =?utf-8?B?eDgvOVpBRUs2L1o2aDFGMmFUbXViRVdWMithbWY4TTN5TmtKcWhrRXpiamc4?=
 =?utf-8?B?U0pWdHExMmtCVFRCWjhOOFhEMm8wZWh5ZVFOSlBuRVFyRnp6cU9ZSGYxeU1z?=
 =?utf-8?B?d254VWg4aGwzREw1bW16VkxMVFBwZDBjWHpPcGl4R3FWU1ovZmY5NTl2R0R3?=
 =?utf-8?B?VGpWWEhad0EvRDZSVVJKbm5rNDJaV3dobGprVmhGLzJQUG4rNU5uTkxZRUJD?=
 =?utf-8?B?NXhEdEJZUnF5aHBnNGpRYjAwV0RWcXpIbDd0R3Z5dW5Rb001Mi9UM21tSW9J?=
 =?utf-8?B?Y2plZlo4VitKbjkweXc4VEFQMXFMbHFXRWhjejBvY25oVlQ1QVV2NFAvaXFl?=
 =?utf-8?B?bEtuMCtMcjNKMDNQQjBlWWlOZXdpUVE4RXI5YTF0MDhwLzRDRHV6akk3UzMw?=
 =?utf-8?B?by9GTXBBQmZyZmtqdlFSU2ViZVJHaFN0MUNjbHdpaUV1Njdzb0pHdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A79802229F4A454AB4B47016682667FE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a31ed90-af07-4e07-c080-08d9ec9535b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 12:59:44.4553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjuLyjrjoUU1LrQ3ZYt9zYxAxerHpnCbvgZP72R2riHFn4mryP8zxWqy1NGbcUpFU1R4MZfhiESl/b9BAixeX7Eo1ekjm+9gwB575Oa80i/BGv/VNz5k3lHgJCXtKVOC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3718
X-Proofpoint-ORIG-GUID: LZfsspuWv2q9TfYkUCj44JcAv2yTFx3K
X-Proofpoint-GUID: LZfsspuWv2q9TfYkUCj44JcAv2yTFx3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100071

DQoNCk9uIDA3LjAyLjIyIDE2OjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNToxNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDcuMDIu
MjIgMTQ6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAyLjIwMjIgMTM6NTEsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wMi4yMiAxNDozOCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wMi4yMDIyIDEyOjI3LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNy4wMi4yMiAwOToyOSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMTU6MzcsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMDQuMDIuMjIgMTY6MzAsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOg0KPj4+Pj4+Pj4+PiBSZXNldCB0aGUgY29tbWFuZCByZWdpc3RlciB3aGVuIGFzc2ln
bmluZyBhIFBDSSBkZXZpY2UgdG8gYSBndWVzdDoNCj4+Pj4+Pj4+Pj4gYWNjb3JkaW5nIHRvIHRo
ZSBQQ0kgc3BlYyB0aGUgUENJX0NPTU1BTkQgcmVnaXN0ZXIgaXMgdHlwaWNhbGx5IGFsbCAwJ3MN
Cj4+Pj4+Pj4+Pj4gYWZ0ZXIgcmVzZXQuDQo+Pj4+Pj4+Pj4gSXQncyBub3QgZW50aXJlbHkgY2xl
YXIgdG8gbWUgd2hldGhlciBzZXR0aW5nIHRoZSBoYXJkd2FyZSByZWdpc3RlciB0bw0KPj4+Pj4+
Pj4+IHplcm8gaXMgb2theS4gV2hhdCB3YW50cyB0byBiZSB6ZXJvIGlzIHRoZSB2YWx1ZSB0aGUg
Z3Vlc3Qgb2JzZXJ2ZXMNCj4+Pj4+Pj4+PiBpbml0aWFsbHkuDQo+Pj4+Pj4+PiAidGhlIFBDSSBz
cGVjIHNheXMgdGhlIFBDSV9DT01NQU5EIHJlZ2lzdGVyIGlzIHR5cGljYWxseSBhbGwgMCdzIGFm
dGVyIHJlc2V0LiINCj4+Pj4+Pj4+IFdoeSB3b3VsZG4ndCBpdCBiZSBvaz8gV2hhdCBpcyB0aGUg
ZXhhY3QgY29uY2VybiBoZXJlPw0KPj4+Pj4+PiBUaGUgY29uY2VybiBpcyAtIGFzIHZvaWNlZCBp
cyBzaW1pbGFyIHdheXMgYmVmb3JlLCBwZXJoYXBzIGluIG90aGVyDQo+Pj4+Pj4+IGNvbnRleHRz
IC0gdGhhdCB5b3UgbmVlZCB0byBjb25zaWRlciBiaXQtYnktYml0IHdoZXRoZXIgb3ZlcndyaXRp
bmcNCj4+Pj4+Pj4gd2l0aCAwIHdoYXQgaXMgY3VycmVudGx5IHRoZXJlIGlzIG9rYXkuIFhlbiBh
bmQvb3IgRG9tMCBtYXkgaGF2ZSBwdXQNCj4+Pj4+Pj4gdmFsdWVzIHRoZXJlIHdoaWNoIHRoZXkg
ZXhwZWN0IHRvIHJlbWFpbiB1bmFsdGVyZWQuIEkgZ3Vlc3MNCj4+Pj4+Pj4gUENJX0NPTU1BTkRf
U0VSUiBpcyBhIGdvb2QgZXhhbXBsZTogV2hpbGUgdGhlIGd1ZXN0J3MgdmlldyBvZiB0aGlzDQo+
Pj4+Pj4+IHdpbGwgd2FudCB0byBiZSB6ZXJvIGluaXRpYWxseSwgdGhlIGhvc3QgaGF2aW5nIHNl
dCBpdCB0byAxIG1heSBub3QNCj4+Pj4+Pj4gZWFzaWx5IGJlIG92ZXJ3cml0dGVuIHdpdGggMCwg
b3IgZWxzZSB5b3UnZCBlZmZlY3RpdmVseSBpbXBseSBnaXZpbmcNCj4+Pj4+Pj4gdGhlIGd1ZXN0
IGNvbnRyb2wgb2YgdGhlIGJpdC4NCj4+Pj4+PiBXZSBoYXZlIGFscmVhZHkgZGlzY3Vzc2VkIGlu
IGdyZWF0IGRldGFpbCBQQ0lfQ09NTUFORCBlbXVsYXRpb24gWzFdLg0KPj4+Pj4+IEF0IHRoZSBl
bmQgeW91IHdyb3RlIFsxXToNCj4+Pj4+PiAiV2VsbCwgaW4gb3JkZXIgZm9yIHRoZSB3aG9sZSB0
aGluZyB0byBiZSBzZWN1cml0eSBzdXBwb3J0ZWQgaXQgbmVlZHMgdG8NCj4+Pj4+PiBiZSBleHBs
YWluZWQgZm9yIGV2ZXJ5IGJpdCB3aHkgaXQgaXMgc2FmZSB0byBhbGxvdyB0aGUgZ3Vlc3QgdG8g
ZHJpdmUgaXQuDQo+Pj4+Pj4gVW50aWwgeW91IG1lYW4gdlBDSSB0byByZWFjaCB0aGF0IHN0YXRl
LCBsZWF2aW5nIFRPRE8gbm90ZXMgaW4gdGhlIGNvZGUNCj4+Pj4+PiBmb3IgYW55dGhpbmcgbm90
IGludmVzdGlnYXRlZCBtYXkgaW5kZWVkIGJlIGdvb2QgZW5vdWdoLg0KPj4+Pj4+DQo+Pj4+Pj4g
SmFuIg0KPj4+Pj4+DQo+Pj4+Pj4gU28sIHRoaXMgaXMgd2h5IEkgbGVmdCBhIFRPRE8gaW4gdGhl
IFBDSV9DT01NQU5EIGVtdWxhdGlvbiBmb3Igbm93IGFuZCBvbmx5DQo+Pj4+Pj4gY2FyZSBhYm91
dCBJTlR4IHdoaWNoIGlzIGhvbm9yZWQgd2l0aCB0aGUgY29kZSBpbiB0aGlzIHBhdGNoLg0KPj4+
Pj4gUmlnaHQuIFRoZSBpc3N1ZSBJIHNlZSBpcyB0aGF0IHRoZSBkZXNjcmlwdGlvbiBkb2VzIG5v
dCBoYXZlIGFueQ0KPj4+Pj4gbWVudGlvbiBvZiB0aGlzLCBidXQgaW5zdGVhZCB0YWxrcyBhYm91
dCBzaW1wbHkgd3JpdGluZyB6ZXJvLg0KPj4+PiBIb3cgZG8geW91IHdhbnQgdGhhdCBtZW50aW9u
ZWQ/IEV4dGVuZGVkIGNvbW1pdCBtZXNzYWdlIG9yDQo+Pj4+IGp1c3QgYSBsaW5rIHRvIHRoZSB0
aHJlYWQgWzFdPw0KPj4+IFdoYXQgSSdkIGxpa2UgeW91IHRvIGRlc2NyaWJlIGlzIHdoYXQgdGhl
IGNoYW5nZSBkb2VzIHdpdGhvdXQNCj4+PiBmdW5kYW1lbnRhbGx5IGltcGx5aW5nIGl0J2xsIGVu
ZCB1cCBiZWluZyB6ZXJvIHdoaWNoIGdldHMgd3JpdHRlbg0KPj4+IHRvIHRoZSByZWdpc3Rlci4g
U3RhdGluZyBhcyBhIGNvbmNsdXNpb24gdGhhdCBmb3IgdGhlIHRpbWUgYmVpbmcNCj4+PiB0aGlz
IG1lYW5zIHdyaXRpbmcgemVybyBpcyBjZXJ0YWlubHkgZmluZSAoYW5kIGxpa2VseSBoZWxwZnVs
IGlmDQo+Pj4gbWFkZSBleHBsaWNpdCkuDQo+PiBYZW4gYW5kL29yIERvbTAgbWF5IGhhdmUgcHV0
IHZhbHVlcyBpbiBQQ0lfQ09NTUFORCB3aGljaCB0aGV5IGV4cGVjdA0KPj4gdG8gcmVtYWluIHVu
YWx0ZXJlZC4gUENJX0NPTU1BTkRfU0VSUiBiaXQgaXMgYSBnb29kIGV4YW1wbGU6IHdoaWxlIHRo
ZQ0KPj4gZ3Vlc3QncyB2aWV3IG9mIHRoaXMgd2lsbCB3YW50IHRvIGJlIHplcm8gaW5pdGlhbGx5
LCB0aGUgaG9zdCBoYXZpbmcgc2V0DQo+PiBpdCB0byAxIG1heSBub3QgZWFzaWx5IGJlIG92ZXJ3
cml0dGVuIHdpdGggMCwgb3IgZWxzZSB3ZSdkIGVmZmVjdGl2ZWx5DQo+PiBpbXBseSBnaXZpbmcg
dGhlIGd1ZXN0IGNvbnRyb2wgb2YgdGhlIGJpdC4gVGh1cywgUENJX0NPTU1BTkQgcmVnaXN0ZXIg
bmVlZHMNCj4+IHByb3BlciBlbXVsYXRpb24gaW4gb3JkZXIgdG8gaG9ub3IgaG9zdCdzIHNldHRp
bmdzLg0KPj4NCj4+IFRoZXJlIGFyZSBleGFtcGxlcyBvZiBlbXVsYXRvcnMgWzFdLCBbMl0gd2hp
Y2ggYWxyZWFkeSBkZWFsIHdpdGggUENJX0NPTU1BTkQNCj4+IHJlZ2lzdGVyIGVtdWxhdGlvbiBh
bmQgaXQgc2VlbXMgdGhhdCBhdCBtb3N0IHRoZXkgY2FyZSBhYm91dCB0aGUgb25seSBJTlRYDQo+
PiBiaXQgKGJlc2lkZXMgSU8vbWVtb3J5IGVuYWJsZSBhbmQgYnVzIG11c3RlciB3aGljaCBhcmUg
d3JpdGUgdGhyb3VnaCkuDQo+PiBJdCBjb3VsZCBiZSBiZWNhdXNlIGluIG9yZGVyIHRvIHByb3Bl
cmx5IGVtdWxhdGUgdGhlIFBDSV9DT01NQU5EIHJlZ2lzdGVyDQo+PiB3ZSBuZWVkIHRvIGtub3cg
YWJvdXQgdGhlIHdob2xlIFBDSSB0b3BvbG9neSwgZS5nLiBpZiBhbnkgc2V0dGluZyBpbiBkZXZp
Y2Uncw0KPj4gY29tbWFuZCByZWdpc3RlciBpcyBhbGlnbmVkIHdpdGggdGhlIHVwc3RyZWFtIHBv
cnQgZXRjLg0KPj4gVGhpcyBtYWtlcyBtZSB0aGluayB0aGF0IGJlY2F1c2Ugb2YgdGhpcyBjb21w
bGV4aXR5IG90aGVycyBqdXN0IGlnbm9yZSB0aGF0Lg0KPj4gTmVpdGhlciBJIHRoaW5rIHRoaXMg
Y2FuIGJlIGVhc2lseSBkb25lIGluIFhlbiBjYXNlLg0KPj4NCj4+IEFjY29yZGluZyB0byAiUENJ
IExPQ0FMIEJVUyBTUEVDSUZJQ0FUSU9OLCBSRVYuIDMuMCIsIHNlY3Rpb24gIjYuMi4yDQo+PiBE
ZXZpY2UgQ29udHJvbCIgc2F5cyB0aGF0IHRoZSByZXNldCBzdGF0ZSBvZiB0aGUgY29tbWFuZCBy
ZWdpc3RlciBpcw0KPj4gdHlwaWNhbGx5IDAsIHNvIHJlc2V0IHRoZSBjb21tYW5kIHJlZ2lzdGVy
IHdoZW4gYXNzaWduaW5nIGEgUENJIGRldmljZQ0KPj4gdG8gYSBndWVzdCB0IGFsbCAwJ3MgYW5k
IGZvciBub3cgb25seSBtYWtlIHN1cmUgSU5UeCBiaXQgaXMgc2V0IGFjY29yZGluZw0KPj4gdG8g
aWYgTVNJL01TSS1YIGVuYWJsZWQuDQo+ICIuLi4gaXMgdHlwaWNhbGx5IDAsIHNvIHdoZW4gYXNz
aWduaW5nIGEgUENJIGRldmljZSByZXNldCB0aGUgZ3Vlc3QgdmlldyBvZg0KPiAgIHRoZSBjb21t
YW5kIHJlZ2lzdGVyIHRvIGFsbCAwJ3MuIEZvciBub3cgb3VyIGVtdWxhdGlvbiBvbmx5IG1ha2Vz
IHN1cmUgSU5UeA0KPiAgIGlzIHNldCBhY2NvcmRpbmcgdG8gaG9zdCByZXF1aXJlbWVudHMsIGku
ZS4gZGVwZW5kaW5nIG9uIE1TSS9NU0ktWCBlbmFibGVkDQo+ICAgc3RhdGUuIg0KSSdsbCBwdXQg
dGhpcyBkZXNjcmlwdGlvbiBpbnRvIFBDSV9DT01NQU5EIGVtdWxhdGlvbiBwYXRjaA0KPg0KPiBN
YXliZT8gKE9idmlvdXNseSBhIGZyZXNoIGRldmljZSBnaXZlbiB0byBhIGd1ZXN0IHdpbGwgaGF2
ZSBNU0kvTVNJLVgNCj4gZGlzYWJsZWQsIHNvIEknbSBub3Qgc3VyZSB0aGF0IGFzcGVjdCByZWFs
bHkgbmVlZHMgbWVudGlvbmluZy4pDQo+DQo+IEJ1dDogV2hhdCdzIHN0aWxsIG1pc3NpbmcgaGVy
ZSB0aGVuIGlzIHRoZSBzZXBhcmF0aW9uIG9mIGd1ZXN0IGFuZCBob3N0DQo+IHZpZXdzLiBXaGVu
IHdlIHNldCBJTlR4IGJlaGluZCB0aGUgZ3Vlc3QncyBiYWNrLCBpdCBzaG91bGRuJ3Qgb2JzZXJ2
ZSB0aGUNCj4gYml0IHNldC4gT3IgaXMgdGhpcyBtZWFudCB0byBiZSBhbm90aGVyIChiaWcpIFRP
RE8/DQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

