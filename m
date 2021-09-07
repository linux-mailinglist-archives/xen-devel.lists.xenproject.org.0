Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2234029C6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181048.328016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbEo-0002rg-2c; Tue, 07 Sep 2021 13:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181048.328016; Tue, 07 Sep 2021 13:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbEn-0002oe-V3; Tue, 07 Sep 2021 13:34:09 +0000
Received: by outflank-mailman (input) for mailman id 181048;
 Tue, 07 Sep 2021 13:34:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNbEm-0002oW-QY
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:34:09 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4660a422-0fe0-11ec-b0f3-12813bfff9fa;
 Tue, 07 Sep 2021 13:34:07 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 187Bh1rU005659; 
 Tue, 7 Sep 2021 13:34:04 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ax5pm0sg4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 13:34:04 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB7159.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Tue, 7 Sep
 2021 13:33:58 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 13:33:58 +0000
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
X-Inumbo-ID: 4660a422-0fe0-11ec-b0f3-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6B/+dyscpm3VB+2Vgeqw1WFBxAhB8MYDLlNwN2qAjSohNb09W0AC7G3qPoKIem9V1iR3GeFM3HsjNrtMDL89Luykv6eu0TnWkFPspR5tLshkD9KCTOgsOD9jD5DI9vujdshVrE3MHA7Jhjw3QHLvHQEywqHztYl2N/xFfE5imCwFlNyx4x27HS3uJ89kuPah7IpYgnMe9jZ5vquqljxvez68GEykhQLxYexpDUDlM2QFkGNqcTTYUz56ZeqW/P7s0rLufXPN6gDtCc6Jn325Uwf4L2CuGd+RJ0PCIv4Bdu7LsGURA/koz/iuvD2F2w1TjmPgxGIO5uoyi/9FptItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5BdAiv68cInWy+SgVNonoK3SC21/xHs/t4Ug12IeLdM=;
 b=gATdMFuKb0jXbZrtmMFtoQYTxVym/5H0DF14aka3BSFXzSjNme5KF5XUCW1/TQvC7MRkePA35/oM8JDL41/PihmDTorrErQ98nmga4xNXgQmPveqdKJcK4ShkB7Ajn4WygSnKmYjziX9sY0kkNyFS8Z4NGmq9Aztjl5z4Tj84L7+co/XglFII6dGr1q16YlpoAIVrCp3NVwqsVtNy2bQajZlJCVNHI4oXO/695usSijmfGvUz36A7zGvAPlne5SolMIi+4+9qw6Ml/cvcO2TRKkxOEZTZ2uJMfvV6jZ+WKGMePP3xvrBtisgy8Sbxo4rYV0cirhL7xY8NTxQR6KKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BdAiv68cInWy+SgVNonoK3SC21/xHs/t4Ug12IeLdM=;
 b=sVbJgih1zSDbeO54y1a1oAtJUR1rlz+8L/UUk1sgUZvKTAYFdaqI1+ljqQlpZ3zj+wiJRJ0LVFv7+16FFlD3OiPdABQh0tjgQp8SnlftKDHpjujylmBAe4ehvnb8ECb0Inaq3WMke+kvJpkPdmSvEaf2t8CvLnGyY+54Qu4RX7dSW4eUmioy0L/HY6LFc23xZM5L+C/IJOSVdGOkfm/SGfepdLMzDAkeNQRCAiIUamr+On6qTUhBsdS4stmCpGgWawSqjL79qsOMefXapMayWfEO7tpeIWgiYvvHdgby/UWgRH5E7MtLSARo7PBg31YhyOFvltwgOAHlm1K70Ijx6A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Topic: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Index: AQHXoKxmxnIdZosa7ESbvTmPlG6KHauXFn+AgAGCLIA=
