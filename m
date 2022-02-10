Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D284B0813
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 09:23:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269642.463720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI4iW-0005Lv-N0; Thu, 10 Feb 2022 08:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269642.463720; Thu, 10 Feb 2022 08:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI4iW-0005JL-JI; Thu, 10 Feb 2022 08:22:16 +0000
Received: by outflank-mailman (input) for mailman id 269642;
 Thu, 10 Feb 2022 08:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=06a2=SZ=epam.com=prvs=40400e4a88=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nI4iV-0005Iz-8O
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 08:22:15 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ac70af9-8a4a-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 09:22:11 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21A7hkKV010201;
 Thu, 10 Feb 2022 08:22:07 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e4xjqg4xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 08:22:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by HE1PR03MB2985.eurprd03.prod.outlook.com (2603:10a6:7:59::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 08:21:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.012; Thu, 10 Feb 2022
 08:21:29 +0000
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
X-Inumbo-ID: 8ac70af9-8a4a-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpxxBtNcSlCFx3NjNZ3IEVKuGxiLQcPCDyBdevXQZyJHiGI+gZ6wdG8xamdqOR4dt7mWssSUMinbFzr4WNa5ROCIOm2DvwTcE2FhzZ8Tjk7XjefYR7Joe3+5i3a0DW5I7Ar8hyJMwXDGuuQjWyn5QJZzRbtXT1d5dc0lCt+xUymk4Dg32daF/jFXM2asP7WAAJUXbIP52KSHIASRHO1Ip9NFGvggWgivP/PmrW/jmji5TlWSjql4+mW6QheykJvQF1MJN/qO49kX/Y9fmJm8uhhsOY3Vc700LZxfCiyL3Krs6Xnz7eh2Ggo8Fqsn5wOYZmTlIFP9QReGmNtiXDpcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLLJyxgLH1tRu7PIvaaR6gIN3imHOL5X4e7qgeNT5oM=;
 b=gEvqovrRgL3wawBGROdT9CtgZnb99xckvbCyve6mP0L+2NRlPHWTdpdDX+1NJvo2seigUlCzJTs0ZGAWyM5fveSllYUU7j5mnK0FuFDSIjcUsnLngd7pb3rt9lfO4rarYJ3PznTtqO8jly0k7vcTcHz8bR8qd2BkC/8TXoUJxso3cc1g7FL3g9FLJCHCK2jieoUtlAgsTfXVPcSzOkJ3zHICI1HBZJ1mgka4/N7uY8WXFzMWv+7yRsuv7rQkuK/zeh0i6de1s1IgbkCEFlZ6++aNW1lD0WHeEkB6k7D5mYvVaHM9HT1vYJxtDT0MzL+v8yJNxZQj9FjA8XwJ8oQxbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLLJyxgLH1tRu7PIvaaR6gIN3imHOL5X4e7qgeNT5oM=;
 b=HGND7bdOEj4SEvibUTUEQIqs6sO9jZpzuNAPx6+OpNjVG7iN0nEPRCkmdcKR3rU4EBL63mLsOUeOroxDpHFDjQ8SVrkl4xeXvYENjmg7nqeDBgppBjSnmDkGbc7ouAXbN44y4RIMSzJmROGyvAXPZBrWI5uu+AO3IrjAyrEtjR6sl3WPGMaI53W/Isq91SktQnhDOuZTeoePIbFiIuMNeiKQWIISTk1Elm/WpqM7fyZwai4p7dgNrUjF7vlNk9m7SBtWnvmF/5mZAIfQOoFr20QYHYbhiVGBed6vJA2DOtx6KF4S/FMin3F8iP4U2//6MQwdox15Fqn49geY2gcX7w==
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
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: 
 AQHYGZFdYv4W1RdbQkeQtzN+PyKqmqyITGQAgAENNICAAAt2AIAAA+uAgAAEsACAAAMyAIAABAgAgAADmACAAAHqgIAABl2AgAACJ4CAAAczgIAC8ScA
Date: Thu, 10 Feb 2022 08:21:28 +0000
Message-ID: <51865693-1b5e-7ab5-f942-d244029c260b@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
 <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
 <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
 <15c16171-f196-38d2-370c-38627935a21b@suse.com>
 <20762939-6b7e-ff60-7c1a-d47c4767ff4f@epam.com>
 <10cd89b5-a804-3354-26d8-bc271bd9c5e6@suse.com>
 <15022045-bc92-e3df-b005-aeec5e36a078@epam.com>
 <cf584e13-f257-9355-50fa-c35e8fc8cf5e@suse.com>
 <a0015951-6eff-38a8-a9f0-bdbc8bd51940@epam.com>
In-Reply-To: <a0015951-6eff-38a8-a9f0-bdbc8bd51940@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d2627e7-16db-4536-3bb0-08d9ec6e567a
x-ms-traffictypediagnostic: HE1PR03MB2985:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <HE1PR03MB298500FBBB3FE2E1D6FAD31BE72F9@HE1PR03MB2985.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oeA4O72cPsr9s4xQ8kvk2ApomNC8KdDDvzr1x9S93+Jrfh16bo86Jcv69/Ap+0quguhEVoJ9+fgaIPNO2tuNtn20OK33gHTlwd9+mXxEX8ysOw3zaZgREMFExd4SANFZyn/Jau4UinkTbbP4vcumsTd8fD2k1H1FdRSvB+q6QTkZhVyaO8doa251YHlLtsRZeJWFNbJVm8tGvwnlAHv+HPu/DeThoQN+k8MZClnSxGlJjZIdwzu6Z9+WfRJ18fa8z0M3PCrCx446cTTW8II1zRbhDdliConHGDAnnCMrBSjTXlhoGpUfny9Ln99MX3eczp4UGHAsM4WjyBsn64gQ+1eGxDp297C9PPW34TfW3LSUQrvYk78RzKcnDXiUTc9lAzR1NAb+PTLwLUuSqM53ZBYCFMhOPFfhThd2hD8jRTEpc7zIywPo42pVCKk2LjNIrlb8Eogx1drxKvUjQY2wAoGbF0Or/myZX58Tz/woBacCK5amBj4WxqmjrV+bwYTeiQbN2KW3Bfoyg5DEqgy7THSNslzZzLLfOJTEbYZaR0mBGCuIpfI17fliOykaDnxGuJNGsTN3LMIhlsnUDhuUUbsyd1/HoJU1a32zmrtS4LVWMMu2b8WnzVJRRJY7esUNh3yQ4YgcJBgBgH7LkP5amgul/Txk16GF8Vaai0RvhE4LHWBFix7JkLfPtbOA6TQzUizSV5fKhJ490IrCv3fwtDbFaVGnLxbWDxuKWxvzFTU4g8wE8daBYfF0KnNRVpZi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(36756003)(83380400001)(26005)(2906002)(107886003)(122000001)(186003)(38100700002)(38070700005)(4326008)(66556008)(71200400001)(53546011)(7416002)(66476007)(8676002)(8936002)(64756008)(66446008)(66946007)(6486002)(6506007)(76116006)(91956017)(86362001)(31686004)(31696002)(508600001)(6916009)(6512007)(54906003)(316002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OTQrRy9nUE1yUDIxNGp1eWxwZHk3Wm44S0hlcDhaTUl6NEZDSGdVRUxkL202?=
 =?utf-8?B?ZnlkWmtROTNiMTUvU2hyamhrMWVRUXhpSGtHdGpKdU5QaDlMK3J2T0Q4UzNU?=
 =?utf-8?B?VUR3cno1M0QvZmNIbmdveFV6QmtSSnpnT1FTcURpbmdIMlhNbkFlWHVDbDZV?=
 =?utf-8?B?MU9CcnU1WmdIVU5lYW5UWEdhV0RpYkF3L2tZY1kyR1RnenVwSHgyN01yYjc0?=
 =?utf-8?B?V1pwRmMvVWVNQ1dmMEx3cjFoZ0lrTEZKdnBxaVg0NnNyRVorREIrbHZOWllY?=
 =?utf-8?B?SHY1MFI0bE5lYkxQOS9ZckdRd0dqN1VnbEI4ZVBBaHVwalh4SmxiSXBWM0dz?=
 =?utf-8?B?czNYM08vTmxyYy9yT3AvbWh6Z1d1cFVNYXhPeW9Md0llNU5VL0hGczl5Tlpa?=
 =?utf-8?B?QW45UStXNmZlUUNCVjJHc0N4ZXh3bzRNSWNQZktZTnUvK3dMSTRQazhpY0t2?=
 =?utf-8?B?aDU5QVhqZGhwT0I1a2FSbGRNU25QNWJpNjNVTWZ4TmlJRnFVN3RLZDZFUEVz?=
 =?utf-8?B?NFdpTklYalEvYVlOQjhBUzVrdE9JcWw4T2w3blVCRkhVejQ0OWJLR3lvQXFo?=
 =?utf-8?B?RUR4WlhEcFMvRGNYbVM0b2U3VkhDWFB0aGJiS3ZHRWcwRU8zbW5TYjZFVDQz?=
 =?utf-8?B?R3dHdnJ2UUV0MU1NR3pyVjN6YXBqdkZYbTVFVFppNlFTTFQ4UmtlbkFVbTFT?=
 =?utf-8?B?NGUzdGNiL2FHOE51c08wN0k1eXRkcXM1YmRLaVpBd2FldnJJdi9JTExRVzBJ?=
 =?utf-8?B?d1gzanFXVVJ2MVNUS0RzZnU5NkRqclpOemNlVTNzdCtBbFVIVHM3RVNKa280?=
 =?utf-8?B?aEdOVWdSUStjMW5IUHlCTkUwK3gyUlF1eGtKL2NWNW1CSEE4TS9UNW53ZWJT?=
 =?utf-8?B?c1Bnck1INTlSQlBuNDNaMGtvcmd5aE50NWVxR1E0NDg3bXIvTEN0a2RreXI1?=
 =?utf-8?B?TDRsWERLWFlzTCtOZW5OSmdPTWlRcVBpR2JMTjFNcXBGN09NeWNBd1lVbmNG?=
 =?utf-8?B?Zkxsc3J5c2RhamNjd3RZbjJTLzBaZDEvRWNmeUtpMTViYUF2NVZPSXpjYmxQ?=
 =?utf-8?B?UG16UHo0a2FTK0R1U0NuZUcyZ1BzOEZBT053azFlRGV6Y3NqaDc0OWlhZ0lt?=
 =?utf-8?B?T2tEeStWbkVWT1J2a3RRSWhyVW9CNC9CL0xhLzBwWHpkSWlkTWlNaU5JWE9m?=
 =?utf-8?B?dE4rZDBwZjJ2Uk1PSWVEMmU5VTFDQ1MrVmhXeHF6eGU0S1U1RUd6cnJPVFQz?=
 =?utf-8?B?aFpDSHlzK0MvSmRRWmFYYlBxNmMrVUV0RkdZeHpHWEZZRUtEQjhZNHNkWURS?=
 =?utf-8?B?TTY3VTZwSGV4RXloSURKTS90WjhJWmxxek9XZUxLeG9DdFJKYkliS3UzRE4r?=
 =?utf-8?B?VUdlaXJIOXcraytlbnU3cU81WHduUzhXZlNQUE9oZTYyOFFjSWZCRXltdFNW?=
 =?utf-8?B?L1NzeXdscGN5Q3F0czFnQUkyNkNCR0xWd2YwUVU2MVZ5M1AzK3VFVzgweFJX?=
 =?utf-8?B?OGdrU0lRQWxPaFIyVTNUaDVoNHg0cTROc1lqSXpmUW5oazE5SUlVT2dOZFdt?=
 =?utf-8?B?QmZkUXc1aGdoeDdFMlhzbjgvRUF0YmF3cUtKNTRraHRoVG1RVzdnaG9KNEk3?=
 =?utf-8?B?ZUwxWFZvcm4waDg2dmVDZXR4YzVGYi81OWZpWVY5OSt5UEx6Uy9jL3hpTUNR?=
 =?utf-8?B?cE5SamV6NThtMEZzVTdTYitrNW5VeDc4Q3dnODZtcGs0YnRnMXhKKzBlQUdq?=
 =?utf-8?B?QWVpZ3h1UnRnMjIzcUZZTHNoZE1JNmFDVUtBbys2WnpSbm5yd0pSR3pEYzFB?=
 =?utf-8?B?MncrS3pUZDlUZTVoYnB4R3FqN1dTUFBia1hSOGFLeTJtMUZBdXQ5SnMwL2Y2?=
 =?utf-8?B?SjM4L1NvSmJDUEoyenJPUVFVc3E4M2xjTzFOcitRMU1HcGY2WVk1ejZ6MFlh?=
 =?utf-8?B?bFJzZU16WWMyV01QdlpCTXNDb3h1ODVPSkdONFhUSU5uTUtjVXRYaC93Nk9W?=
 =?utf-8?B?Q1lQKzFtaWlybWJHQTdRaVFoS0JmUkV3R09iSFQ1MGJwVkRETmc4YXA1NXdP?=
 =?utf-8?B?akxnK2xJSng1R1VHSUNHSVVyUFovYUlaTkZmdEpPZmQxZVRnNDkxdldPeXMy?=
 =?utf-8?B?NHFONkQ1ZkFWZlo5UC9aV3pYY3Q2a0F5OWsyVW1CTDJnSUNnZzJJOHhuOUQ5?=
 =?utf-8?B?YkFHVzE4R2pxblR3amk0elYvVTduRmxZdVRtNVBaL2MvU3Jad2trekZPdlZ2?=
 =?utf-8?B?MmgrZHZEeGtobWl0cDhhbjFNNVlQcnNhZ0JkNkhhbTcwWUo5YUxWSW5rVWpv?=
 =?utf-8?B?eXJrejcvT0tGQnQ4dzNGaUlUcmliZ3IrN0FWSmdjT3IveTFHTlRRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <751D5D8887568840BAA239DFF952F473@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2627e7-16db-4536-3bb0-08d9ec6e567a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 08:21:29.0419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: quLq77uO0aFPE/+7RMSygm/X/I4/Rq16VTq+lm/QMGnUZO3Tkamu/TY7y/rHG01R8R0jgbUS4Y9/K5h33sXxGTwbEdM0B5hNHhrJgI2Jh1Qdqc9uxqY9Rz3pti3jpQ5o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2985
X-Proofpoint-ORIG-GUID: CzrJ63mIHrE0l4EQS7owVJdBQP29EqLs
X-Proofpoint-GUID: CzrJ63mIHrE0l4EQS7owVJdBQP29EqLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_02,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100044

DQoNCk9uIDA4LjAyLjIyIDEzOjI1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMDguMDIuMjIgMTM6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDguMDIuMjAy
MiAxMTo1MiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gVGhpcyBzbWVsbHMg
bGlrZSB3ZSBmaXJzdCBuZWVkIHRvIGZpeCB0aGUgZXhpc3RpbmcgY29kZSwgc28NCj4+PiBwZGV2
LT5kb21haW4gaXMgbm90IGFzc2lnbmVkIGJ5IHNwZWNpZmljIElPTU1VIGltcGxlbWVudGF0aW9u
cywNCj4+PiBidXQgaW5zdGVhZCBjb250cm9sbGVkIGJ5IHRoZSBjb2RlIHdoaWNoIHJlbGllcyBv
biB0aGF0LCBhc3NpZ25fZGV2aWNlLg0KPj4gRmVlbCBmcmVlIHRvIGNvbWUgdXAgd2l0aCBwcm9w
b3NhbHMgaG93IHRvIGNsZWFubHkgZG8gc28uIE1vdmluZyB0aGUNCj4+IGFzc2lnbm1lbnQgdG8g
cGRldi0+ZG9tYWluIG1heSBldmVuIGJlIHBvc3NpYmxlIG5vdywgYnV0IGlmIHlvdSBnbw0KPj4g
YmFjayB5b3UgbWF5IGZpbmQgdGhhdCB0aGUgY29kZSB3YXMgcXVpdGUgZGlmZmVyZW50IGVhcmxp
ZXIgb24uDQo+IEkgZG8gdW5kZXJzdGFuZCB0aGF0IGFzIHRoZSBjb2RlIGV2b2x2ZXMgbmV3IHVz
ZSBjYXNlcyBicmluZw0KPiBuZXcgaXNzdWVzLg0KPj4+IEkgY2FuIGhhdmUgc29tZXRoaW5nIGxp
a2U6DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+IGluZGV4IDg4ODM2YWFiNmJhZi4u
Y2M3NzkwNzA5YTUwIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jDQo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+PiBAQCAtMTQ3
NSw2ICsxNDc1LDcgQEAgc3RhdGljIGludCBkZXZpY2VfYXNzaWduZWQodTE2IHNlZywgdTggYnVz
LCB1OCBkZXZmbikNCj4+PiAgICDCoHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9t
YWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykNCj4+PiAgICDCoHsN
Cj4+PiAgICDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21t
dShkKTsNCj4+PiArwqDCoMKgIHN0cnVjdCBkb21haW4gKm9sZF9vd25lcjsNCj4+PiAgICDCoMKg
wqDCoCBzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4+PiAgICDCoMKgwqDCoCBpbnQgcmMgPSAwOw0K
Pj4+DQo+Pj4gQEAgLTE0OTAsNiArMTQ5MSw5IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShz
dHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykNCj4+
PiAgICDCoMKgwqDCoCBBU1NFUlQocGRldiAmJiAocGRldi0+ZG9tYWluID09IGhhcmR3YXJlX2Rv
bWFpbiB8fA0KPj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cGRldi0+ZG9tYWluID09IGRvbV9pbykpOw0KPj4+DQo+Pj4gK8KgwqDCoCAvKiBXZSBuZWVkIHRv
IHJlc3RvcmUgdGhlIG9sZCBvd25lciBpbiBjYXNlIG9mIGFuIGVycm9yLiAqLw0KPj4+ICvCoMKg
wqAgb2xkX293bmVyID0gcGRldi0+ZG9tYWluOw0KPj4+ICsNCj4+PiAgICDCoMKgwqDCoCB2cGNp
X2RlYXNzaWduX2RldmljZShwZGV2LT5kb21haW4sIHBkZXYpOw0KPj4+DQo+Pj4gICAgwqDCoMKg
wqAgcmMgPSBwZGV2X21zaXhfYXNzaWduKGQsIHBkZXYpOw0KPj4+IEBAIC0xNTE1LDggKzE1MTks
MTIgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcs
IHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4+DQo+Pj4gICAgwqAgZG9uZToNCj4+PiAg
ICDCoMKgwqDCoCBpZiAoIHJjICkNCj4+PiArwqDCoMKgIHsNCj4+PiAgICDCoMKgwqDCoMKgwqDC
oMKgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICIlcGQ6IGFzc2lnbiAoJXBwKSBmYWlsZWQgKCVk
KVxuIiwNCj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZCwgJlBDSV9TQkRG
MyhzZWcsIGJ1cywgZGV2Zm4pLCByYyk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qIFdlIGZhaWxl
ZCB0byBhc3NpZ24sIHNvIHJlc3RvcmUgdGhlIHByZXZpb3VzIG93bmVyLiAqLw0KPj4+ICvCoMKg
wqDCoMKgwqDCoCBwZGV2LT5kb21haW4gPSBvbGRfb3duZXI7DQo+Pj4gK8KgwqDCoCB9DQo+Pj4g
ICAgwqDCoMKgwqAgLyogVGhlIGRldmljZSBpcyBhc3NpZ25lZCB0byBkb21faW8gc28gbWFyayBp
dCBhcyBxdWFyYW50aW5lZCAqLw0KPj4+ICAgIMKgwqDCoMKgIGVsc2UgaWYgKCBkID09IGRvbV9p
byApDQo+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoCBwZGV2LT5xdWFyYW50aW5lID0gdHJ1ZTsNCj4+
Pg0KPj4+IEJ1dCBJIGRvIG5vdCB0aGluayB0aGlzIGJlbG9uZ3MgdG8gdGhpcyBwYXRjaA0KPj4g
SW5kZWVkLiBQbHVzIEknbSBzdXJlIHlvdSB1bmRlcnN0YW5kIHRoYXQgaXQncyBub3QgdGhhdCBz
aW1wbGUuIEFzc2lnbmluZw0KPj4gdG8gcGRldi0+ZG9tYWluIGlzIG9ubHkgdGhlIGxhc3Qgc3Rl
cCBvZiBhc3NpZ25tZW50LiBSZXN0b3JpbmcgdGhlIG9yaWdpbmFsDQo+PiBvd25lciB3b3VsZCBl
bnRhaWwgcHV0dGluZyBpbiBwbGFjZSB0aGUgb3JpZ2luYWwgSU9NTVUgdGFibGUgZW50cmllcyBh
cw0KPj4gd2VsbCwgd2hpY2ggaW4gdHVybiBjYW4gZmFpbC4gSGVuY2Ugd2h5IHlvdSdsbCBmaW5k
IGEgbnVtYmVyIG9mIHVzZXMgb2YNCj4+IGRvbWFpbl9jcmFzaCgpIGluIHBsYWNlcyB3aGVyZSBy
b2xsaW5nIGJhY2sgaXMgZmFyIGZyb20gZWFzeS4NCj4gU28sIHdoeSBkb24ndCB3ZSBqdXN0IHJl
bHkgb24gdGhlIHRvb2xzdGFjayB0byBkbyB0aGUgcm9sbCBiYWNrIHRoZW4/DQo+IFRoaXMgd2F5
IHdlIHdvbid0IGFkZCBuZXcgZG9tYWluX2NyYXNoKCkgY2FsbHMuDQo+IEkgZG8gdW5kZXJzdGFu
ZCB0aG91Z2ggdGhhdCB3ZSBtYXkgbGl2ZSBYZW4gaW4gYSB3cm9uZyBzdGF0ZSB0aG91Z2guDQo+
IFNvLCBkbyB5b3UgdGhpbmsgaXQgaXMgcG9zc2libGUgaWYgd2UganVzdCBjYWxsIGRlYXNzaWdu
X2RldmljZSBmcm9tDQo+IGFzc2lnbl9kZXZpY2Ugb24gdGhlIGVycm9yIHBhdGg/IFRoaXMgaXMg
anVzdCBsaWtlIEkgZG8gaW4gdnBjaV9hc3NpZ25fZGV2aWNlOg0KPiBJIGNhbGwgdnBjaV9kZWFz
c2lnbl9kZXZpY2UgaWYgdGhlIGZvcm1lciBmYWlscy4NCldpdGggdGhlIGZvbGxvd2luZyBhZGRp
dGlvbjoNCg0KZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCmluZGV4IGM0YWUyMmFlZWZjZC4uZDZjMDA0NDkx
OTNjIDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQpAQCAtMTUxMSw2ICsxNTExLDEyIEBAIHN0YXRp
YyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4
IGRldmZuLCB1MzIgZmxhZykNCiDCoMKgwqDCoCB9DQoNCiDCoMKgwqDCoCByYyA9IHZwY2lfYXNz
aWduX2RldmljZShwZGV2KTsNCivCoMKgwqAgaWYgKCByYyApDQorwqDCoMKgwqDCoMKgwqAgLyoN
CivCoMKgwqDCoMKgwqDCoMKgICogSWdub3JlIHRoZSByZXR1cm4gY29kZSBhcyB3ZSB3YW50IHRv
IHByZXNlcnZlIHRoZSBvbmUgZnJvbSB0aGUNCivCoMKgwqDCoMKgwqDCoMKgICogZmFpbGVkIGFz
c2lnbiBvcGVyYXRpb24uDQorwqDCoMKgwqDCoMKgwqDCoCAqLw0KK8KgwqDCoMKgwqDCoMKgIGRl
YXNzaWduX2RldmljZShkLCBzZWcsIGJ1cywgZGV2Zm4pOw0KDQogwqAgZG9uZToNCiDCoMKgwqDC
oCBpZiAoIHJjICkNCg0KSSBzZWUgdGhlIGZvbGxvd2luZyBsb2dzIChQViBEb20wKToNCg0KKFhF
TikgYXNzaWduX2RldmljZSBzZWcgMCBidXMgMyBkZXZmbiAwDQooWEVOKSBbVlQtRF1kW0lPXTpQ
Q0llOiB1bm1hcCAwMDAwOjAzOjAwLjANCihYRU4pIFtWVC1EXWQ0OlBDSWU6IG1hcCAwMDAwOjAz
OjAwLjANCihYRU4pIGFzc2lnbl9kZXZpY2UgdnBjaV9hc3NpZ24gcmMgLTIyIGZyb20gZFtJT10g
dG8gZDQNCihYRU4pIGRlYXNzaWduX2RldmljZSBjdXJyZW50IGQ0IHRvIGRbSU9dDQooWEVOKSBb
VlQtRF1kNDpQQ0llOiB1bm1hcCAwMDAwOjAzOjAwLjANCihYRU4pIFtWVC1EXWRbSU9dOlBDSWU6
IG1hcCAwMDAwOjAzOjAwLjANCihYRU4pIGRlYXNzaWduX2RldmljZSByZXQgMA0KKFhFTikgZDQ6
IGFzc2lnbiAoMDAwMDowMzowMC4wKSBmYWlsZWQgKC0yMikNCmxpYnhsOiBlcnJvcjogbGlieGxf
cGNpLmM6MTQ5ODpwY2lfYWRkX2RtX2RvbmU6IERvbWFpbiA0OnhjX2Fzc2lnbl9kZXZpY2UgZmFp
bGVkOiBJbnZhbGlkIGFyZ3VtZW50DQpsaWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5jOjE3ODE6ZGV2
aWNlX3BjaV9hZGRfZG9uZTogRG9tYWluIDQ6bGlieGxfX2RldmljZV9wY2lfYWRkIGZhaWxlZCBm
b3IgUENJIGRldmljZSAwOjM6MC4wIChyYyAtMykNCmxpYnhsOiBlcnJvcjogbGlieGxfY3JlYXRl
LmM6MTg5NTpkb21jcmVhdGVfYXR0YWNoX2RldmljZXM6IERvbWFpbiA0OnVuYWJsZSB0byBhZGQg
cGNpIGRldmljZXMNCmxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTE4MzpsaWJ4bF9fZGVz
dHJveV9kb21pZDogRG9tYWluIDQ6Tm9uLWV4aXN0YW50IGRvbWFpbg0KbGlieGw6IGVycm9yOiBs
aWJ4bF9kb21haW4uYzoxMTM3OmRvbWFpbl9kZXN0cm95X2NhbGxiYWNrOiBEb21haW4gNDpVbmFi
bGUgdG8gZGVzdHJveSBndWVzdA0KbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMDY0OmRv
bWFpbl9kZXN0cm95X2NiOiBEb21haW4gNDpEZXN0cnVjdGlvbiBvZiBkb21haW4gZmFpbGVkDQoN
ClNvLCBpdCBzZWVtcyB0byBwcm9wZXJseSBzb2x2ZSB0aGUgaXNzdWUgd2l0aCBwZGV2LT5kb21h
aW4gbGVmdA0Kc2V0IHRvIHRoZSBkb21haW4gd2UgY291bGRuJ3QgY3JlYXRlLg0KDQpASmFuLCB3
aWxsIHRoaXMgYWRkcmVzcyB5b3VyIGNvbmNlcm4/DQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

