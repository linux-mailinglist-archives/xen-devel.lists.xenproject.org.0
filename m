Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED139452B98
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 08:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226154.390736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmsxu-0007Wm-Fa; Tue, 16 Nov 2021 07:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226154.390736; Tue, 16 Nov 2021 07:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmsxu-0007TY-C8; Tue, 16 Nov 2021 07:33:14 +0000
Received: by outflank-mailman (input) for mailman id 226154;
 Tue, 16 Nov 2021 07:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmsxr-0007Jp-Vf
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 07:33:12 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72903aa4-46af-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 08:33:10 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7SMNd021897;
 Tue, 16 Nov 2021 07:33:06 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cc83n016f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 07:33:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4147.eurprd03.prod.outlook.com (2603:10a6:208:cf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 16 Nov
 2021 07:33:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 07:33:00 +0000
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
X-Inumbo-ID: 72903aa4-46af-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQMuunp5xFIsubNP7ymA2Ea/3l8V4L5RxAIKmYv1s9wTueCdi0vXRJNWarYIveA8594axpwUgb9FmKs8l5zg1zpQw24PByhkpwKc8WwFbhaXv6IbYCPLA/67ofaP1l3byIjZj4rw1uzJl7MZj6egbpc03AkriqzZL5cvwRUrvWHoebnt/j6IwxJmXeP3aZfhuM9yR5aCQM1hZF5/nCWWWembPfnlZV/zE2rXJcD5piCH58yAYyUiO2BASw7EWrUjAL/Tb2S0R7kho9Mf5qz+VEcAxOsgUEuLu9ycgVmpkRgiZFr0ZOsYnoxIQVbMU8QDo/LDNPsvIlJOeVqM4L+cJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8zwRjpqEgAH1u+6gJqAScxRLLTyPrOUQWRInWp2P8Q=;
 b=IJO/jzqkJ8T/Ejp22A6brAue0KTDUWgA5xWL8jRacW5p8/LxaXluG03wKy1pat8+gktZhyZ5DV4cnq4YyEfR862wrEoFuyzLrNdCVgo0M5LW8IiwwZrmam9w4R/l0FfwSQC/oN6vtMDyfFY8/nmwwbtdVvspnj1HuxHIbARFrLdKtTChvph3ECqiyygK0oox+HarsyxNtYpoSawb9tOabYI89RIrTy0kD6lLTL8JsBA0C3VFdzgbdqv5e3TpyNIEK1ZUYI2I6GrNuZW90fgApFW5UDcF8C5/Zh3huIQLYkrT4NueJ1k6cvYInYFKvZQtOaIRwtLKOWtfvt0Q7qYBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8zwRjpqEgAH1u+6gJqAScxRLLTyPrOUQWRInWp2P8Q=;
 b=hNexSBDff/vGP0E9ypdFBH2fb8SwPlRMNUXmSiB83mijzmpQf43nVN27EKCcJPQ+m5GHOcrtudnFiCDywfkc2M3dMITKH3cPD35kPmKgSsNydQ4P86jcB1XvQbtBgCsnieQQjlnDy9TxmpUAAufHl7nwLN5UPvpUFHKo4amYm/HTZVWi9WHslA8yeJ3aMdjjGtILhapwGALu7oN0+iDCbR41t/xXODC65dT6Hu/FWH6KMHHb7s9CiC6ejkS2Smkw0zjFeIM4RbkzflsJBbYRYn915uwkscWbU/WehYNFBjOYjz4GsYHvTnPczAySbewnab/UDgRazhHIVvuITVfjGg==
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
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: AQHX0hJIYALl/D9fL0OD6N0XGDJh2awE30EAgAD09oA=
Date: Tue, 16 Nov 2021 07:32:59 +0000
Message-ID: <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
In-Reply-To: <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3685bbd-bed4-41d6-c5c3-08d9a8d3510e
x-ms-traffictypediagnostic: AM0PR03MB4147:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4147494D2942E1F035A9EF0CE7999@AM0PR03MB4147.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rkpyVCoBMEecf2YaK2gXn/tDMnU2dAAQlZhhQaMSVULB3YWYT2/bliCPOhywH5Rz5I4A2l6T30KEvenz6Gml1BteT44bXszr8WYmnmtnJs7WvlYCIHTNllYIIGOCjEYyaTWpFzkL0Nk2evDEiPh748AXIgPR2LqvYayix1lrCrBau/Eh+SBwjEG3HWP+B+lA0zSXmyUe4NCmMgW2OJBu5cNVJoFHkbEKqkeQyiWQDWfhg9s3ANHnaz9XyCtgSYX0A2cxZ6Rbc3MuEVC/of8BZylqjVqeiByNrzuUcDRocCzBrw1MZ05Jn1f2egTIeyXpgKH176xoIyaVQH+bUy7zDH9jAVeGyORjShE41A9r94DFYiOYEmSP5TUalI5QXm0r38S7XmqblecIbn++doFI9DllsLjPBKKO2Co9yQSSfW9+SvzkgE5aBEh4EX2JvMpRW6LUesViHNSrG010yqV4/ftrCok+ml4zrXdZdcYwr4Q0/u1lMlX5L1LbrIuCtqvXsZNn/+Xr9vWOQvinqFth9f0SJUpiBGhRLauWRIcifb3eS91JIalIGlbR74e3mITw8wRPc8d0neSfR1zfp5QLUhjMiSJt0ypjEm5ME3AlddlCUA4dGbkQ7Z1vJ6epcQXatDdlmi5I2yKEpoWjTX3cnSMs0st4hn3ipWdcNYxiAJKfpP711Lu8W++SMPL366Sd6fKjhuJPMtKn8J6/GZpEMvtoPEryqhYoe6hTm/85qWi2E4IYep476exnt93QELak
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6506007)(5660300002)(6512007)(53546011)(8676002)(6486002)(66946007)(122000001)(6916009)(2906002)(31696002)(38070700005)(107886003)(76116006)(186003)(36756003)(83380400001)(91956017)(8936002)(508600001)(54906003)(316002)(4326008)(71200400001)(7416002)(86362001)(64756008)(66476007)(2616005)(66556008)(31686004)(26005)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bElIS1dqYmZ3YjJwUHRUS0h0V0xXRlo4WmVhemo2Rks0UUxaVUxNbXhQVnJW?=
 =?utf-8?B?UDgvaWdNL3BYejZyRGorM3pwSnNobHREeHh0MGk3cW5lZkpPZHFxV3diTUE4?=
 =?utf-8?B?WWpuUjE5cTNlWFdidEdGVkRyNmJkckVwNTNSTy96SWM2ZXNsdlFqMmVMNUdi?=
 =?utf-8?B?NmNZZzJMV0hFR2kzSmwvcXdLSGVQL2wyWDBnL21kWTZ0MzEzcDlzMy9XcElC?=
 =?utf-8?B?a0g4dTQxcWZMZGVBLzhTeGxJcHp0b0ZlREJVNWFGNHdURDJOUjdWaHVWRDdM?=
 =?utf-8?B?TStVaHIzVVo5NlVGZEphdkVsU2d3SGdpNUhzeXZCOTVQWnZUWU5Idm41RjR6?=
 =?utf-8?B?SFZROGRRN3ZCTmVjY0crNHNCeFlNRVc3cDI1cUhjSlgwK2xQZVRnNTFZVDB4?=
 =?utf-8?B?N2xiZ1RIb2E3R1k0L0I4L2c4d094cHViMWRycXlvZkYvUlNXQ0lkOXVsaERM?=
 =?utf-8?B?STQ2eUdyMzV2NWNSMmtRcSt5dVBzUmVNUC93akhjbmw4dEhkd1FCQm9malhW?=
 =?utf-8?B?ajc4MWhnMjlmSkc1bm43Y2pzSjZ5cVZ6eEl4SHRuQXJtL20zNlFHUWVmNmhi?=
 =?utf-8?B?L1FLWWxxN29ON0cvbE9xYjZ3aEtXczVuVHZCWW1NQ25vNmlsZTI2Qk1RdnhI?=
 =?utf-8?B?Ni9wa1JTeTM4YzhadW5zYUFmTnYxdStXZ2lrRkJ6dW1Lc2FoQjhLRVZVS3d1?=
 =?utf-8?B?d2NMbW1temRzQ2s0QlhSdkFjdUdDQkhXUm9rSnA1Q2M5NG1lTWxTQWVWTEMz?=
 =?utf-8?B?YTNMWlM3eE5maytxOXZYYlpOQU5URVNrUmgvaDVqVXZIOWJXWmFXNDZLRkIw?=
 =?utf-8?B?ZFExbTRFM3AxcVgvZDNwTjNLaUlaUnRDZXBDcWlNZ2RjTTRiaGVLRklzaCtS?=
 =?utf-8?B?OFVEYUJ4L1pycGlmNi8wKytsamMzMWIveVVhckZTalhJenkwUE1TVG5IQWdY?=
 =?utf-8?B?bkxCRG1ZUUxSNm5aNEN4Zm5LSGRoSi9zZDVBVVpMQTZGUzk3TEdYL1gwTW45?=
 =?utf-8?B?ZUhrZ3kvWlpON1ZGZm9DbHNHYXdiay92MnRrZkxKTXRtZUM0VnRwUUhZeDZP?=
 =?utf-8?B?QmtIeDJXekJMeVZmUFgvbWI5dkhNV1h3ZVAzWXJpZThnb21pZTVEaHp3MzA5?=
 =?utf-8?B?bEZ6NU9JTXRuQkVKV1NLM2FHaytvZkpyZzNJR25pWjBQbGN6Ym5FOE9BKzhH?=
 =?utf-8?B?eDBQSGs2N3g1T0piZTF3QytibWt5UlFoS3hEVTkzWEkxb1F2SXNQUGsxRm4v?=
 =?utf-8?B?cWlHeXZURFJzcTRuem05TjdDT2NZbWZ4Y3dhTjV5ZXFScjFzREtFVVlXU1Q0?=
 =?utf-8?B?ZnhOSXU3WVRMZ2JBelhXbEFpb1lMOWhpVW9rWjh2WFp2MTFBQWpBZngxY2FD?=
 =?utf-8?B?MVgxMkhzRGIvR3piaE4veG9aSHdVdmN4Q01pT24wdm1xZ05iQUtDQXBqenZr?=
 =?utf-8?B?OTMzZ2tlRmlyOXBTWVpIdnc1WW5RVDlVZU5SbGRDTzZoc2FWOXBtMUliUHV3?=
 =?utf-8?B?d29Ba1pDRmRsdjhROEV0Zk44TEdCckEyR2pDeTFLL1R5Y3d0dFlsaTNkV3NM?=
 =?utf-8?B?M092WlkrYXJzQjNMK0tOUytlMk1BdVpCY0wrcUZMR3VuY1RrZGpCL00yUElJ?=
 =?utf-8?B?UHk1UFdQR29JenNDSHNTaXlhd1R0SW1kRkw3bW9HOXpLRGdYaG5ySmxkWXd4?=
 =?utf-8?B?UHRzdlFldXVsMDJGVWFVNVptNnNzZU9YSlNoVlkrK1ptNFl0aytNeHdlRHF3?=
 =?utf-8?B?bGpsZCtrV2w1cXQ2Wk5veHZwWmtmVG05TkI4N0dDRHcvMmVPeURISTYreFhw?=
 =?utf-8?B?amlqNnR2WjFoOGpPYkxCNnByZUlWMWZ0Rk8yZ0NqUXVkWGJ2YTA5K3dsdVFs?=
 =?utf-8?B?S0VhbCtaMnZUYmRpa0g3MGNheGI0U0crVk03KzNKeFdxam42WEd0bno5cTU0?=
 =?utf-8?B?VHo3UW1Xam5pZy9mTjM1VkhZQUQreTRSMGlYU2dpaXZSNkpsYlV4QXc1dm9o?=
 =?utf-8?B?WE44dmNDSGpHTWZRRDlBODF6ODJJdzBPZlBRaDhXeHF3Z2Zwc042SkxQTEhO?=
 =?utf-8?B?WXZpL1R6SzhmRmtSY0FyaUNDK2pTNkgxclAyYzZaUURvTkhMdnM0dTdpdUlH?=
 =?utf-8?B?OERZUzRXeG1HejVNVk5kQlRnTS8yWWovMTdTY1dFbkhXcEhwUGU3ZndvMFRw?=
 =?utf-8?B?RDErKzU1QzJ4ckdVN2ZaMEE1ajhic2Q3cTkzeWJNVGkwR1JJdkZkV1lBR05q?=
 =?utf-8?B?R3Mvc0lJbTk5ZDNpWHhjV2J1RHp4QzN6T2hlOXBNME9MUWJjLzNJOE54TjhT?=
 =?utf-8?B?YVlncDVGeUVrQ1RJREdYZkhXeWlRcWhmcXFYUE1Jby8xWU9CakJSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE2E5FA28EF2974691E13EA4DC799F5A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3685bbd-bed4-41d6-c5c3-08d9a8d3510e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 07:32:59.9561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p88hv8NHJrwwJsf3th/OjYoOIPeGYYRKr/0EWIZLVv4Ty8AeXiBmFeCcBn9LUjSNz/6/tnaDquqL3KBJAJ5TKD8eLIraWRvBMpZsql2UzKOXofMVhEU9Kbw7RrziB5aK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4147
