Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF14A6F73
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 12:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264049.457002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDQ5-00057A-VV; Wed, 02 Feb 2022 11:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264049.457002; Wed, 02 Feb 2022 11:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDQ5-00054Q-SA; Wed, 02 Feb 2022 11:03:25 +0000
Received: by outflank-mailman (input) for mailman id 264049;
 Wed, 02 Feb 2022 11:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFDQ3-00054K-SK
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 11:03:23 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1699d0-8417-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 12:03:22 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212Ap4Oh004245;
 Wed, 2 Feb 2022 11:03:17 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dyrjfg24k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 11:03:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AS8PR03MB7891.eurprd03.prod.outlook.com (2603:10a6:20b:422::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 11:03:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 11:03:14 +0000
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
X-Inumbo-ID: bc1699d0-8417-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqPi1s5h+0F70yL5sHMFoljDbCSgKCtXVR40pwE8QCt0uMkKabFLwhwWh8QWszn/+3cY4QjnJaz6vUDZnxtm9F5psQG+jceqE4Bl7IqndiKZVz1c6W/X83AYpDcAVKRN2evhn/xajYBiXJKy8Vp3r/2S2nNu7AhdaCTEBWanzoqW+ISr1DdVuF9b88zgJTgrMSjBhQLcK7KxUkBQjs+O0sA9WrZ/lvvW8FA5Y27jxoHBKzs6GmgNXFcodohLUqEeoLs6om5YFL3webh8YTcb8aoWP3WVGyiVDgBml20gQDbzNS9UYi83V19JXnmbp+zdQJ3IfYaF9qEO85bZW7UgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCID1JbPiDqEq8PtEn9va1XZ14Alrt4jM3y//e+EYhc=;
 b=PKlnrZfMXggjCkTOosgG9mXx7tIl/GUBNpSFmQJVudeNQg9m5ILqHsmUntXNLlAlKEfKYeBOspzorrQPtdO5Ywf3VVInsftdyCXip5emN1oG4ljliYzKtD2/I577nhGGr+nxIBMYp06D3umLGA7b9HxkmIYQOB/fcpuXyxwLvE7FLI+RwmJLykId+0wB5Q6M6jxRonrQGgMh4rv0rDIx9NvrQhVbJ9JiTNBczsnvAMv1snrEANY4MC23GMdtDgaIE2fak2a/RGwYV2gl8AEKW/ishZ/MHeQd7FoQE6DVDATR3KwEBuAxSprNWKmUL8DgHrxWNLlFvwvpFLkNDZmPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCID1JbPiDqEq8PtEn9va1XZ14Alrt4jM3y//e+EYhc=;
 b=sXwaRJpxx06P7ljkHq/6F6rglfaz4u258KaV+FqHr86pwN3hbja6Gm7pIiDvbarzVwXLEJ//zws4jGFR/0h96Jn8zKG6z1dXTHWZ6m+SM1Cvy9uL6ecVh+zdgHyhRYIzct6KtSi6WZKblPqJR+40reCvI3Qvqvel/TWwYdd8E5M1UOLo/RvdDw3/BX0BgggA1dAfG9t6QEFFlE4QcW52jKGnhZ1AjjiOZnukmrMBqr+jwStCLcauyFH/DCdBEFPSbMY15hb7RH/9DwgTlWsx5MNTJl2RQz7IQjVET1CgGISJBavdcQ9Wgu4FtSY9pAazR9AfkLBpnRMtv1xjio74iQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
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
Subject: Re: [PATCH 4/4] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH 4/4] vpci: move lock outside of struct vpci
Thread-Index: AQHYF4hPRx/tX4vEOUaqhaVglKUz1ax//dWAgAAcC4A=
Date: Wed, 2 Feb 2022 11:03:14 +0000
Message-ID: <e19a0f7a-651e-09a6-c03d-ea5286fe03ba@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-5-andr2000@gmail.com>
 <fc3df33c-d1e5-8c74-01e9-7ea7cea41521@suse.com>
