Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C934A3ECA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 09:44:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262784.455144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESHT-0001Bk-00; Mon, 31 Jan 2022 08:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262784.455144; Mon, 31 Jan 2022 08:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESHS-00019d-Sy; Mon, 31 Jan 2022 08:43:22 +0000
Received: by outflank-mailman (input) for mailman id 262784;
 Mon, 31 Jan 2022 08:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nESHQ-00019W-VI
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 08:43:21 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d67bf134-8271-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 09:43:19 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20V8Rne6031079;
 Mon, 31 Jan 2022 08:43:14 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dxbec883e-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 08:43:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB3527.eurprd03.prod.outlook.com (2603:10a6:209:2f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 08:43:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 08:43:09 +0000
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
X-Inumbo-ID: d67bf134-8271-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXrZEi27VylNN4cHBDGNDPq5l0bH6GibWvUrnr4vKLX9nib0esFSh+yhP0bR6sAf4nW6G+rgKwFFXf0fh+R/K+vktxaRxTvuZrvudAOMwhJYY7R6AJ808hK1apxLeSAipZBz2ZtA5qJ/yPOCMRruvwo9fgBeZsRP7ENVovJOMC+XnrkRMH0xn1mGwXd9mCBalkncbhBQOZhNGNDDZ5Xi7zmNPVNpSH0kDHnYNp1o8eZEyZ0wTu/DKLmWgmKtcfT2nMVVZDcZ7jrvxKvSrMbSz1zRtN87y5nzN4YpdODhk5kFhEJ6cpiAVeeXo4SgyDuvdP0eM2eiO6a2aBaf5nfMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi7mt3b2NpE2e6cA2+x+xfiJKbAJAE8EhqcCmsiMmR0=;
 b=FNT6bs92dL5C7wcVW3rbupIWEo3B4AK0sgRjM4+wypYx6AhPzaE5fcPjvz5XSlHLwMiSdZttqAexC4jGJnlWkZLeDI88U1aZQZ7EI6bAC0/jVtkmBAgFLfJRDLdduEY9xn9KNgv5vTlW1TZizPGzTtGK79vx3WkH1RgYwZLTfFIDLLgKeAESvIlH2/C2/s1uHJL1ucRYH9xPGHZHhvC5d+3rDqyiKcnt5LnnHZiPnkjGrc5s9zJbAKjcuVC7SXFm+y4VH2eJZPPcoJPN6g+c+0XDPMTSAzQBZRBpnng6Q7y5Kdh16PswulqYSW9W3Mdhg1F1RtFyi1aHWjF6TrK1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi7mt3b2NpE2e6cA2+x+xfiJKbAJAE8EhqcCmsiMmR0=;
 b=KemB+kqqn+ebBkSqY8hddfcLSJuPo5E+S70ju368rRHyzR4xOlg7IhQyW3rdyOwkPLtjrdDzY2GU68gtmXxEVacZKsKpavuBviJ7PkrHaPgNTVWAnlhcYVC+RugfJuZhSqUaqwUxM/djUg0BSm3unkU+XVHppMLB3t2nSCbesbegucvKdiK3pDiPujPAI+eWQ5QivJgklqFVO6MkwasPXyXag21eb/kGKf1JOLCgnhvqXUPTeccAKe9qvlImYU6hSDUqBuqZVMIgY/RfH8rca1VX6pEG9Q0b4mCPGVGAFt1YaXqEnABgk33kDi5nEhvdJG7zmzrSI4WZN5mkWBpliw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v5 05/14] vpci: add hooks for PCI device assign/de-assign