X-Proofpoint-GUID: 9TVmSyDczkG7iMOVVg-LGsoIwtSh6EIz
X-Proofpoint-ORIG-GUID: 9TVmSyDczkG7iMOVVg-LGsoIwtSh6EIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=878 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160038

DQoNCk9uIDE1LjExLjIxIDE4OjU2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gV2hlbiBhIHZQQ0kgaXMgcmVtb3ZlZCBmb3IgYSBQQ0kgZGV2aWNlIGl0IGlzIHBvc3NpYmxl
IHRoYXQgd2UgaGF2ZQ0KPj4gc2NoZWR1bGVkIGEgZGVsYXllZCB3b3JrIGZvciBtYXAvdW5tYXAg
b3BlcmF0aW9ucyBmb3IgdGhhdCBkZXZpY2UuDQo+PiBGb3IgZXhhbXBsZSwgdGhlIGZvbGxvd2lu
ZyBzY2VuYXJpbyBjYW4gaWxsdXN0cmF0ZSB0aGUgcHJvYmxlbToNCj4+DQo+PiBwY2lfcGh5c2Rl
dl9vcA0KPj4gICAgIHBjaV9hZGRfZGV2aWNlDQo+PiAgICAgICAgIGluaXRfYmFycyAtPiBtb2Rp
ZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKQ0K
Pj4gICAgIGlvbW11X2FkZF9kZXZpY2UgPC0gRkFJTFMNCj4+ICAgICB2cGNpX3JlbW92ZV9kZXZp
Y2UgLT4geGZyZWUocGRldi0+dnBjaSkNCj4+DQo+PiBsZWF2ZV9oeXBlcnZpc29yX3RvX2d1ZXN0
DQo+PiAgICAgdnBjaV9wcm9jZXNzX3BlbmRpbmc6IHYtPnZwY2kubWVtICE9IE5VTEw7IHYtPnZw
Y2kucGRldi0+dnBjaSA9PSBOVUxMDQo+Pg0KPj4gRm9yIHRoZSBoYXJkd2FyZSBkb21haW4gd2Ug
Y29udGludWUgZXhlY3V0aW9uIGFzIHRoZSB3b3JzZSB0aGF0DQo+PiBjb3VsZCBoYXBwZW4gaXMg
dGhhdCBNTUlPIG1hcHBpbmdzIGFyZSBsZWZ0IGluIHBsYWNlIHdoZW4gdGhlDQo+PiBkZXZpY2Ug
aGFzIGJlZW4gZGVhc3NpZ25lZA0KPiBJcyBjb250aW51aW5nIHNhZmUgaW4gdGhpcyBjYXNlPyBJ
LmUuIGlzbid0IHRoZXJlIHRoZSByaXNrIG9mIGEgTlVMTA0KPiBkZXJlZj8NCkkgdGhpbmsgaXQg
aXMgc2FmZSB0byBjb250aW51ZQ0KPg0KPj4gRm9yIHVucHJpdmlsZWdlZCBkb21haW5zIHRoYXQg
Z2V0IGEgZmFpbHVyZSBpbiB0aGUgbWlkZGxlIG9mIGEgdlBDSQ0KPj4ge3VufW1hcCBvcGVyYXRp
b24gd2UgbmVlZCB0byBkZXN0cm95IHRoZW0sIGFzIHdlIGRvbid0IGtub3cgaW4gd2hpY2gNCj4+
IHN0YXRlIHRoZSBwMm0gaXMuIFRoaXMgY2FuIG9ubHkgaGFwcGVuIGluIHZwY2lfcHJvY2Vzc19w
ZW5kaW5nIGZvcg0KPj4gRG9tVXMgYXMgdGhleSB3b24ndCBiZSBhbGxvd2VkIHRvIGNhbGwgcGNp
X2FkZF9kZXZpY2UuDQo+IFlvdSBzYXlpbmcgIndlIG5lZWQgdG8gZGVzdHJveSB0aGVtIiBtYWRl
IG1lIGxvb2sgZm9yIGEgbmV3IGRvbWFpbl9jcmFzaCgpDQo+IHRoYXQgeW91IGFkZCwgYnV0IHRo
ZXJlIGlzIG5vbmUuIFdoYXQgaXMgdGhpcyBhYm91dD8NClllcywgSSBndWVzcyB3ZSBuZWVkIHRv
IGltcGxpY2l0bHkgZGVzdHJveSB0aGUgZG9tYWluLA0KQFJvZ2VyIGFyZSB5b3Ugb2sgd2l0aCB0
aGF0Pw0KPg0KPj4gQEAgLTE2NSw2ICsxNjQsMTggQEAgYm9vbCB2cGNpX3Byb2Nlc3NfcGVuZGlu
ZyhzdHJ1Y3QgdmNwdSAqdikNCj4+ICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICAgfQ0KPj4gICAN
Cj4+ICt2b2lkIHZwY2lfY2FuY2VsX3BlbmRpbmcoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgdmNwdSAqdiA9IGN1cnJlbnQ7DQo+PiArDQo+PiArICAg
IC8qIENhbmNlbCBhbnkgcGVuZGluZyB3b3JrIG5vdy4gKi8NCj4gRG9lc24ndCAiYW55IiBpbmNs
dWRlIHBlbmRpbmcgd29yayBvbiBhbGwgdkNQVS1zIG9mIHRoZSBndWVzdCwgbm90DQo+IGp1c3Qg
Y3VycmVudD8gSXMgY3VycmVudCBldmVuIHJlbGV2YW50IChhcyBpbjogcGFydCBvZiB0aGUgY29y
cmVjdA0KPiBkb21haW4pLCBjb25zaWRlcmluZyAuLi4NCj4NCj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3ZwY2kvdnBjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gQEAgLTUx
LDYgKzUxLDggQEAgdm9pZCB2cGNpX3JlbW92ZV9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQo+PiAgICAgICAgICAgeGZyZWUocik7DQo+PiAgICAgICB9DQo+PiAgICAgICBzcGluX3VubG9j
aygmcGRldi0+dnBjaS0+bG9jayk7DQo+PiArDQo+PiArICAgIHZwY2lfY2FuY2VsX3BlbmRpbmco
cGRldik7DQo+IC4uLiB0aGlzIGNvZGUgcGF0aCwgd2hlbiBjb21pbmcgaGVyZSBmcm9tIHBjaV97
YWRkLHJlbW92ZX1fZGV2aWNlKCk/DQo+DQo+IEkgY2FuIGFncmVlIHRoYXQgdGhlcmUncyBhIHBy
b2JsZW0gaGVyZSwgYnV0IEkgdGhpbmsgeW91IG5lZWQgdG8NCj4gcHJvcGVybHkgKGkuZS4gaW4g
YSByYWNlIGZyZWUgbWFubmVyKSBkcmFpbiBwZW5kaW5nIHdvcmsuDQpZZXMsIHRoZSBjb2RlIGlz
IGluY29uc2lzdGVudCB3aXRoIHRoaXMgcmVzcGVjdC4gSSBhbSB0aGlua2luZyBhYm91dDoNCg0K
dm9pZCB2cGNpX2NhbmNlbF9wZW5kaW5nKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0Kew0K
IMKgwqDCoCBzdHJ1Y3QgZG9tYWluICpkID0gcGRldi0+ZG9tYWluOw0KIMKgwqDCoCBzdHJ1Y3Qg
dmNwdSAqdjsNCg0KIMKgwqDCoCAvKiBDYW5jZWwgYW55IHBlbmRpbmcgd29yayBub3cuICovDQog
wqDCoMKgIGRvbWFpbl9sb2NrKGQpOw0KIMKgwqDCoCBmb3JfZWFjaF92Y3B1ICggZCwgdiApDQog
wqDCoMKgIHsNCiDCoMKgwqDCoMKgwqDCoCB2Y3B1X3BhdXNlKHYpOw0KIMKgwqDCoMKgwqDCoMKg
IGlmICggdi0+dnBjaS5tZW0gJiYgdi0+dnBjaS5wZGV2ID09IHBkZXYpDQogwqDCoMKgwqDCoMKg
wqAgew0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmFuZ2VzZXRfZGVzdHJveSh2LT52cGNpLm1l
bSk7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2LT52cGNpLm1lbSA9IE5VTEw7DQogwqDCoMKg
wqDCoMKgwqAgfQ0KIMKgwqDCoMKgwqDCoMKgIHZjcHVfdW5wYXVzZSh2KTsNCiDCoMKgwqAgfQ0K
IMKgwqDCoCBkb21haW5fdW5sb2NrKGQpOw0KfQ0KDQp3aGljaCBzZWVtcyB0byBzb2x2ZSBhbGwg
dGhlIGNvbmNlcm5zLiBJcyB0aGlzIHdoYXQgeW91IG1lYW4/DQo+DQo+IEphbg0KPg0KVGhhbmsg
eW91LA0KT2xla3NhbmRy