In-Reply-To: <fc3df33c-d1e5-8c74-01e9-7ea7cea41521@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f01d493-f33d-43b3-b988-08d9e63b9bdc
x-ms-traffictypediagnostic: AS8PR03MB7891:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB78915F08160E235977ECABE1E7279@AS8PR03MB7891.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sj6+1ll06/0iKImsZffVyMUvj2weC5Oy2QWqMni4KyWH5w/UhaH0vuz269UtBhLFDrLuuX/bzCu9rwcLLzgew0puTttup8k5ZRp1QP/lshfkxxN0obsBROROHko3Xdbq027qHYXRKMxdB/iFwsEs1yiCcXG4EBpPbJE2H7fqI8WMYQckWgNsPdHhIxwe4/5rILAuWUqqNNnkuuc+6AcK9cybNmOgqgICa676zr2zPL2IflfLpwJmZCRBkQNctALTRoJUelEpUIHu78B3PeSceMu+NjYxrRo1wz0I5iMugwICQ5mD5hrfNhCF/TuoatER+jKZ9twI1NXE8FHFEK5Yxie6NAG3f0xo+SzdFNtG/S3DRWG2ZqblSSVAPReAnyZR5UJA/k+WZiby5DFBJysmVoWKZPWxeJZjB/3uQ0xbUfA/Mfn8YnvbdTxysZJJAP8EZ5bzxD3FwVNzq0hRokZNdfrrupHjqmxN9TVgWHQJW8qfE/39KNpeXRhxFVC6JXqXDUOrmbVO1KJOVYzMzM83rS/+I9ZXfzgQkAO5hsHwpYej0Q5CN/D0muqC7ToRZ5zoQPTYBqbe4x2zRWUTyWtp255TXhTbhhCjcioxr8YidiEcdNqRzTLhxIldjupnS6uweqgaCg27vWh7LTIDSGVN2Y4Z2O9qqXSSIMYUrXdeEpna8163QNpPrWr81iH5okJ3KQs0tdkJe3WwVum530WEoRQlENkAxuehQPH9Gka2bQJASIT42JBfcIEgt+iFUqIYdMxV/9aMIrL0rkNUEOzrKF+OlZhsIgXWtpqS4xgvB9rotpm+UjlaZIuPa3eFtc3j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(186003)(26005)(4326008)(6506007)(8936002)(8676002)(66476007)(64756008)(66446008)(91956017)(71200400001)(66946007)(31696002)(76116006)(86362001)(6512007)(66556008)(7416002)(5660300002)(107886003)(53546011)(2906002)(36756003)(2616005)(122000001)(110136005)(508600001)(54906003)(316002)(38070700005)(966005)(38100700002)(6486002)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WTZMeEhsWXJWc3FqcnhxZEpYbWZ1ZnB4Wnc3VmdETlVqY0lzOUJvWVpkQzcx?=
 =?utf-8?B?aFUrSlJpZm5IQ1lFUEhjeWNncUU5MnF3cDlzQnNwKzZmSFIvRmlycjRGbTAw?=
 =?utf-8?B?bFJMM0kwUUM2WWdiUGw2QW5Qa08vRzFUNlp1RDQ3cm9QanBHTzVldHdHbGp3?=
 =?utf-8?B?RVZxRzFEZWFtL0FjVWRqaituRUl6b29TM3prQk5GK0I5WFFPQnBCNGxaeG1s?=
 =?utf-8?B?d3RmMUhxTmJlWlBGR1lmV28xY0t5SkpJYnlGUWJEd1JDaXphOG1EZVMwQng2?=
 =?utf-8?B?dFVuWGNDVUM1SlZLaEpjczNkeGJLa3BJY0VMUUxqTzNUS000cE8xYTd0UEV3?=
 =?utf-8?B?NVp5eTJWUElzdmZSb3lDMFFycExQZGg3ZS9JV0VnK3FPalRmNDJkWldRUFp3?=
 =?utf-8?B?WWlCbUhHRjRBdWxQYnZVM3VNTnRNcUNKbk82a3doZDVGY1RySXBnV1I4UVQr?=
 =?utf-8?B?WTZXNm5EY2tub2VhakZ4eWVtd0FDVEpVQXpFdDhsdnB5Zzd4MStTbCs5a1NI?=
 =?utf-8?B?VDlsTjRQOExYQXptWXNjaW8vUFh2Znk4UTFaTUR0b3FJclRld0xqWHgrV0tE?=
 =?utf-8?B?OVJBYjh6aTZoY3NSQy9oVHZIYjRGNWVQV0YvcHR2MU8xNXhhVFVtZEJRQjU4?=
 =?utf-8?B?M3V1WSt5cnVoOFNkZUZxTEZ1aFlUdGFNSkczYmo5bFNubDA2SXNEVVFTMUZ4?=
 =?utf-8?B?Z2VZUS9zbldta3NSTWhUMzRiYWdWYkU3WWhRRHYzL1JxWFh2eGVFR2dRL3h4?=
 =?utf-8?B?K0RrTEJ1V2dDR1BSQnd2WENoeE9jVlJvdzZoTHkrbVRPaDcwNWQxamNHaVFY?=
 =?utf-8?B?VVNMZjg0Ky9KLzY3U2pGTVFwRW5Fc0ZITmhtdlI1dTkvcHZKdkpSQXovazRa?=
 =?utf-8?B?R3hrZkdOdko4U3NmOFBEdytjZ0tIR1p0L3pCQWJ0bGtrQmE1YW83M1k1OWxz?=
 =?utf-8?B?U29WUGFnWHJFRk1zUDZKbnFaVFgxN3MzUmJPZzJqK0NydVQ2SHhJL1Bla3pk?=
 =?utf-8?B?ZzA0QzF1YlYxcmd0cmJQZXJ0VzRCT3NvMERJckMrRHpLRnVXY2JUUnZ5MzRs?=
 =?utf-8?B?WVBUVDFYQVg0MnhjOXlEWWg1dk9TaTNlYS9lMk1DNWE0aW12ZnJpSHlBZEZW?=
 =?utf-8?B?Wkl2VVNsU29hRXBBd09ncjE0WXhlenlDWWN3cldLUGJLOEJmSVZxdFRIZlVy?=
 =?utf-8?B?MHEvZHNQc0hyT1dzcXlkeWpjVFhsUS93VGJwaWxaVkVhN1FST28zY3Y1ME5O?=
 =?utf-8?B?MXV4Wnc4M3p3RWc3T3FkZVlNbUJ2RmJNN2JUQ0xYaVpkZEZLaHNXVmgvOHNY?=
 =?utf-8?B?RWs1U2JlUHc3aFVuYW9wY3Awc1dvVzZHcUdHYUttUHdqZ1M4ZmhGRHVzVXlH?=
 =?utf-8?B?TmphWnlBakptREJXb3dsS28yaTRLZmw3S0h1R1IzTEJPaDlSUEtWQmtpSXBl?=
 =?utf-8?B?VmgraEtteTJoU1plazVSQUNrcHBWUHFjTTIvaGR0aFBWUmp0eWxaZjVIT084?=
 =?utf-8?B?cU9XRkpxdjdkQUo3UEljbXMyc21sbjhoZlA2eXdwT3JPZ0lIRVRKWHFnUjk5?=
 =?utf-8?B?dmFxSUFHWkRLd1p6R0gweGQxVjVtNjdTNlpLbEZRT0IzcE5Fc0Y5VEtla2lV?=
 =?utf-8?B?S2laTmNRVGpaZDNnY0pJN1k2TUFFeVpkbkRBNDNhOGNmdWRwSFdNcGEyeW9Y?=
 =?utf-8?B?QjJPYitvS252Y1pDb2NtRHd4N1A5VHBadjJSeEhPRzFxUXdVOFVjM1lCcjEz?=
 =?utf-8?B?eEtLMkFLZkM2L28yNGNQTWY4K1JncU1KbWtNdUlDRjZ4Q29tK1RSc1FscFJ2?=
 =?utf-8?B?NHJMb2FWa2ZkNWNHckJpb2hBU3pEbjlaRHlGbmtxQkdZUEZGSkJaNS8rRlUy?=
 =?utf-8?B?dXFxUzY1RkRtdnBRMWxOelBocGdEY2MxUkFNZjkwcTNhVUVRU2szQzlRRHRq?=
 =?utf-8?B?RHNLNGx0UlRCMGNpTmhrRW5QWGpuWk5IbGQvZ05IM3I1eUpYSm9Za1VGYWFU?=
 =?utf-8?B?Z2lGSnYzQ2tvYllsbUNnSDRDZjFuN2VhK2E0TjBlYUlUMktycmRnYURCbjVT?=
 =?utf-8?B?NVd4R1NCS1MweEZXbUlhK1hjbjlKOFUrMncxMDdDZDdZQWdWWlVaSU9wSUNl?=
 =?utf-8?B?OFVVa3JTbFpuTHRwTU42dExNMHZaVTcyRllHVGQxd05nMVVRNjhSUDRCVUpq?=
 =?utf-8?B?dWY1QkNYNUl1MWxMM2tUSmpBZUlZWFNuelVoZUEvZXNScm8vNWUzd3c0eXVm?=
 =?utf-8?B?Um81UnRXb3dza2hnV3ladDhTYklRa003NmMzL3FRMDhmWVgvM1ltOWJETEs0?=
 =?utf-8?B?bEE5enl3bTNnVWREd3YzUWVMaTdhSm1IcDZ0LzdwYlpZbGVQWm13UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26683A6487432A46ABA669D5E86A73B7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f01d493-f33d-43b3-b988-08d9e63b9bdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 11:03:14.1560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cn3Sim0lZvo9A473dLtaxYT4PLagaTJiNtwO2HjrtTeIsv4M6fh2ta4q2ayjcj3PjzGnO+J1btbE+4qB7k/c58k8CIVIT34u2o2yYbTyhmD6JJZDLXjPiJB52pxV2itg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7891