Thread-Index: AQHX4ewGcVFZUW6RNkyJ6BxXBZzZQqxfl2oAgB2h4gA=
Date: Mon, 31 Jan 2022 08:43:09 +0000
Message-ID: <68216461-e179-377c-48c3-ab8ca5a5aaf4@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-6-andr2000@gmail.com> <Yd7FnIQAw4J03/MG@Air-de-Roger>
In-Reply-To: <Yd7FnIQAw4J03/MG@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d4d6df4-c61b-41e1-3911-08d9e495b58c
x-ms-traffictypediagnostic: AM6PR03MB3527:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB35278E49DA146371D80EA44BE7259@AM6PR03MB3527.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 U1VAdNSNZ3nKk3EBUnx+ZUwEPRPu4T5/E1e/QM0yMBwSgKncGSXgd7VBhOSfsrRVfoDK0Pqd81KNgbT5q9KjJ5DX+3qCAfouFVosAl5Osvu6B8M4V/m5PvgzRD1tQ/zxO9tjlqXv1OHJ5SV4tATs/YdzO1MbkhlXnb+ODgqnriGUzsrDM9Zm8T02zPFiRf/8gzJlcFV81y5NM08teA9r7zMvXITcVmVI4Zz3JI3Dsl2hMigQAAc3muVNgkdHEox4SxicaKhdiuq0eWdTn2nSFBy9LRVlboOtWTCCvqPxXE5A2NZG2tl6Dt8O/JT6/tiR4CVG3ZoultRjqLnNRB1MKTiKd4Q9cGHeqqmF49H9wHNEH4Oq6bdJXRUDqqIre6bVkJhECUqSVS0IoWXBckjYXu/FRdCplwg/MZaqwsCDq8Kk09I1LZeGdJatHvYQR1bBSk/a+2gebbbGzSlrVkD2cyQwlKwBoe0E4HEgkJq2nbr8CHLHeQRAoQkdu0bArf96GTSYKyGpSK3QWhDOWeHS+y02p4QJZEuvHNy9xNkZewUjdVn4s1YjzdE+p6Ry2f+ZyjzmzDSLkCL5pO5coB8kNfuOrpxkiDf8cBLu0WYEGcWmQfqrOgeP1X8e7fveZ+pILXDqgC93sIaOP5/rQ6n67J1I+z2UexiEpejMZ+WebRP+reqfMfEHdrvk+gK9Th8AiMPDEJN30CanAzhi9IemhTj8sZqWPKBJ++cJ4vSLv/7vqLWU1v1KKfV3gt8TSs4g
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(36756003)(2906002)(83380400001)(26005)(38070700005)(186003)(508600001)(2616005)(6916009)(316002)(31686004)(6486002)(54906003)(8936002)(7416002)(71200400001)(91956017)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(53546011)(5660300002)(6512007)(31696002)(86362001)(122000001)(6506007)(38100700002)(4326008)(8676002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?amlBeWJHUTRnTnhQcjMycFBZOVRIWmRiMlZmYytsZ1l0eExkV3YyNWlTdGxx?=
 =?utf-8?B?SUhob0h0dGJrL1BZc0NPbysvVTdtWmlSVm5ZWG9NUndOQkFzMFNhVjhJTDYy?=
 =?utf-8?B?N0VGQTcrSHBlYkJuWEdrcG1aZzFydlJwZWJnWm1sdmZCRXQ1SG9nOCtGTUlE?=
 =?utf-8?B?U2NVRHFxaGVwTWtneXY2dStxcm4rditDUk1zOENYYTJhZnFXSS96Y3BRa0VV?=
 =?utf-8?B?MmgwdkY2NXpJbXY2OGV4SmxOSmxsY2tFelUxNFdYUForeDB6RzJZemgrSStW?=
 =?utf-8?B?bUx0cWNQY29vUDVWTTFFY0lrMGhBbGlPckRIYXFqQ2o0T01oZVVHZlp5clhq?=
 =?utf-8?B?ZWtZSVIzQmZkdkZXYWxHc2NTQXlsQ0NWN0wrQ3VENDJtc2JsZEdkOVpRaWpa?=
 =?utf-8?B?YjRLVnV5V3Rua25GQ2NpQmw0NHlQZUxXVTB4d2Jib1ZPT1dpbytjUVNNNCs4?=
 =?utf-8?B?WTB0cW1YdlVUUEFBZXdiRUJIMkVrbnBDNUtRSVRkbDRMOTdGN1BzVzZ1Sklq?=
 =?utf-8?B?cnlhblFKVEZTOExRa0phU3hLQzFpeFJTQ2hpeEtCWjR1TndoVlZtb2RrUFE2?=
 =?utf-8?B?L3BuWGE4bFljWTdONkN1ckFlcmliK1NtaExtVWpQWDBabWhZcHduV0hPVWla?=
 =?utf-8?B?R3hUNVFLY3FWQVlZakhpR3kvVXpMR1hkR0xHUTRaWHFGRWRkQWF6Q09IRVll?=
 =?utf-8?B?SE5QejZFOEE2VW5EQVYrSjlHbk5OWTljTldyeGl0T2diTjkyYzlKb2hoNlkx?=
 =?utf-8?B?TGpuNEhhaFdETmJWUkRVWFNMUk51Y2dXSStNSjNiZ2h5U0VUc3RnNWVLLy9m?=
 =?utf-8?B?VDMvaTh2Z3V2YU0vZDhrSTB5NUtOM0cwa2ZqUUR2dEtETXlYK1VtOFQ5ZWl2?=
 =?utf-8?B?Vng2NFFydk5seU9JZWpEc0JLQmlwc3R6WEJJRmpBYzFpMGNUZ1c3WHVVZ0Jm?=
 =?utf-8?B?SVY2eXg3SnYyTXBhRS9nL0hUcldxM0o2VDYrSEs3NHQxUnJmK1JHSHkvcmtY?=
 =?utf-8?B?YndVUFd0bVI4Q3p6Zm5iMUdjNEhvbFIzWS9LSmMyVXg2T0VqcWRDYXJuRGJR?=
 =?utf-8?B?UmtoL2czeUdkdkN0aFdkbExPUzFpYzJGQnBUczBYNGorUk1namVLM1JWMmVP?=
 =?utf-8?B?UnJ0SWhyOTRhZHpaMFFzclcrMGxUNTE1cmtXTi83cVdHRTNTRWhZeG1qdnZ3?=
 =?utf-8?B?Z01sL1VTM0JqSG02OWtlSzNPaVlGVW5vTG9KSHdMTzRWR1kwNG9rdXVYRk5I?=
 =?utf-8?B?dXdLd1ZJMTBTSC9YNUY2OEVxTmYwdzk5SmhwRnFLeU14VnFwNmpXbE0zUGxq?=
 =?utf-8?B?a2daUTFGLzJtb1J3U1F3MldzUkV2M2hzUDZhUGdkbmtyWUh3RGxPRmh0SkN0?=
 =?utf-8?B?ZjdKdXFNdG5yaVJqbVJWK0NUeWh2NVpVNmFLSzdLVkFyV1FyWG9kYTFPUmgx?=
 =?utf-8?B?WnNQQ1ZwTkR1M1F3blRjbjI5NDZFeTc3NzdvbzIwRzBLdUxLT0wwcWpKT1Fk?=
 =?utf-8?B?bS9qWUNVZ0lCZFFWbVo3dFk5U3JFZWlFR3A5Y1NQazEwVFJWTzU3QVp1cEFn?=
 =?utf-8?B?ZXdNNlhxSzlzWUZwS05uWG5COGhnZnU0N1B5LzBidFJqZGJNU3hxdTNqQXpS?=
 =?utf-8?B?ZExvdCtSV3g5Z2hoc3pvWXRqdTJ1SCtrdWVQSW9qbmhFUzlhNXZVZW5OQVpR?=
 =?utf-8?B?RGR1Qm9RZUg3cmJGVVNMWjhCQi9ZbWN6Y3NCVW9RQStmaUJKU2xEZjVHOWZE?=
 =?utf-8?B?d0ZvUC80SFc0dm01UndJWWhFNHFQc2NPYUxRbkZnYlJOUHRVQ1lxZGMxUXIv?=
 =?utf-8?B?ZGFoZ3lWTUU2Ylh4d0FaOHl1MTdEdmg3L0I4NUJLL2F3ODBQRXdnWHJHRlBi?=
 =?utf-8?B?cFFreE1iNEM3c0ZhVjJ5L3hPeUFnM2lmZE00SFI1ZERtZFdIM1JRSW1COUU5?=
 =?utf-8?B?TDl6dlRGbDA5dHdoWk85TVBnQlVITmhFSS81YUxycklGRkxJdVFVT1U3UWs4?=
 =?utf-8?B?K2NmWmJhUmplcGRhM0ZrWXBEUGU3RjUyN0FUdEsvc1Voelp0T01kY0UxM1F5?=
 =?utf-8?B?eTZYcWZsQnpJV1NSblQza2k5RTk5d3NNbzd4Q3RubHRnVHdzUGhkNlU2QkZ1?=
 =?utf-8?B?aGtaMkpsZWVIRDd2bUJXenZYeGtDTzBUalNQK2pLazh0V2VrQXEyNGI3VEtF?=
 =?utf-8?B?MG5jOTZkTHhDN0xZcVBlT25iWFNvWUw1VnI3R0JWS281YnlWYlVhSnkyQ1B2?=
 =?utf-8?B?SkhjbEZ2QkxCR3ZKNXIwRHVXZnpycThMZUxZcmVZblArRHAwZXRicnpSRzVk?=
 =?utf-8?B?VTRKbThzZjlXbGt5aE4rYzQ0VFVLNm9UeFN3MzZKaG1acHBMeXZZdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FF844553CF69347A22ADD636412B3C2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4d6df4-c61b-41e1-3911-08d9e495b58c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 08:43:09.5355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PvM6JTENK4n5MR+DxMw3DDEAt6tztZQSFgoYibmvqslTdpTujvbmsPgOWluiGF2u9Fc1il8SXPD042iVz/pLNlM1MP8WrW9sMSer16dYuyy6EMBVL5fWqtaj+fYn9HZ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3527
X-Proofpoint-GUID: c2mYnBV_NTd0USyqrHS1Y_L6oC-3Ji2F
X-Proofpoint-ORIG-GUID: c2mYnBV_NTd0USyqrHS1Y_L6oC-3Ji2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_02,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310057

SGksIFJvZ2VyIQ0KDQpPbiAxMi4wMS4yMiAxNDoxMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NDJQTSArMDIwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gV2hlbiBhIFBDSSBkZXZpY2Ug
Z2V0cyBhc3NpZ25lZC9kZS1hc3NpZ25lZCBzb21lIHdvcmsgb24gdlBDSSBzaWRlIG5lZWRzDQo+
PiB0byBiZSBkb25lIGZvciB0aGF0IGRldmljZS4gSW50cm9kdWNlIGEgcGFpciBvZiBob29rcyBz
byB2UENJIGNhbiBoYW5kbGUNCj4+IHRoYXQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4g
LS0tDQo+PiBTaW5jZSB2NDoNCj4+ICAgLSBkZS1hc3NpZ24gdlBDSSBmcm9tIHRoZSBwcmV2aW91
cyBkb21haW4gb24gZGV2aWNlIGFzc2lnbm1lbnQNCj4+ICAgLSBkbyBub3QgcmVtb3ZlIGhhbmRs
ZXJzIGluIHZwY2lfYXNzaWduX2RldmljZSBhcyB0aG9zZSBtdXN0IG5vdA0KPj4gICAgIGV4aXN0
IGF0IHRoYXQgcG9pbnQNCj4+IFNpbmNlIHYzOg0KPj4gICAtIHJlbW92ZSB0b29sc3RhY2sgcm9s
bC1iYWNrIGRlc2NyaXB0aW9uIGZyb20gdGhlIGNvbW1pdCBtZXNzYWdlDQo+PiAgICAgYXMgZXJy
b3IgYXJlIHRvIGJlIGhhbmRsZWQgd2l0aCBwcm9wZXIgY2xlYW51cCBpbiBYZW4gaXRzZWxmDQo+
PiAgIC0gcmVtb3ZlIF9fbXVzdF9jaGVjaw0KPj4gICAtIHJlbW92ZSByZWR1bmRhbnQgcmMgY2hl
Y2sgd2hpbGUgYXNzaWduaW5nIGRldmljZXMNCj4+ICAgLSBmaXggcmVkdW5kYW50IENPTkZJR19I
QVNfVlBDSSBjaGVjayBmb3IgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICAgLSB1
c2UgUkVHSVNURVJfVlBDSV9JTklUIG1hY2hpbmVyeSB0byBydW4gcmVxdWlyZWQgc3RlcHMgb24g
ZGV2aWNlDQo+PiAgICAgaW5pdC9hc3NpZ246IGFkZCBydW5fdnBjaV9pbml0IGhlbHBlcg0KPj4g
U2luY2UgdjI6DQo+PiAtIGRlZmluZSBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCBzbyBk
ZWFkIGNvZGUgaXMgbm90IGNvbXBpbGVkDQo+PiAgICBmb3IgeDg2DQo+PiBTaW5jZSB2MToNCj4+
ICAgLSBjb25zdGlmeSBzdHJ1Y3QgcGNpX2RldiB3aGVyZSBwb3NzaWJsZQ0KPj4gICAtIGRvIG5v
dCBvcGVuIGNvZGUgaXNfc3lzdGVtX2RvbWFpbigpDQo+PiAgIC0gZXh0ZW5kZWQgdGhlIGNvbW1p
dCBtZXNzYWdlDQo+PiAtLS0NCj4+ICAgeGVuL2RyaXZlcnMvS2NvbmZpZyAgICAgICAgICAgfCAg
NCArKysNCj4+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAxMCArKysrKysNCj4+
ICAgeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAgfCA2MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLQ0KPj4gICB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgICAgICB8IDE2
ICsrKysrKysrKw0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL0tjb25maWcgYi94ZW4v
ZHJpdmVycy9LY29uZmlnDQo+PiBpbmRleCBkYjk0MzkzZjQ3YTYuLjc4MDQ5MGNmOGUzOSAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL0tjb25maWcNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL0tj
b25maWcNCj4+IEBAIC0xNSw0ICsxNSw4IEBAIHNvdXJjZSAiZHJpdmVycy92aWRlby9LY29uZmln
Ig0KPj4gICBjb25maWcgSEFTX1ZQQ0kNCj4+ICAgCWJvb2wNCj4+ICAgDQo+PiArY29uZmlnIEhB
U19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICsJYm9vbA0KPj4gKwlkZXBlbmRzIG9uIEhBU19WUENJ
DQo+PiArDQo+PiAgIGVuZG1lbnUNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBpbmRleCAyODY4
MDhiMjVlNjUuLmQ5ZWY5MTU3MWFkZiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3BjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4g
QEAgLTg3NCw2ICs4NzQsMTAgQEAgc3RhdGljIGludCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRv
bWFpbiAqZCwgdWludDE2X3Qgc2VnLCB1aW50OF90IGJ1cywNCj4+ICAgICAgIGlmICggcmV0ICkN
Cj4+ICAgICAgICAgICBnb3RvIG91dDsNCj4+ICAgDQo+PiArICAgIHJldCA9IHZwY2lfZGVhc3Np
Z25fZGV2aWNlKGQsIHBkZXYpOw0KPj4gKyAgICBpZiAoIHJldCApDQo+PiArICAgICAgICBnb3Rv
IG91dDsNCj4gRm9sbG93aW5nIG15IGNvbW1lbnQgYmVsb3csIHRoaXMgd29uJ3QgYmUgYWxsb3dl
ZCB0byBmYWlsLg0KPg0KPj4gKw0KPj4gICAgICAgaWYgKCBwZGV2LT5kb21haW4gPT0gaGFyZHdh
cmVfZG9tYWluICApDQo+PiAgICAgICAgICAgcGRldi0+cXVhcmFudGluZSA9IGZhbHNlOw0KPj4g
ICANCj4+IEBAIC0xNDI5LDYgKzE0MzMsMTAgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0
cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4g
ICAgICAgQVNTRVJUKHBkZXYgJiYgKHBkZXYtPmRvbWFpbiA9PSBoYXJkd2FyZV9kb21haW4gfHwN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4gPT0gZG9tX2lvKSk7DQo+PiAg
IA0KPj4gKyAgICByYyA9IHZwY2lfZGVhc3NpZ25fZGV2aWNlKHBkZXYtPmRvbWFpbiwgcGRldik7
DQo+PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgZ290byBkb25lOw0KPj4gKw0KPj4gICAg
ICAgcmMgPSBwZGV2X21zaXhfYXNzaWduKGQsIHBkZXYpOw0KPj4gICAgICAgaWYgKCByYyApDQo+
PiAgICAgICAgICAgZ290byBkb25lOw0KPj4gQEAgLTE0NDYsNiArMTQ1NCw4IEBAIHN0YXRpYyBp
bnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRl
dmZuLCB1MzIgZmxhZykNCj4+ICAgICAgICAgICByYyA9IGhkLT5wbGF0Zm9ybV9vcHMtPmFzc2ln
bl9kZXZpY2UoZCwgZGV2Zm4sIHBjaV90b19kZXYocGRldiksIGZsYWcpOw0KPj4gICAgICAgfQ0K
Pj4gICANCj4+ICsgICAgcmMgPSB2cGNpX2Fzc2lnbl9kZXZpY2UoZCwgcGRldik7DQo+PiArDQo+
PiAgICBkb25lOg0KPj4gICAgICAgaWYgKCByYyApDQo+PiAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19HX1dBUk5JTkcgIiVwZDogYXNzaWduICglcHApIGZhaWxlZCAoJWQpXG4iLA0KPj4gZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMN
Cj4+IGluZGV4IDM3MTAzZTIwNzYzNS4uYTllOWU4ZWM0MzhjIDEwMDY0NA0KPj4gLS0tIGEveGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+
PiBAQCAtNzQsMTIgKzc0LDI2IEBAIHZvaWQgdnBjaV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQ0KPj4gICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2lfbG9jayk7DQo+PiAg
IH0NCj4+ICAgDQo+PiAtaW50IHZwY2lfYWRkX2hhbmRsZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQ0KPj4gK3N0YXRpYyBpbnQgcnVuX3ZwY2lfaW5pdChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4g
SnVzdCB1c2luZyBhZGRfaGFuZGxlcnMgYXMgZnVuY3Rpb24gbmFtZSB3b3VsZCBiZSBjbGVhcmVy
IElNTy4NCk9rLCB3aWxsIGNoYW5nZQ0KPg0KPj4gICB7DQo+PiAtICAgIHN0cnVjdCB2cGNpICp2
cGNpOw0KPj4gICAgICAgdW5zaWduZWQgaW50IGk7DQo+PiAgICAgICBpbnQgcmMgPSAwOw0KPj4g
ICANCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBOVU1fVlBDSV9JTklUOyBpKysgKQ0KPj4gKyAg
ICB7DQo+PiArICAgICAgICByYyA9IF9fc3RhcnRfdnBjaV9hcnJheVtpXShwZGV2KTsNCj4+ICsg
ICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICB9DQo+PiAr
DQo+PiArICAgIHJldHVybiByYzsNCj4+ICt9DQo+PiArDQo+PiAraW50IHZwY2lfYWRkX2hhbmRs
ZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHZwY2kgKnZw
Y2k7DQo+PiArICAgIGludCByYzsNCj4+ICsNCj4+ICAgICAgIGlmICggIWhhc192cGNpKHBkZXYt
PmRvbWFpbikgKQ0KPj4gICAgICAgICAgIHJldHVybiAwOw0KPj4gICANCj4+IEBAIC05NCwxOSAr
MTA4LDQ4IEBAIGludCB2cGNpX2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+
ICAgICAgIHBkZXYtPnZwY2kgPSB2cGNpOw0KPj4gICAgICAgSU5JVF9MSVNUX0hFQUQoJnBkZXYt
PnZwY2ktPmhhbmRsZXJzKTsNCj4+ICAgDQo+PiAtICAgIGZvciAoIGkgPSAwOyBpIDwgTlVNX1ZQ
Q0lfSU5JVDsgaSsrICkNCj4+IC0gICAgew0KPj4gLSAgICAgICAgcmMgPSBfX3N0YXJ0X3ZwY2lf
YXJyYXlbaV0ocGRldik7DQo+PiAtICAgICAgICBpZiAoIHJjICkNCj4+IC0gICAgICAgICAgICBi
cmVhazsNCj4+IC0gICAgfQ0KPj4gLQ0KPj4gKyAgICByYyA9IHJ1bl92cGNpX2luaXQocGRldik7
DQo+PiAgICAgICBpZiAoIHJjICkNCj4+ICAgICAgICAgICB2cGNpX3JlbW92ZV9kZXZpY2VfbG9j
a2VkKHBkZXYpOw0KPj4gICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2lfbG9jayk7DQo+PiAg
IA0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+PiArDQo+PiArI2lmZGVmIENPTkZJR19I
QVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMg
YXNzaWduZWQgdG8gZ3Vlc3QuICovDQo+PiAraW50IHZwY2lfYXNzaWduX2RldmljZShzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+PiArICAgIGludCByYzsN
Cj4+ICsNCj4+ICsgICAgLyogSXQgb25seSBtYWtlcyBzZW5zZSB0byBhc3NpZ24gZm9yIGh3ZG9t
IG9yIGd1ZXN0IGRvbWFpbi4gKi8NCj4+ICsgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpIHx8
ICFoYXNfdnBjaShkKSApDQo+IERvIHlvdSByZWFsbHkgbmVlZCB0aGUgaXNfc3lzdGVtX2RvbWFp
biBjaGVjaz8gU3lzdGVtIGRvbWFpbnMNCj4gc2hvdWxkbid0IGhhdmUgdGhlIFZQQ0kgZmxhZyBz
ZXQgYW55d2F5LCBzbyBzaG91bGQgZmFpbCB0aGUgaGFzX3ZwY2kNCj4gdGVzdC4NCk5vLCBpdCBz
ZWVtcyB3ZSBkbyBub3QgbmVlZCB0aGlzIGNoZWNrOiB3aWxsIHJlbW92ZQ0KPg0KPj4gKyAgICAg
ICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaV9sb2NrKTsN
Cj4+ICsgICAgcmMgPSBydW5fdnBjaV9pbml0KHBkZXYpOw0KPj4gKyAgICBzcGluX3VubG9jaygm
cGRldi0+dnBjaV9sb2NrKTsNCj4+ICsgICAgaWYgKCByYyApDQo+PiArICAgICAgICB2cGNpX2Rl
YXNzaWduX2RldmljZShkLCBwZGV2KTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIHJjOw0KPj4gK30N
Cj4+ICsNCj4+ICsvKiBOb3RpZnkgdlBDSSB0aGF0IGRldmljZSBpcyBkZS1hc3NpZ25lZCBmcm9t
IGd1ZXN0LiAqLw0KPj4gK2ludCB2cGNpX2RlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpk
LCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gVGhlcmUncyBubyBuZWVkIHRvIHJldHVybiBhbnkg
dmFsdWUgZnJvbSB0aGlzIGZ1bmN0aW9uIEFGQUlDVC4gSXQNCj4gc2hvdWxkIGhhdmUgdm9pZCBy
ZXR1cm4gdHlwZS4NCk1ha2VzIHNlbnNlLCBJIHdpbGwgcy9pbnQvdm9pZA0KPiBUaGFua3MsIFJv
Z2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