Date: Tue, 7 Sep 2021 13:33:57 +0000
Message-ID: <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
In-Reply-To: <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2af00d5c-e119-42a4-0ea1-08d972042545
x-ms-traffictypediagnostic: AS8PR03MB7159:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB7159EE71E1FE6434E27E76FBE7D39@AS8PR03MB7159.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hBFoENzXgo0ZlJHRFSRY7zsIgq3NkT5KL5ZlAG6Lvs8elEmvhLdth2C9YkR8ZiW+LeqTLakVsxXWn6DxbDyhJdz9e8hi8pheacg7bJmBrvtixakZnAjMmbY6y7EccHRDoj8BtgZ8l1n0LUABcg8yDwyzlmEvUotIU4aiGojU2ZZxidafN/6UQCzwDuQHTMnXWWa1GhAH+nE1Y2pzDQtNmcXSyj/ESR/43UOqIuy/KEpRurR0saDcIwtXoRoX+4U0gDhHLS8tAgFLQWgn3OoDXchoi8FRe0DS9vYvMmiuEYJD2n2UHa+cPIwvm4ej1fYVeooYTTMHT+FA80RrmTDbtp9qndXz/x5wsJieL1GMedpuw65fsbKz5Hu0m2lpQKgkq6iPgBoykYgF89BLUDsREEfpFT4CUzrzhXWkhbkMElUrEj6UGNmURIiloKfkNTgbwgcdKqFhcDzCgrjfzrJVttb8XpJZYknSOW1uCY8kKCQuND1Pl11VpKq2oo//La3qIyy8pawmmbXEgH+lId+jCsiWmWNRcInShyI+SWlTyHal3W3yc8jhzUYXJHsYSo/OmqNBKF2i6E6VG6pwwemnQlPXZ5Vh3txl9qsXZVbZEokvBszBdoCdY2YDqYmzHgLSQ/4jd/zgSfEECpjq8eRUhX4T2dve9ejScgmpqJd3vkJPp5n8WnUfQqIxFc0Bsm0irzFAkNnskGJ6i/rtS2IadSot6WuV2Fyh/ousTkupg08Ck5YiDL4N19jJOYnU1+PS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(122000001)(316002)(4326008)(6512007)(83380400001)(38100700002)(86362001)(8936002)(53546011)(76116006)(6506007)(31686004)(36756003)(66946007)(91956017)(66446008)(66556008)(38070700005)(2616005)(66476007)(64756008)(5660300002)(2906002)(8676002)(6486002)(478600001)(54906003)(71200400001)(186003)(31696002)(26005)(110136005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVdYY1FiTmxmTFJRWWM2cWhFQXVJOHNHdlFyajBZS3pML292V0g4Z3NEVG9B?=
 =?utf-8?B?MDJhV3JMTHhJUjRPK0I5YTlIZEFmRzRtMG5rQ3FIRThkMzVOMjlIbVMrVVNH?=
 =?utf-8?B?VVoxSjc0b0k1dmszRkFmNCtiQmtlTkFJV3RHMm9rYTRnZUdDLzFUVEdKMTBH?=
 =?utf-8?B?N1B2SGg3bS81VS8razN4d0JUeW9vcGhaaUxQUjJ6WVZlbUdtKzJaeEoxRXpv?=
 =?utf-8?B?aFdTSmtxQmJ5MFQ3MzFrWnUxTUwzUWFRWHJEa1V2RmdOUkdHL3hOTHNmdmMx?=
 =?utf-8?B?cktWVTZtV2l6eFpwaXlEY1RzbzVYOHJMWUF2THFIc1JaUWFWQTRZWjJ0V0No?=
 =?utf-8?B?QlVCbWw5RlBBU3VVMHBlWEZIbmJVQkx4cnF2T2ZwRCtZU01KWlJ1T3huYWFE?=
 =?utf-8?B?amJVMkVGeUJoT045OE5tZkdrK3R3RjFRTDVMQVNvTERDeUs1bmxjaHlKM0xy?=
 =?utf-8?B?TEg4VFZzdXJFSVJmS2hnQ0lvdUhYS29Ram5ESkdMdnVDTE5ZbmliR1ZiMmY0?=
 =?utf-8?B?QVF6WkV0T2Z3eUo2OHBibXVSMTdZNDBFV2ZOWHk5b0JPWjJtOGRwdmFnUldj?=
 =?utf-8?B?R2srbTR4SEE0am5JUnA5UXFMYmUzaXBMTFhYM1pUNTRSUXk3NjNXMlpROHox?=
 =?utf-8?B?ZFk4b0NwTkFPdkVaZXBGNmwxYWJMTkM5eEhCWEIra05ocmhYMVpENjJ1NnJw?=
 =?utf-8?B?UXJsQXkwSkxqVUFoL3p1Z1VnSjhhd2hFeS80WDI3OVRxTWxSbVhpRG1sL29s?=
 =?utf-8?B?bnBYQU1QV2hvVFJKbVFvQWR6RlRBbmJmT1NjNjk5RkFiZStySFNCdWdDTkVH?=
 =?utf-8?B?aG1DSUZJc2x4TGJzVk9TTS9uRnQ3Nk1FQTJ4NTVYcWF1VVJ4ZWE4LzhNMytG?=
 =?utf-8?B?ZW0ybWZ0dy9Icmx5S0tkOEVuNitMdHlsNVV3Mit6Z2pvZ1k2alp2QkVtWmhP?=
 =?utf-8?B?dUxMT2dPdGZzelNlbXhZdGtrbHBlZlZRU2puakxvaUZ4blJkZE1LeGxXN1px?=
 =?utf-8?B?K0tPUmlGa3FiMFM1VEJ1aU94eE9VYnROY3pDbzN1OStORHpxak95SUhPbmJR?=
 =?utf-8?B?UCtzc2dtMGNtakdIMnFyck9Ddno0SDJ1WnNvdXhRNFc5c2dzYjJscU5VVFV1?=
 =?utf-8?B?Rm5pVFoxV0VPL0JuTFBTL0dsTCtZNjF4WnJ5WXdCWm1VS0dpMTBUVE1PR2lq?=
 =?utf-8?B?UWFjOElMMXRmbXQ1WVJxcEFNdk9wTit1KzBnZTRIZ1NMWGlUbEkxZTVLbTlh?=
 =?utf-8?B?VWtzMEt2TEtqRG1zSkhmNjY5Y1lLM0ZyNlJQWlh4WFF2dnY2UlZHalZ2bVF4?=
 =?utf-8?B?OFJYMDlPbU5Jc0ZpWUFraW9WZXhjNjNTcEUzVWYzNUFZZ0JpbXdEMCtVaFM0?=
 =?utf-8?B?c1g5ZC9nUFJCLzVuVlhMa0Q4L3BLemQ4VkljdWpoT2xIdlFSa0Z4S2xZaDFz?=
 =?utf-8?B?Wm5ncnA5c1A4QTZTK1AvcEpQL2NxZmhINUhtTnlpWlRTSFV3RFY1ZXc5MnNa?=
 =?utf-8?B?WFBzV1ltT1NWT2x4MVQ4T0dYWDc3M1VmSS9MTGtkbm5STldIOVpYeXBoV1Bz?=
 =?utf-8?B?WVFjenl0L0ZSaFlKaEdMQTg0SExQZ0dsRjF4WkpMUlV4SW94cDAxVVpMWmFq?=
 =?utf-8?B?Y1QrU2M0RjJ4WkZvcjNoSE9TR2d4K0NjWEg1LzBMU0lac0RRelp1bUNOckds?=
 =?utf-8?B?eTdGSHdPRnNWMUpOdW9QRytTVlhnMEV2bVlHeTlHbkpXQlFvMG45ZTUxc1Uz?=
 =?utf-8?Q?3U8VLTfm3zyM9ai5cT+4IR2bRjDPtqU3v5MF/HT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <995FE7DEF132A749BF2A3236800428AA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af00d5c-e119-42a4-0ea1-08d972042545
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 13:33:57.9268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzsWDOHCWVIzVzS/8f8/vmIcxQ6idB4UBV1AVB4paQ9QcIPy0epgWWCr/AXIz+VrgJCTyJIEyKMM/fupY5A3LplkStKtx4jN93t2IcfuzAumZNZvaNIhq53Q+LqMqjS2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-ORIG-GUID: 91UDs_AjfZv1rEiZ5LKmJI1LQgo0nJbR
X-Proofpoint-GUID: 91UDs_AjfZv1rEiZ5LKmJI1LQgo0nJbR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_04,2021-09-07_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070089