X-Proofpoint-ORIG-GUID: udF-F0vuxdc83QacmVanjNYovD4J18QL
X-Proofpoint-GUID: udF-F0vuxdc83QacmVanjNYovD4J18QL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_05,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=956 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020059

SGksIEphbiENCg0KT24gMDIuMDIuMjIgMTE6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
MS4wMi4yMDIyIDE3OjI1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEZyb206
IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pg0KPj4gVGhpcyB3YXkg
dGhlIGxvY2sgY2FuIGJlIHVzZWQgdG8gY2hlY2sgd2hldGhlciB2cGNpIGlzIHByZXNlbnQsIGFu
ZA0KPj4gcmVtb3ZhbCBjYW4gYmUgcGVyZm9ybWVkIHdoaWxlIGhvbGRpbmcgdGhlIGxvY2ssIGlu
IG9yZGVyIHRvIG1ha2UNCj4+IHN1cmUgdGhlcmUgYXJlIG5vIGFjY2Vzc2VzIHRvIHRoZSBjb250
ZW50cyBvZiB0aGUgdnBjaSBzdHJ1Y3QuDQo+PiBQcmV2aW91c2x5IHJlbW92YWwgY291bGQgcmFj
ZSB3aXRoIHZwY2lfcmVhZCBmb3IgZXhhbXBsZSwgc2luY2UgdGhlDQo+PiBsb2NrIHdhcyBkcm9w
cGVkIHByaW9yIHRvIGZyZWVpbmcgcGRldi0+dnBjaS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4NCj4+IC0tLQ0KPj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+DQo+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gQ2M6IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPg0KPj4gLS0tDQo+PiBOZXcgaW4gdjUgb2YgdGhpcyBzZXJpZXM6
IHRoaXMgaXMgYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBwdWJsaXNoZWQgYXQNCj4+
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4t
ZGV2ZWwvMjAxODA3MTcwOTQ4MzAuNTQ4MDYtMi1yb2dlci5wYXVAY2l0cml4LmNvbS9fXzshIUdG
XzI5ZGJjUUlVQlBBIWptbWNld1k2eTlVcjRyZ3ZPZ3FzY3o4Z0JXYW9kMkpuUU9rSHZXdFlLZ25x
ZVU2Qm9XSlRxQ04zVURwQ3czaW84WW5rLXdCWGhBJCBbbG9yZVsuXWtlcm5lbFsuXW9yZ10NCj4+
DQo+PiBDaGFuZ2VzIHNpbmNlIHY1Og0KPiBUaGlzIGlzIGEgbGl0dGxlIG9kZCBpbiBhIHNlcmll
cyBpbXBsaWNpdGx5IHRhZ2dlZCBhcyB2MS4NCj4NCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kv
aGVhZGVyLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IEBAIC0xNDIs
MTIgKzE0MiwxMyBAQCBib29sIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQ0K
Pj4gICAgICAgICAgIGlmICggcmMgPT0gLUVSRVNUQVJUICkNCj4+ICAgICAgICAgICAgICAgcmV0
dXJuIHRydWU7DQo+PiAgIA0KPj4gLSAgICAgICAgc3Bpbl9sb2NrKCZ2LT52cGNpLnBkZXYtPnZw
Y2ktPmxvY2spOw0KPj4gLSAgICAgICAgLyogRGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgdW5jb25k
aXRpb25hbGx5IG9uIGZhaWx1cmUuICovDQo+PiAtICAgICAgICBtb2RpZnlfZGVjb2Rpbmcodi0+
dnBjaS5wZGV2LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgIHJjID8gdi0+dnBjaS5jbWQg
JiB+UENJX0NPTU1BTkRfTUVNT1JZIDogdi0+dnBjaS5jbWQsDQo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgIXJjICYmIHYtPnZwY2kucm9tX29ubHkpOw0KPj4gLSAgICAgICAgc3Bpbl91bmxv
Y2soJnYtPnZwY2kucGRldi0+dnBjaS0+bG9jayk7DQo+PiArICAgICAgICBzcGluX2xvY2soJnYt
PnZwY2kucGRldi0+dnBjaV9sb2NrKTsNCj4+ICsgICAgICAgIGlmICggdi0+dnBjaS5wZGV2LT52
cGNpICkNCj4+ICsgICAgICAgICAgICAvKiBEaXNhYmxlIG1lbW9yeSBkZWNvZGluZyB1bmNvbmRp
dGlvbmFsbHkgb24gZmFpbHVyZS4gKi8NCj4+ICsgICAgICAgICAgICBtb2RpZnlfZGVjb2Rpbmco
di0+dnBjaS5wZGV2LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICByYyA/IHYtPnZw
Y2kuY21kICYgflBDSV9DT01NQU5EX01FTU9SWSA6IHYtPnZwY2kuY21kLA0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAhcmMgJiYgdi0+dnBjaS5yb21fb25seSk7DQo+PiArICAgICAg
ICBzcGluX3VubG9jaygmdi0+dnBjaS5wZGV2LT52cGNpX2xvY2spOw0KPiBXaGlsZSBJIGNlcnRh
aW5seSBzZWUgdGhlIHBvaW50LCB0aGUgYWRkaXRpb24gb2YgdGhpcyBpZigpIChhbmQgYQ0KPiBm
ZXcgbW9yZSBlbHNld2hlcmUpIGlzbid0IGNvdmVyZWQgYnkgdGl0bGUgb3IgZGVzY3JpcHRpb24u
DQpUaGUgY29tbWl0IG1lc3NhZ2Ugc2F5czoNCiJUaGlzIHdheSB0aGUgbG9jayBjYW4gYmUgdXNl
ZCB0byBjaGVjayB3aGV0aGVyIHZwY2kgaXMgcHJlc2VudCwgYW5kDQpyZW1vdmFsIGNhbiBiZSBw
ZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0aGUgbG9jaywgaW4gb3JkZXIgdG8gbWFrZQ0Kc3VyZSB0
aGVyZSBhcmUgbm8gYWNjZXNzZXMgdG8gdGhlIGNvbnRlbnRzIG9mIHRoZSB2cGNpIHN0cnVjdC4i
DQpTbywgSSB0aGluayB0aGlzIGlzIGVub3VnaCB0byBkZXNjcmliZSB0aGUgZmFjdCB0aGF0IGFm
dGVyIHlvdSBoYXZlIGxvY2tlZA0KdGhlIHByb3RlY3RlZCBzdHJ1Y3R1cmUgbWF5IGhhdmUgZ29u
ZSBhbHJlYWR5IGFuZCB3ZSBuZWVkIHRvDQpyZS1jaGVjayBpdCBpcyBzdGlsbCBwcmVzZW50Lg0K
Pg0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJz
L3ZwY2kvdnBjaS5jDQo+PiBAQCAtMzUsMTIgKzM1LDEwIEBAIGV4dGVybiB2cGNpX3JlZ2lzdGVy
X2luaXRfdCAqY29uc3QgX19zdGFydF92cGNpX2FycmF5W107DQo+PiAgIGV4dGVybiB2cGNpX3Jl
Z2lzdGVyX2luaXRfdCAqY29uc3QgX19lbmRfdnBjaV9hcnJheVtdOw0KPj4gICAjZGVmaW5lIE5V
TV9WUENJX0lOSVQgKF9fZW5kX3ZwY2lfYXJyYXkgLSBfX3N0YXJ0X3ZwY2lfYXJyYXkpDQo+PiAg
IA0KPj4gLXZvaWQgdnBjaV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4g
K3N0YXRpYyB2b2lkIHZwY2lfcmVtb3ZlX2RldmljZV9sb2NrZWQoc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQo+PiAgIHsNCj4+IC0gICAgaWYgKCAhaGFzX3ZwY2kocGRldi0+ZG9tYWluKSApDQo+PiAt
ICAgICAgICByZXR1cm47DQo+PiArICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmcGRldi0+dnBj
aV9sb2NrKSk7DQo+IFdoaWxlLCB1bmxpa2UgaGVyZSwgLi4uDQo+DQo+PiBAQCAtMTUyLDggKzE2
NCw2IEBAIGludCB2cGNpX2FkZF9yZWdpc3RlcihzdHJ1Y3QgdnBjaSAqdnBjaSwgdnBjaV9yZWFk
X3QgKnJlYWRfaGFuZGxlciwNCj4+ICAgICAgIHItPm9mZnNldCA9IG9mZnNldDsNCj4+ICAgICAg
IHItPnByaXZhdGUgPSBkYXRhOw0KPj4gICANCj4+IC0gICAgc3Bpbl9sb2NrKCZ2cGNpLT5sb2Nr
KTsNCj4gLi4uIHlvdSBkaWQgZXhwbGFpbiB3aHkgeW91IGRvbid0IHdhbnQgdG8gYWRkIGEgc2lt
aWxhciBhc3NlcnRpb24NCj4gaGVyZSwgSSB0aGluayBpbiByZXR1cm4gdGhlIGZ1bmN0aW9uIHdh
bnRzIHRvIGhhdmUgYSBjb21tZW50IGFkZGVkDQo+IHRoYXQgaXQncyByZXF1aXJlZCB0byBiZSBj
YWxsZWQgd2l0aCB0aGUgcmVzcGVjdGl2ZSBsb2NrIGhlbGQuDQpXaWxsIGFkZCB0aGUgY29tbWVu
dHMNCj4gICBJDQo+IG5vdGljZSB5b3UgZGlkIHNvIGZvciB0aGUgZGVjbGFyYXRpb24sIGJ1dCBJ
IHRoaW5rIHN1Y2ggYSBjb21tZW50DQo+IHdvdWxkIGJldHRlciBiZSBwcmVzZW50IGF0IHRoZSBk
ZWZpbml0aW9uIGFzIHdlbGwuIFNhbWUgZm9yDQo+IHZwY2lfcmVtb3ZlX3JlZ2lzdGVyKCkgdGhl
biwgb2J2aW91c2x5Lg0KT2sNCj4NCj4+IEBAIC0zMTEsNyArMzE2LDcgQEAgc3RhdGljIHVpbnQz
Ml90IG1lcmdlX3Jlc3VsdCh1aW50MzJfdCBkYXRhLCB1aW50MzJfdCBuZXcsIHVuc2lnbmVkIGlu
dCBzaXplLA0KPj4gICB1aW50MzJfdCB2cGNpX3JlYWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25l
ZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSkNCj4+ICAgew0KPj4gICAgICAgY29uc3Qgc3Ry
dWN0IGRvbWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsNCj4+IC0gICAgY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXY7DQo+PiArICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4gICAgICAgY29u
c3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnI7DQo+PiAgICAgICB1bnNpZ25lZCBpbnQgZGF0YV9v
ZmZzZXQgPSAwOw0KPj4gICAgICAgdWludDMyX3QgZGF0YSA9IH4odWludDMyX3QpMDsNCj4+IEBA
IC0zMjcsNyArMzMyLDEyIEBAIHVpbnQzMl90IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVu
c2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplKQ0KPj4gICAgICAgaWYgKCAhcGRldiAp
DQo+PiAgICAgICAgICAgcmV0dXJuIHZwY2lfcmVhZF9odyhzYmRmLCByZWcsIHNpemUpOw0KPj4g
ICANCj4+IC0gICAgc3Bpbl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+ICsgICAgc3Bpbl9s
b2NrKCZwZGV2LT52cGNpX2xvY2spOw0KPj4gKyAgICBpZiAoICFwZGV2LT52cGNpICkNCj4+ICsg
ICAgew0KPj4gKyAgICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2lfbG9jayk7DQo+PiArICAg
ICAgICByZXR1cm4gdnBjaV9yZWFkX2h3KHNiZGYsIHJlZywgc2l6ZSk7DQo+PiArICAgIH0NCj4g
SW4gdGhpcyBjYXNlIGFzIHdlbGwgYXMgaW4gaXRzIHdyaXRlIGNvdW50ZXJwYXJ0IGl0IGJlY29t
ZXMgZXZlbiBtb3JlDQo+IGltcG9ydGFudCB0byBqdXN0aWZ5IChpbiB0aGUgZGVzY3JpcHRpb24p
IHRoZSBuZXcgYmVoYXZpb3IuIEl0IGlzIG5vdA0KPiBvYnZpb3VzIGF0IGFsbCB0aGF0IHRoZSBh
YnNlbmNlIG9mIGEgc3RydWN0IHZwY2kgc2hvdWxkIGJlIHRha2VuIGFzDQo+IGFuIGluZGljYXRp
b24gdGhhdCB0aGUgdW5kZXJseWluZyBkZXZpY2UgbmVlZHMgYWNjZXNzaW5nIGluc3RlYWQuDQo+
IFRoaXMgYWxzbyBjYW5ub3QgYmUgaW5mZXJyZWQgZnJvbSB0aGUgIiFwZGV2IiBjYXNlIHZpc2li
bGUgaW4gY29udGV4dC4NCj4gSW4gdGhhdCBjYXNlIHdlIGhhdmUgbm8gcmVjb3JkIG9mIGEgZGV2
aWNlIGF0IHRoaXMgU0JERiwgYW5kIGhlbmNlIHRoZQ0KPiBmYWxsYmFjayBwcmV0dHkgY2xlYXJs
eSBpcyBhICJqdXN0IGluIGNhc2UiIG9uZS4gWWV0IGlmIHdlIGtub3cgb2YgYQ0KPiBkZXZpY2Us
IHRoZSBhYnNlbmNlIG9mIGEgc3RydWN0IHZwY2kgbWF5IG1lYW4gdmFyaW91cyBwb3NzaWJsZSB0
aGluZ3MuDQpPaywgSSdsbCBkZXNjcmliZSB0aGlzIGNoYW5nZQ0KPg0KPiBKYW4NCj4NClRoYW5r
IHlvdSwNCk9sZWtzYW5kcg==

