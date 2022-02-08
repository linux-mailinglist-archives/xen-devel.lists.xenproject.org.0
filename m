Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA274AD540
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267946.461712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNGu-0005aF-FM; Tue, 08 Feb 2022 09:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267946.461712; Tue, 08 Feb 2022 09:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNGu-0005XR-C9; Tue, 08 Feb 2022 09:58:52 +0000
Received: by outflank-mailman (input) for mailman id 267946;
 Tue, 08 Feb 2022 09:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHNGs-0005Wt-DF
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:58:50 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5b63244-88c5-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:58:49 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2189Sh0F000682;
 Tue, 8 Feb 2022 09:58:46 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3nx0r3ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:58:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4617.eurprd03.prod.outlook.com (2603:10a6:10:1b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 09:58:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:58:40 +0000
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
X-Inumbo-ID: b5b63244-88c5-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkrLBcRq71zKSy04XlixwH2xi8hqLIa7bhTwMnG2LVtUGYTdI0AH2vAX/sGtdeX2b4MbGGhDgsBXDURxMkTgSaYYIQgHrJQ4hDa4D3T3zljbi+qRbFx8ju4guc0cQQ4Git8rahNLWGhfkFIIylQfL6YAQJWDMO54u3QblBr7CIVygSDPOXR4CHHkzyB15y0s6YxDPoMO/dpnT28chj0KkkEHeTcu2aWFDzGsy1pf02IL/VmEF1kftN6uOsOD2dNcewqAQBtqQ6NZMlNkZkR3QrBFWlTBmLK5Eep5lNj91T1WWNdJvb70ovndPwBVXxfBysPnhfk/EOnV3BzbZxFRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NybVCRtw95Bx0SzjBpBfR+8lQpTE3AWLwiuDbQxy2kI=;
 b=b28021RMQEAC/xwHpL0DpcXQsDRfh6uvpBaNyvVOaFYTPJEx3soa/7jdKQ4h7wnvbvGNbFN4xSZcaPD2xE7hSbixOVMLc9GDp2a1HG/lrslC3v8xHHPtTuHC6GVb+7fCpBvoa/og2JTeA9u3N/aI1ezWJxW1pOJ/YAxW3cPRc4yEv9Sq6T3TBcVFWwWFF16WoY9v61bPGOgAvKgKDN2nGbQhBS8sR/JC9AwVaapF95fc7qPC6nOw1pBEQ06td61flOFPtdNVmKiL5xKbDftNZhhImRmaoMNmNMfsIWN6qfCy92y9vmhahQx0whC0IXkv1CaIt9l3is+0OQ7uptjyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NybVCRtw95Bx0SzjBpBfR+8lQpTE3AWLwiuDbQxy2kI=;
 b=WZ7eT8FKM4UFgmMrvfiAsOnP9ttFA9fZhlWo8hMoPKKOseS/Xh7MtVf1NavfkOmbT2LEIhehKhUhl+5L86QvJs/K5CIAYAuKwlGdmvZvQuKHDO/wzBNtyJzzrTcGTYyZ1IitGjLs3rs7lrCzrpAtcAI6feDStEwKpOlW5aHjJ95ULOUGywbxyrkT+VjptFE2oV+cdyg6PU3UsvU5/Js84+8UkMZeJ8QISFDGwKhjwB+lp/9HdpotsXBmvBkh0COXNhXV6jrT4XZ8KSaQIuWw/wdAWwBfnT5Ce6gJqHHfoYI18UEJVttyvhJpM+WoDET1SYGSyCOUaPI/r5UQRf1q5Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v6 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHYGZFfEau2yoVfs02TXHZP7JM5E6yDcw0AgAXhW4CAABY4AIAAAW6AgAAD24CAAAHYgA==
Date: Tue, 8 Feb 2022 09:58:40 +0000
Message-ID: <ccaaa9b8-8ed9-054e-b724-70ca07401be9@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-10-andr2000@gmail.com>
 <7df2379e-1c30-c362-3106-c7ef23af5c73@suse.com>
 <0ff2a524-9a65-861a-df87-cf3f682862d7@epam.com>
 <140e163c-87d0-2ae8-d57b-7ebc6757de9e@suse.com>
 <08d02313-349d-9ad4-926d-0d1419866363@epam.com>
 <186b7264-1190-3df2-415d-f1ec73a7c03f@suse.com>
In-Reply-To: <186b7264-1190-3df2-415d-f1ec73a7c03f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef879a4d-f4b8-4f56-e3ea-08d9eae99572
x-ms-traffictypediagnostic: DB7PR03MB4617:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB461786A2544CE99829C4FDE8E72D9@DB7PR03MB4617.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uGApG4Ixtr74HLaj12u7XQTBvIuJA++eAVEdF1h/KDCfi6egvKInMd3w6TRDy+0VVh+skfWfsKhlDVv9ASHmff9kso2T6mljZqbNU0rkkvF8lq/CoCS6peiYdrE6RLQ8fDJo+4NtlreoqWEE9nH5u1DVMOCEEEc5D52IAU2J8olvQjNBeu+KUpDvNRYGE4EOXeiKqWm+z0hbwKCWfI/xxER5qmajm+fpbdePFmOxeilZuFgJ3YKbQXBRv6DF3YTtUZBn65bYvYzwsBnzteYMOm9p7trcugZ3gKxqRrJPQgJ3M/AyBa3RbymDBRXxeaKaGBZG9JUDRp3jarqXa3E0w0Lc50qPXMJWE/2ktV/QLC2KyOSBpSmpBfACDe2AYDhdSc9pOVuY0kJH+5LfLqGAxq/LbWTE5lmt6PsDGubdAFYGV66PARhAXEm7DKqRi2Nvzpzl09kXLwIOgQNyiO+1RaAuihz12sY5Lsqs6HemYRQAY3iR1KcT8xkm0PawPauoOt+tnVYBd7z4T5Mz2g/rkB8xY+wv3/EosB2Q1dHyLxLvbBla+YkMrL5QUdTuwdnUMG3FXWX71KU4Lr7tdDI/EkjqHIxguFlgIn/NBTogCpD7LnMdjnSsR8V9Rw1LVuS6GHsEjbtSmQK6JyuK5gwJ0SHrP3KvJQUT516rePsFLTuDkTlryCLizuNDgoZ+qjd4BZYJbbx+s3Gr1CLY35s501/5C00Kg+DzAkyK+UXfRzp/gMfxt6fQsQN7fTNRjtJw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(64756008)(66476007)(66446008)(86362001)(55236004)(53546011)(31696002)(2616005)(66946007)(6512007)(7416002)(6506007)(508600001)(122000001)(6486002)(54906003)(110136005)(8676002)(91956017)(316002)(71200400001)(8936002)(4326008)(38100700002)(107886003)(26005)(36756003)(31686004)(5660300002)(2906002)(186003)(76116006)(83380400001)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bTFYQmZGc25CQ2NXaldscUt5SDlsWHIxRnNHK0VldCtVUmRYRmhPR0FjRHB5?=
 =?utf-8?B?T1RlN2JkeHlMZjUvL1dycDBsd2xtZ0FDK0lhWGZaME4zeWlWcDBONVdGZDhz?=
 =?utf-8?B?T1VkVmUwcjlqN0VsQlNIZTZJVUZaN3E1ajFuSS80YlBGOGxSNW8wdldCR0RI?=
 =?utf-8?B?VTNaYlNYTWR0bmhkQ3JkK25BRUdBTEdjTEk4TjJBUEJTaGQ0Wjc5VEh3N2ZO?=
 =?utf-8?B?dHFiRklCQjNUelY3Z0FCSStHNFBadVhEbEd5QXhHYkU5ZUN3YS8xOURraTlr?=
 =?utf-8?B?V0JPa2hnREpGcnhZTE9LeWt3eCsyVms0d3V6dVJIQjV3TnhZSWZNVnNHT0Jv?=
 =?utf-8?B?bDJ5dm9ma0ZRQkNvT2U2OUUxV2g3bWZkbmJKWFlVczJVanl1YTRMY1dMY1VI?=
 =?utf-8?B?eGlzS2xRNmhkQ0RHL3BLU1VCQmZ4emdzUitCVG5zV3N6M2p0ZVJVTURhR09N?=
 =?utf-8?B?RWZmZnNCc1RsTDB4bnM5eUVHWEIwT0E4MC9IZTIxa2pCUDJXSmhUQUxXYnRO?=
 =?utf-8?B?dTVIenVRK0JHTmhScDdsemVBS3ZGMG0zOE96UVl5a09zUlE5dE5mMmRvWW04?=
 =?utf-8?B?ZENudlI2Rng3N3gwcG50emFxRUpJOUhyRXZ0ZzhOMFBGeldDeDNBejJXeEFL?=
 =?utf-8?B?Rm4zREVkK3lmaEdnRFlqRlMvZTc3QmdUV1NYZmo4TlFjZUlnR3lIWFB6VWJX?=
 =?utf-8?B?a0diaHhTTzhkMmtMbXV2RDhqdkRZMjQvQy82NjFSWTRLeFkzRVZWbUpuWHBo?=
 =?utf-8?B?bXZIdWxBbFNjMTYwVFZuKzZlZkFuUFdkd3VZbWJxZDJmakVjVmZ1VElrUWNj?=
 =?utf-8?B?Qmc0cWh4T1NvbnVDOXdhdkZ3S3pVdXBiUUoyL2NLVzhOZStya1pFc3VZMExD?=
 =?utf-8?B?T3RWeDdxWURtdzc2ZHBES0tidDRSaWprMUdTTW45Mm56NGJnOGw0NFI4M3VI?=
 =?utf-8?B?TUFybktoRElsTjcrdGQ2eE1YVEk5Y05oWnZKN1MwamMrVysySUxhN01xNGpr?=
 =?utf-8?B?c2R1TDhNTXd2UzBlYXFWamJta1NVU3pad29ZTTVhTG1rUFFid0lvbnd5ZUtX?=
 =?utf-8?B?L2VzTWZiRmoydGVjT1VWeVNjWWdXRjdpSW5VTVJtQ0NWOWxFbmQrUUsySnNF?=
 =?utf-8?B?SW1LSktua2JNYStkTTZhQ01HNUJiRWdGbnVzTzhsd0o5S1NoSHRXUHVaaGFU?=
 =?utf-8?B?aHZSZi9ZMDd0eVNoTXN0TTYvQUk3R0kwd1V1T0hIMTlCNTdEUGdDcWNrSldz?=
 =?utf-8?B?cGZjTFFDQ1V0OFpPR0I3SjB3emw2Wm1mR1R0QlVSVnZIaEQ0cFBjZUdYaHlL?=
 =?utf-8?B?eUJ5a05ldFhwNW1zaWJmUHhDbU9NS3llSUtPR1NNNzdKcGRndU13TGk1U1dP?=
 =?utf-8?B?MXM1WVpwQ3FQWTFGeGJlbkdKTHBZVmM0eGlLOEVLVVJ5eE16dWxZcVR1MDlT?=
 =?utf-8?B?ZnVMUUR5aVdrZStySGdvTGhsYTZRbkxvMzg3QkpTTXQrQnVCUFNmdXJqRWpW?=
 =?utf-8?B?YlFkUGtPVHZWUmFTTGdCaHhqbHNpYm5STXdBVlRuQXZKZXl6NmJOWnM1VVg3?=
 =?utf-8?B?TFduaXhDOHhUbkpCVllGMUVrVHZxa0UrdExQTDg2MnlscDRXeVNKZ3k2Rmkw?=
 =?utf-8?B?WlNsYWo3SWdhQ2p5UzFEczBuMkcvOTBURjZ4ZlFGMFViUDNrTGJLWnl5M3lS?=
 =?utf-8?B?K3ZjV24vb0RNTUZoYlV3SFFiNkhBc2IrWVdvUlRVTzdHYjl1QitQcEFGb203?=
 =?utf-8?B?Y0dNaS8vOVJCQXhDamxYV2lZWFBTOWtuSzRvK1RiOUdGN0ZWSWgzcHAwMnFK?=
 =?utf-8?B?REdDRktVQlp0b0Q3TjJxcTQxaGZoVzZlU0FzMjlURXU2WmFmbi9zUWF0bkZt?=
 =?utf-8?B?ZElOS01xRnZkRU1hQ1VsSWpBZGd6bFB2Ym1NZmMzcWpva01wVWtLKzUrYzlW?=
 =?utf-8?B?M3NiUnFqQ3BsTWJ6TlJ1SnlRMWk0b3VrZ0NmTjNxTUJSNkg4bjhFVG9EVkZo?=
 =?utf-8?B?aU9RWmVhYkVLNXlrY1R4bzYvb3RuNVVvckZMakRJVWFFdDZZaDdZdVlPUmVR?=
 =?utf-8?B?SyswcmFIdUZ5YngwQmkrc2ErM0NWUG4zVFFWL2Y2ZHhIMTlVTTR2c1dWL0JG?=
 =?utf-8?B?dHUrU2x2TXl1TW5RcHY4enlnK05YNWhheFUwQWpLZm55WkxOVHFtaTl0Y1F4?=
 =?utf-8?B?U05mYk5nUndhbENYZXQvVHZWS1ppZEV4czExbjJHVnF2NkE4QU1PTE1nVEFr?=
 =?utf-8?B?bTRtVnNuNmlOYmxQaU5xSXIxMHRzTGhkdjFEdlNPUWtNdzR1azl4RFNjRnNr?=
 =?utf-8?B?S29HZ29NcTIyQ0lkd2N4a3p4K01yU0c3NmhVbmJZOG5wb1I5QURacTN4eThk?=
 =?utf-8?Q?S9vgVJ8I6HvoI8oc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14196F69D1041944BD6EAB7FF4D73581@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef879a4d-f4b8-4f56-e3ea-08d9eae99572
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:58:40.4312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvGZZxmZmwBUWW6RWTho34hChLRsEPQcZGuPhqG8bV065CgC32WD9RkmzX8JOq50rFqfcfnusZcj8IiOxUj2NnbTF6NYkOumh27IrsYf85M3O7qqWXNp1IGkO6vWpUsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4617
X-Proofpoint-GUID: qeIm8qCvB4QmH8YcVuCSvSZ59hMadLqY
X-Proofpoint-ORIG-GUID: qeIm8qCvB4QmH8YcVuCSvSZ59hMadLqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=839
 mlxscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080057

DQoNCk9uIDA4LjAyLjIyIDExOjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAxMDozOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDguMDIu
MjIgMTE6MzMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA4LjAyLjIwMjIgMDk6MTMsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNC4wMi4yMiAxNjoyNSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNC4wMi4yMDIyIDA3OjM0LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
DQo+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+IEBAIC00NTQs
NiArNDU0LDIyIEBAIHN0YXRpYyB2b2lkIGNtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+PiAgICAgICAgICAgICBwY2lfY29uZl93cml0
ZTE2KHBkZXYtPnNiZGYsIHJlZywgY21kKTsNCj4+Pj4+PiAgICAgfQ0KPj4+Pj4+ICAgICANCj4+
Pj4+PiArc3RhdGljIHZvaWQgZ3Vlc3RfY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3QgY21kLCB2b2lkICpkYXRhKQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAgICAvKiBU
T0RPOiBBZGQgcHJvcGVyIGVtdWxhdGlvbiBmb3IgYWxsIGJpdHMgb2YgdGhlIGNvbW1hbmQgcmVn
aXN0ZXIuICovDQo+Pj4+Pj4gKw0KPj4+Pj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQ0lfTVNJDQo+
Pj4+Pj4gKyAgICBpZiAoIHBkZXYtPnZwY2ktPm1zaS0+ZW5hYmxlZCB8fCBwZGV2LT52cGNpLT5t
c2l4LT5lbmFibGVkICkNCj4+Pj4+PiArICAgIHsNCj4+Pj4+PiArICAgICAgICAvKiBHdWVzdCB3
YW50cyB0byBlbmFibGUgSU5UeC4gSXQgY2FuJ3QgYmUgZW5hYmxlZCBpZiBNU0kvTVNJLVggZW5h
YmxlZC4gKi8NCj4+Pj4+PiArICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxF
Ow0KPj4+Pj4+ICsgICAgfQ0KPj4+Pj4+ICsjZW5kaWYNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBj
bWRfd3JpdGUocGRldiwgcmVnLCBjbWQsIGRhdGEpOw0KPj4+Pj4+ICt9DQo+Pj4+PiBJdCdzIG5v
dCByZWFsbHkgY2xlYXIgdG8gbWUgd2hldGhlciB0aGUgVE9ETyB3YXJyYW50cyB0aGlzIGJlaW5n
IGENCj4+Pj4+IHNlcGFyYXRlIGZ1bmN0aW9uLiBQZXJzb25hbGx5IEknZCBmaW5kIGl0IHByZWZl
cmFibGUgaWYgdGhlIGxvZ2ljDQo+Pj4+PiB3YXMgZm9sZGVkIGludG8gY21kX3dyaXRlKCkuDQo+
Pj4+IE5vdCBzdXJlIGNtZF93cml0ZSBuZWVkcyB0byBoYXZlIGd1ZXN0J3MgbG9naWMuIEFuZCB3
aGF0J3MgdGhlDQo+Pj4+IHByb2ZpdD8gTGF0ZXIgb24sIHdoZW4gd2UgZGVjaWRlIGhvdyBQQ0lf
Q09NTUFORCBjYW4gYmUgZW11bGF0ZWQNCj4+Pj4gdGhpcyBjb2RlIHdpbGwgbGl2ZSBpbiBndWVz
dF9jbWRfd3JpdGUgYW55d2F5cw0KPj4+IFdoeSAid2lsbCI/IFRoZXJlJ3Mgbm90aGluZyBjb25j
ZXB0dWFsbHkgd3Jvbmcgd2l0aCBwdXR0aW5nIGFsbCB0aGUNCj4+PiBlbXVsYXRpb24gbG9naWMg
aW50byBjbWRfd3JpdGUoKSwgaW5zaWRlIGFuIGlmKCFod2RvbSkgY29uZGl0aW9uYWwuDQo+Pj4g
SWYgYW5kIHdoZW4gd2UgZ2FpbiBDRVQtSUJUIHN1cHBvcnQgb24gdGhlIHg4NiBzaWRlIChhbmQg
SSdtIHRvbGQNCj4+PiB0aGVyZSdzIGFuIEFybSBlcXVpdmFsZW50IG9mIHRoaXMpLCB0aGVuIHRv
IG1ha2UgdGhpcyBhcyB1c2VmdWwgYXMNCj4+PiBwb3NzaWJsZSBpdCBpcyBnb2luZyB0byBiZSBk
ZXNpcmFibGUgdG8gbGltaXQgdGhlIG51bWJlciBvZiBmdW5jdGlvbnMNCj4+PiBjYWxsZWQgdGhy
b3VnaCBmdW5jdGlvbiBwb2ludGVycy4gWW91IG1heSBoYXZlIHNlZW4gQW5kcmV3J3MgaHVnZQ0K
Pj4+ICJ4ODY6IFN1cHBvcnQgZm9yIENFVCBJbmRpcmVjdCBCcmFuY2ggVHJhY2tpbmciIHNlcmll
cy4gV2Ugd2FudCB0bw0KPj4+IGtlZXAgZG93biB0aGUgbnVtYmVyIG9mIHN1Y2ggYW5ub3RhdGlv
bnM7IHRoZSB2YXN0IHBhcnQgb2YgdGhlIHNlcmllcw0KPj4+IGlzIGFib3V0IGFkZGluZyBvZiBz
dWNoLg0KPj4gV2VsbCwgd2hpbGUgSSBzZWUgbm90aGluZyBiYWQgd2l0aCB0aGF0LCBmcm9tIHRo
ZSBjb2RlIG9yZ2FuaXphdGlvbg0KPj4gaXQgd291bGQgbG9vayBhIGJpdCBzdHJhbmdlOiB3ZSBk
b24ndCBkaWZmZXJlbnRpYXRlIGh3ZG9tIGluIHZwY2kNCj4+IGhhbmRsZXJzLCBidXQgaW5zdGVh
ZCBwcm92aWRlIG9uZSBmb3IgaHdkb20gYW5kIG9uZSBmb3IgZ3Vlc3RzLg0KPj4gV2hpbGUgSSB1
bmRlcnN0YW5kIHlvdXIgY29uY2VybiBJIHN0aWxsIHRoaW5rIHRoYXQgYXQgdGhlIG1vbWVudA0K
Pj4gaXQgd2lsbCBiZSBtb3JlIGluIGxpbmUgd2l0aCB0aGUgZXhpc3RpbmcgY29kZSBpZiB3ZSBw
cm92aWRlIGEgZGVkaWNhdGVkDQo+PiBoYW5kbGVyLg0KPiBUaGUgZXhpc3RpbmcgY29kZSBvbmx5
IGRlYWxzIHdpdGggRG9tMCwgYW5kIGhlbmNlIGRvZXNuJ3QgaGF2ZSBhbnkNCj4gcGFpcnMgb2Yg
aGFuZGxlcnMuDQpUaGlzIGlzIGZhaXINCj4gICBGVEFPRCB3aGF0IEkgc2FpZCBhYm92ZSBhcHBs
aWVzIGVxdWFsbHkgdG8gb3RoZXINCj4gc2VwYXJhdGUgZ3Vlc3QgcmVhZC93cml0ZSBoYW5kbGVy
cyB5b3UgbWF5IGJlIGludHJvZHVjaW5nLiBUaGUNCj4gZXhjZXB0aW9uIGJlaW5nIHdoZW4gZS5n
LiBhIGhhcmR3YXJlIGFjY2VzcyBoYW5kbGVyIGlzIHB1dCBpbiBwbGFjZQ0KPiBmb3IgRG9tMCAo
Zm9yIG9idmlvdXMgcmVhc29ucywgSSB0aGluaykuDQpAUm9nZXIsIHdoYXQncyB5b3VyIHByZWZl
cmVuY2UgaGVyZT8NCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