DQpPbiAwNi4wOS4yMSAxNzozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjA5LjIwMjEg
MTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gLS0tIGEveGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4g
QEAgLTQwMCwxMiArNDAwLDcyIEBAIHN0YXRpYyB2b2lkIGJhcl93cml0ZShjb25zdCBzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICAgc3RhdGljIHZvaWQgZ3Vlc3Rf
YmFyX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmFsLCB2b2lkICpkYXRh
KQ0KPj4gICB7DQo+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gZGF0YTsNCj4+ICsgICAg
Ym9vbCBoaSA9IGZhbHNlOw0KPj4gKw0KPj4gKyAgICBpZiAoIGJhci0+dHlwZSA9PSBWUENJX0JB
Ul9NRU02NF9ISSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIEFTU0VSVChyZWcgPiBQQ0lfQkFT
RV9BRERSRVNTXzApOw0KPj4gKyAgICAgICAgYmFyLS07DQo+PiArICAgICAgICBoaSA9IHRydWU7
DQo+PiArICAgIH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICAgICAgdmFsICY9IFBDSV9CQVNFX0FE
RFJFU1NfTUVNX01BU0s7DQo+PiArICAgIGJhci0+Z3Vlc3RfYWRkciAmPSB+KDB4ZmZmZmZmZmZ1
bGwgPDwgKGhpID8gMzIgOiAwKSk7DQo+PiArICAgIGJhci0+Z3Vlc3RfYWRkciB8PSAodWludDY0
X3QpdmFsIDw8IChoaSA/IDMyIDogMCk7DQo+IFdoYXQgeW91IHN0b3JlIGhlcmUgaXMgbm90IHRo
ZSBhZGRyZXNzIHRoYXQncyBnb2luZyB0byBiZSB1c2VkLA0KDQpiYXItPmd1ZXN0X2FkZHIgaXMg
bmV2ZXIgdXNlZCBkaXJlY3RseSB0byBiZSByZXBvcnRlZCB0byBhIGd1ZXN0Lg0KDQpUaGUgc2Ft
ZSBhcyBiYXItPmFkZHIgaXMgbmV2ZXIgdXNlZCB0byB3cml0ZSB0byByZWFsIEJBUi4NCg0KSXQg
aXMgYWx3YXlzIHVzZWQgYXMgYW4gaW5pdGlhbCB2YWx1ZSB3aGljaCBpcyB0aGVuIG1vZGlmaWVk
IHRvIHJlZmxlY3QNCg0KbG93ZXIgYml0cywgZS5nLiBCQVIgdHlwZSBhbmQgaWYgcHJlZmV0Y2hh
YmxlLCBzbyBJIHRoaW5rIHRoaXMgaXMgcGVyZmVjdGx5DQoNCmZpbmUgdG8gaGF2ZSBpdCB0aGlz
IHdheS4NCg0KPiAgIGFzDQo+IHlvdSBkb24ndCBtYXNrIG9mZiB0aGUgbG93IGJpdHMgKHRvIGFj
Y291bnQgZm9yIHRoZSBCQVIncyBzaXplKS4NCj4gV2hlbiBhIEJBUiBnZXRzIHdyaXR0ZW4gd2l0
aCBhbGwgb25lcywgYWxsIHdyaXRhYmxlIGJpdHMgZ2V0IHRoZXNlDQo+IG9uZXMgc3RvcmVkLiBU
aGUgYWRkcmVzcyBvZiB0aGUgQkFSLCBhaXVpLCByZWFsbHkgY2hhbmdlcyB0bw0KPiAodHlwaWNh
bGx5KSBjbG9zZSBiZWxvdyA0R2IgKGluIHRoZSBjYXNlIG9mIGEgMzItYml0IEJBUiksIHdoaWNo
DQo+IGlzIHdoeSBtZW1vcnkgLyBJL08gZGVjb2Rpbmcgc2hvdWxkIGJlIG9mZiB3aGlsZSBzaXpp
bmcgQkFScy4NCj4gVGhlcmVmb3JlIHlvdSBzaG91bGRuJ3QgbG9vayBmb3IgdGhlIHNwZWNpZmlj
ICJhbGwgd3JpdGFibGUgYml0cw0KPiBhcmUgb25lcyIgcGF0dGVybiAob3Igd29yc2UsIGFzIHlv
dSBwcmVzZW50bHkgZG8sIHRoZSAiYWxsIGJpdHMNCj4gb3V0c2lkZSBvZiB0aGUgdHlwZSBzcGVj
aWZpZXIgYXJlIG9uZXMiIG9uZSkgb24gdGhlIHJlYWQgcGF0aC4NCj4gSW5zdGVhZCBtYXNrIHRo
ZSB2YWx1ZSBhcHByb3ByaWF0ZWx5IGhlcmUsIGFuZCBzaW1wbHkgcmV0dXJuIGJhY2sNCj4gdGhl
IHN0b3JlZCB2YWx1ZSBmcm9tIHRoZSByZWFkIHBhdGguDQoiUENJIExPQ0FMIEJVUyBTUEVDSUZJ
Q0FUSU9OLCBSRVYuIDMuMCIsICJJTVBMRU1FTlRBVElPTiBOT1RFDQoNClNpemluZyBhIDMyLWJp
dCBCYXNlIEFkZHJlc3MgUmVnaXN0ZXIgRXhhbXBsZSIgc2F5cywgdGhhdA0KDQoiU29mdHdhcmUg
c2F2ZXMgdGhlIG9yaWdpbmFsIHZhbHVlIG9mIHRoZSBCYXNlIEFkZHJlc3MgcmVnaXN0ZXIsIHdy
aXRlcw0KMCBGRkZGIEZGRkZoIHRvIHRoZSByZWdpc3RlciwgdGhlbiByZWFkcyBpdCBiYWNrLiIN
Cg0KVGhlIHNhbWUgYXBwbGllcyBmb3IgNjQtYml0IEJBUnMuIFNvIHdoYXQncyB3cm9uZyBpZiBJ
IHRyeSB0byBjYXRjaCBzdWNoDQoNCmEgd3JpdGUgd2hlbiBhIGd1ZXN0IHRyaWVzIHRvIHNpemUg
dGhlIEJBUj8gVGhlIG9ubHkgZGlmZmVyZW5jZSBpcyB0aGF0DQoNCkkgY29tcGFyZSBhcw0KDQog
wqDCoMKgwqDCoMKgwqAgaWYgKCAodmFsICYgUENJX0JBU0VfQUREUkVTU19NRU1fTUFTS18zMikg
PT0gUENJX0JBU0VfQUREUkVTU19NRU1fTUFTS18zMiApDQp3aGljaCBpcyBiZWNhdXNlIHZhbCBp
biB0aGUgcXVlc3Rpb24gaGFzIGxvd2VyIGJpdHMgY2xlYXJlZC4NCg0KV2l0aCB0aGF0IHJlc3Bl
Y3QgSSBzZWUgbm8gb2J2aW91cyByZWFzb24gd2h5IHdlIGNhbid0IGNvbnN0cnVjdCBvdXIgY29k
ZQ0KDQphcyBpdCBpcy4NCg0KPg0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgdWludDMyX3Qg
Z3Vlc3RfYmFyX3JlYWQoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCBy
ZWcsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQ0KPj4g
ICB7DQo+PiAtICAgIHJldHVybiAweGZmZmZmZmZmOw0KPj4gKyAgICBzdHJ1Y3QgdnBjaV9iYXIg
KmJhciA9IGRhdGE7DQo+PiArICAgIHVpbnQzMl90IHZhbDsNCj4+ICsgICAgYm9vbCBoaSA9IGZh
bHNlOw0KPj4gKw0KPj4gKyAgICBzd2l0Y2ggKCBiYXItPnR5cGUgKQ0KPj4gKyAgICB7DQo+PiAr
ICAgIGNhc2UgVlBDSV9CQVJfTUVNNjRfSEk6DQo+PiArICAgICAgICBBU1NFUlQocmVnID4gUENJ
X0JBU0VfQUREUkVTU18wKTsNCj4+ICsgICAgICAgIGJhci0tOw0KPj4gKyAgICAgICAgaGkgPSB0
cnVlOw0KPj4gKyAgICAgICAgLyogZmFsbHRocm91Z2ggKi8NCj4+ICsgICAgY2FzZSBWUENJX0JB
Ul9NRU02NF9MTzoNCj4+ICsgICAgew0KPiBQbGVhc2UgZG9uJ3QgYWRkIGJyYWNlcyB0byBjYXNl
IGJsb2NrcyB3aGVuIHRoZXkncmUgbm90IG5lZWRlZC4NClN1cmUNCj4NCj4+ICsgICAgICAgIGlm
ICggaGkgKQ0KPj4gKyAgICAgICAgICAgIHZhbCA9IGJhci0+Z3Vlc3RfYWRkciA+PiAzMjsNCj4+
ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAgICB2YWwgPSBiYXItPmd1ZXN0X2FkZHIgJiAw
eGZmZmZmZmZmOw0KPj4gKyAgICAgICAgaWYgKCAodmFsICYgUENJX0JBU0VfQUREUkVTU19NRU1f
TUFTS18zMikgPT0gIFBDSV9CQVNFX0FERFJFU1NfTUVNX01BU0tfMzIgKQ0KPiBUaGlzIGlzIHdy
b25nIHdoZW4gZmFsbGluZyB0aHJvdWdoIHRvIGhlcmUgZnJvbSBWUENJX0JBUl9NRU02NF9ISToN
Cj4gQWxsIDMyIGJpdHMgbmVlZCB0byBiZSBsb29rZWQgYXQuDQpHb29kIGNhdGNoLCB3aWxsIGZp
eA0KPiAgIFlldCBhcyBwZXIgdGhlIGNvbW1lbnQgZnVydGhlcg0KPiB1cCBJIHRoaW5rIGl0IGlz
bid0IHJpZ2h0IGFueXdheSB0byBhcHBseSB0aGUgbWFzayBoZXJlLg0KPg0KPiBBbHNvOiBTdHJh
eSBkb3VibGUgYmxhbmtzLg0KPg0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIC8qIEd1
ZXN0cyBkZXRlY3RzIEJBUidzIHByb3BlcnRpZXMgYW5kIHNpemVzLiAqLw0KPj4gKyAgICAgICAg
ICAgIGlmICggaGkgKQ0KPj4gKyAgICAgICAgICAgICAgICB2YWwgPSBiYXItPnNpemUgPj4gMzI7
DQo+PiArICAgICAgICAgICAgZWxzZQ0KPj4gKyAgICAgICAgICAgICAgICB2YWwgPSAweGZmZmZm
ZmZmICYgfihiYXItPnNpemUgLSAxKTsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgICAgIGlmICgg
IWhpICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICB2YWwgfD0gUENJX0JBU0VfQURE
UkVTU19NRU1fVFlQRV82NDsNCj4+ICsgICAgICAgICAgICB2YWwgfD0gYmFyLT5wcmVmZXRjaGFi
bGUgPyBQQ0lfQkFTRV9BRERSRVNTX01FTV9QUkVGRVRDSCA6IDA7DQo+PiArICAgICAgICB9DQo+
PiArICAgICAgICBiYXItPmd1ZXN0X2FkZHIgJj0gfigweGZmZmZmZmZmdWxsIDw8IChoaSA/IDMy
IDogMCkpOw0KPj4gKyAgICAgICAgYmFyLT5ndWVzdF9hZGRyIHw9ICh1aW50NjRfdCl2YWwgPDwg
KGhpID8gMzIgOiAwKTsNCj4+ICsgICAgICAgIGJyZWFrOw0KPj4gKyAgICB9DQo+PiArICAgIGNh
c2UgVlBDSV9CQVJfTUVNMzI6DQo+IFBsZWFzZSBzZXBhcmF0ZSBub24tZmFsbC10aHJvdWdoIGNh
c2UgYmxvY2tzIGJ5IGEgYmxhbmsgbGluZS4NCldpbGwgZG8NCj4NCj4+IEBAIC01MjIsNiArNTgy
LDEzIEBAIHN0YXRpYyBpbnQgYWRkX2Jhcl9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwg
Ym9vbCBpc19od2RvbSkNCj4+ICAgICAgICAgICAgICAgaWYgKCByYyApDQo+PiAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmM7DQo+PiAgICAgICAgICAgfQ0KPj4gKyAgICAgICAgLyoNCj4+ICsg
ICAgICAgICAqIEl0IGlzIG5laXRoZXIgc2FmZSBub3Igc2VjdXJlIHRvIGluaXRpYWxpemUgZ3Vl
c3QncyB2aWV3IG9mIHRoZSBCQVJzDQo+PiArICAgICAgICAgKiB3aXRoIHJlYWwgdmFsdWVzIHdo
aWNoIGFyZSB1c2VkIGJ5IHRoZSBoYXJkd2FyZSBkb21haW4sIHNvIGFzc2lnbg0KPj4gKyAgICAg
ICAgICogYWxsIHplcm9zIHRvIGd1ZXN0J3MgdmlldyBvZiB0aGUgQkFScywgc28gdGhlIGd1ZXN0
IGNhbiBwZXJmb3JtDQo+PiArICAgICAgICAgKiBwcm9wZXIgUENJIGRldmljZSBlbnVtZXJhdGlv
biBhbmQgYXNzaWduIEJBUnMgb24gaXRzIG93bi4NCj4+ICsgICAgICAgICAqLw0KPj4gKyAgICAg
ICAgYmFyc1tpXS5ndWVzdF9hZGRyID0gMDsNCj4gSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3Rh
bmQgdGhlIGNvbW1lbnQ6IFdpdGhvdXQgbWVtb3J5IGRlY29kaW5nDQo+IGVuYWJsZWQsIHRoZSBC
QVJzIGFyZSBzaW1wbGUgcmVnaXN0ZXJzICh3aXRoIGEgZmV3IHIvbyBiaXRzKS4NCg0KTXkgZmly
c3QgaW1wbGVtZW50YXRpb24gd2FzIHRoYXQgYmFyLT5ndWVzdF9hZGRyIHdhcyBpbml0aWFsaXpl
ZCB3aXRoDQoNCnRoZSB2YWx1ZSBvZiBiYXItPmFkZHIgKHBoeXNpY2FsIEJBUiB2YWx1ZSksIGJ1
dCB0YWxraW5nIG9uIElSQyB3aXRoDQoNClJvZ2VyIGhlIHN1Z2dlc3RlZCB0aGF0IHRoaXMgbWln
aHQgYmUgYSBzZWN1cml0eSBpc3N1ZSB0byBsZXQgZ3Vlc3QNCg0KYSBoaW50IGFib3V0IHBoeXNp
Y2FsIHZhbHVlcywgc28gdGhlbiBJIGNoYW5nZWQgdGhlIGFzc2lnbm1lbnQgdG8gYmUgMC4NCg0K
VGh1cyB0aGUgY29tbWVudA0KDQo+DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpX3JlZ3Mu
aA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaV9yZWdzLmgNCj4+IEBAIC0xMDMsNiArMTAz
LDcgQEANCj4+ICAgI2RlZmluZSAgUENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV82NAkweDA0CS8q
IDY0IGJpdCBhZGRyZXNzICovDQo+PiAgICNkZWZpbmUgIFBDSV9CQVNFX0FERFJFU1NfTUVNX1BS
RUZFVENICTB4MDgJLyogcHJlZmV0Y2hhYmxlPyAqLw0KPj4gICAjZGVmaW5lICBQQ0lfQkFTRV9B
RERSRVNTX01FTV9NQVNLCSh+MHgwZlVMKQ0KPj4gKyNkZWZpbmUgIFBDSV9CQVNFX0FERFJFU1Nf
TUVNX01BU0tfMzIJKH4weDBmVSkNCj4gUGxlYXNlIGRvbid0IGludHJvZHVjZSBhbiBpZGVudGlj
YWwgY29uc3RhbnQgdGhhdCdzIG1lcmVseSBvZg0KPiBkaWZmZXJlbnQgdHlwZS4gKHVpbnQzMl90
KVBDSV9CQVNFX0FERFJFU1NfTUVNX01BU0sgYXQgdGhlIHVzZQ0KPiBzaXRlIChpZiBhY3R1YWxs
eSBzdGlsbCBuZWVkZWQgYXMgcGVyIHRoZSBjb21tZW50IGFib3ZlKSB3b3VsZA0KPiBzZWVtIG1v
cmUgY2xlYXIgdG8gbWUuDQpPaywgSSB0aG91Z2h0IHR5cGUgY2FzdGluZyBpcyBhIGJpZ2dlciBl
dmlsIGhlcmUNCj4NCj4gSmFuDQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

