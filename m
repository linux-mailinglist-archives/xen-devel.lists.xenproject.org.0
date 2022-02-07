Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA004AC651
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267267.460993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH78F-00068H-2z; Mon, 07 Feb 2022 16:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267267.460993; Mon, 07 Feb 2022 16:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH78E-00065S-VQ; Mon, 07 Feb 2022 16:44:50 +0000
Received: by outflank-mailman (input) for mailman id 267267;
 Mon, 07 Feb 2022 16:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH78D-00065M-5L
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:44:49 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4218df48-8835-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 17:44:47 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217GEJ5s029682;
 Mon, 7 Feb 2022 16:44:43 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e36ry857u-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 16:44:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB9PR03MB7772.eurprd03.prod.outlook.com (2603:10a6:10:2cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 16:44:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:44:39 +0000
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
X-Inumbo-ID: 4218df48-8835-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmjQaCxLCkW41b2yeXCFZyoLRvxyJuq9tbVFXmO7zk32U1TclltF13vGok8BfjN1oMjX0Nnl+NLp3jP6zy/v9e+5xgogAKpMPpGaWY56pPoQNOuPh+qH5fUiuREk1AYQ9DyZpRlUBxl2FGHTHejdAVABXdvMhixaT9L1tuxWos15Iux1844KTn/oLOnFb5iZaKbOIreKVFlqXz4Ryi8NXAQzS7w3JktPS/PcZs4aqr6cczgDvTKTQvQvTcr4g4iMAeImMlt2ozN7GFJyBASfOdxOcQMiHAsT5qe6Ryt15CTVBGts55YfzbxM+a9Czt88N+7KqwE5BCdkoBE0W5XocQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPtLNQl4wa16AG8n+cCPeqs62kNtmEA81rCQe4PyN1I=;
 b=ZXWn/UbioAj1OQVjN+QUaBY/1XVJE8Jo8q+tf3T7pIdaGqXgTAfSmxRWsH9h4zTkgAdtAK1FmpOGOkbRthYB4VYRWjZuGVvMGgDEZMHOcd0pYZ4XvowIhNzTtGoo0ks+QYz5EsF+zwwTXO5aE7laTgnL9nB/T+AhnZMqNXO/YRB53WGQCuqcMSlJAH/0TmEoHVxtnDwI2pKXXQgP+hKW9arHEtb1+gEP/c6tu9+pPRL1Nkn2X40A69e6OhxhMJ4beLneulmClKVB6AhUQwBkr94m8foIfm7imaHN64t3Ty/ZkfCyRG+w/2wKdN2VqvSa9ojSXV+B1mZXaUdjbzgmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPtLNQl4wa16AG8n+cCPeqs62kNtmEA81rCQe4PyN1I=;
 b=rBh8g7oXgiR6zfd9GJq27M2V1MNFeixaSVBPqY/RcBxoAjd5Hgn04+rGM9pjlgIQBxAkoVjy90MaG+xAggj6w32VQx1HRYMI026ffmhzLe2zAZ4IRlurRBOyRkuJxQJqe7oDjH/RFEjsCkbj+b2lMJlQ3H4jRrA2tlyW2QQ+u/OgL5F3TKxb83O0VNqs36ewdlsyZnfCIKPKIs6SCrhSqQwrjycnh1liO3fdjzzPtPV/u7Q+1SQBIzXfbXwMtIZmof6MF4KXL9//ZE+/PninkHvYHeFEuK3K9nRsBKNiqVc7BdYsa5zhy7ry1Bdc5uuhs33kZ/zh9wgs4DKESotJww==
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYCAAARNAIAAC1wAgAACRYCAAAGVgIAABJiAgAAB5wA=
Date: Mon, 7 Feb 2022 16:44:39 +0000
Message-ID: <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
In-Reply-To: <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 858336a2-3ba3-46e3-846a-08d9ea59220b
x-ms-traffictypediagnostic: DB9PR03MB7772:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB9PR03MB77729F4F1D8D1D4B50EB8B8AE72C9@DB9PR03MB7772.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TP1EBDHYX6QPKAbFnwimWW/2W7QjBMWfE3WEoLqu+2/FJAjPxUrc0MtLBuABTb8PVJNodIdIE8YQUpu/uKsE9nPUj05hY1NXjxUdExME1wAWLryAnSjL8Spt6y5G//RQSAA2HQiETxL4F2FlMDnc16kpReI6EizRuKtrd5J/PlblmOWYaEhBktJd85HDcOT42H4EGTj5rjNwzuwC2IYdUeeqoDiYBeX2fTue9El50DUAnChRFgKUYee5csVrV97emh8qIfrwruvWGY//KKOBLD2fTOqpTF69y3PtKhsQM/0EWckNTVfoXNca3qCr3t/rZ78ucXtGfhyOgYORhAH9+cnHL1nvJFATv11CqhZUeqXjCXgz1ehBM0EcZfwmTm9ERV7jst2tb2Ub06NFN5EzzkE3H0S+K3LU75BArV3ZhWRrYKTfCwiW7dsiVNKsjMIgCk7MyvoSLPxjZUstOxqFWOaEzMSRpOewP/wHr/O6/FVX+LtDZKbIrqa+2an7TBqClIGS+vAsDab+hXwWTanAALZ6tbHO0/WjMi9IKqnOU6Yji2JIKkN4v0W9xdlsp2ehBx2KmPNsgkvQ6ly66yOK8qnsxEQSqrwrfacg6nilYWF+6nXUvAerHacSIgc4vgRQkb7TiBA0ICFjOg2EJSA3X8kAMjcoPoh5+t4jCmHrsF7D9jcUG7wF1DQhBIvJ7L1cTFi4bNxYSnGRuaue/QYKlmspGLk2OSzdci4mj/Ft9S4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(107886003)(2906002)(2616005)(508600001)(6486002)(316002)(54906003)(36756003)(6916009)(31686004)(7416002)(55236004)(5660300002)(122000001)(8676002)(4326008)(8936002)(66556008)(53546011)(6506007)(64756008)(6512007)(91956017)(76116006)(31696002)(186003)(26005)(38070700005)(83380400001)(66946007)(71200400001)(38100700002)(66446008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eUt3ZEZQL2pyYmlpM2dSUzlyZjI1dmFxaHN2NENYYXRjQlU4OXhOOVEvdHRS?=
 =?utf-8?B?aG1YbVQ3QkdOOXRVdyt2MnYvWlV5UWtMVGR3TU5tYUd0eWtIZmNhWEpubG9X?=
 =?utf-8?B?VTE2ME5ITGpmQzV1UnJLaWkwZHY2NDVKNnpjSVRCaGtEU1ZmOUhYVGp5ekZW?=
 =?utf-8?B?ajV5NzhUYTgyQXZ0ZHlGZ05lOVAwb3NTNFhVVjVpZW5BM21idjJZL0pzbHNl?=
 =?utf-8?B?bGExOWltNytDSTdsQlo5OWQySXh6RnR6eTdGZktWeEk0dnJvOFF3SFZheHlQ?=
 =?utf-8?B?NGQ3ZUVMa3hISzgra012TmN3enFrU2VZVHRNaHBLb3A4SDV3OFdnaThoS1Jr?=
 =?utf-8?B?QmNBRExoQWIyTW94a2d6ZFFxU3hWU1lBdlhFU2NsNXJiY01XQ2NqeGlja29N?=
 =?utf-8?B?cDFicUNnRDBNNXBpdWhDT2VjeXhFY0gvQlF2MmZ0OHlvenZ3S3E1TGs0emo5?=
 =?utf-8?B?ZmRmcFE0dnVSUzBsSnhOSnRiTkp0YzBpdkVMVndsbHhaT3pQR09vZm1xTHhF?=
 =?utf-8?B?dGdsOW1FMDkrb3NjVmdvUnYrTGxYTjhLaklQRDZOWmtpT1IrWm0zU2VjMjZj?=
 =?utf-8?B?djlyOFEzSFZXcFZYdjRPS3N5VUlCczVSdFZ4SVZiclYvVjg2eDlZODU5UWRI?=
 =?utf-8?B?bHplVWk4UGJlZytkeVdIN08wMkpHRmJoYWxwMDlXTDBaVzlRWVZHQ0hIR1BP?=
 =?utf-8?B?YjA0cjdHWG1YVGs0RkF2a0VpcVlsbjVnVEpxWGFSU0YySWtEM2g1QTRLWUdr?=
 =?utf-8?B?QVBNbm1LVnlQWmhnc2kvaTRMaFlOdS9zZE44NEswcnFjQ01Oc1ZXSTFlK295?=
 =?utf-8?B?Z0RKVEVTcTdOVml5T2xvcEZTbG8ybTVJQ05MRThvbW9TaHlFUmVUTFY2RlJN?=
 =?utf-8?B?NFFtejZiL2tMeFl3YTdPeFNsMUpxWFpVS2VrUG1CQklndmxrbWM0Y04wVGhS?=
 =?utf-8?B?Y2YxcEZOVkhtSEVwcWlLYy9JdFRMYXpraks1b0Nsa1pSK29nR080ZVhqSWtY?=
 =?utf-8?B?ZndSb3o0d3l5dXZhYjIwU25JQ3JEZkNSd05nNkVabEZkOXZIY3FTVUdiZ1dG?=
 =?utf-8?B?WTZxK2FkYUdGWmNVbThMNzM4cDVKSDJWZWdUMWVTMDNsVWlXVFpuY0ZMbExS?=
 =?utf-8?B?aWtaa3Z5dzB2Q0lOSldUL05ydzhIQTZKcEJnby9BTGEzZUpOalJMdmFoN2lL?=
 =?utf-8?B?ZzlZTE9uTWViZElHRTY5TlR3WFpTZWE4aEhYYi9rT3JJS0ZGa0NGZGJvbDhM?=
 =?utf-8?B?MTJTYzFQd0xocmVGdXVybmtmQk9OU0ptK2FzR2xYQzVaWk0wOG9icFlHYzVu?=
 =?utf-8?B?Tk45Q01xOTMrcnJnTDMzMFQxUEZ0aGpTZ0lFd2RySWhKd3ltemlSNVQwNnF4?=
 =?utf-8?B?Qk8xZHVvVjNjWFVXcDUrdzEwQllQUXZCa2YwMmV2VjhFNU1PYUtmRENkV2po?=
 =?utf-8?B?QTdhcTB1WWtlVkt6cFEvbHFPZThwbGZIdkpEOEp5TlhzV244U2RRVFdNbGgx?=
 =?utf-8?B?eGhGcTNFcXNLSkh3RG9yNkhZbVJnVTEvUzFoM1VieGxSTkFaUi8xcTR5Y1Ry?=
 =?utf-8?B?VEhHamU5L0l3WENucTEyMDV2NlIzRUFuc1RUWUJQRHZFd011cVM1QVQ2V3NO?=
 =?utf-8?B?ZDZTYXg3QW9ST00xSWZVeG00Zm1ENXR2OE94dGhkaENXby8wL1ZxY2hUTzNN?=
 =?utf-8?B?VG16VWI5Y0txOVBocWwxZmpBdCs0b0MvWEJOSWwzQnV3ZWY2Q2l4NHRsY2Mr?=
 =?utf-8?B?dGFSQXppZ3pMMVVRS0JZcXFxQU04aDFxQnB6ci9Na1drMHRnNVpvWW1QRElK?=
 =?utf-8?B?a05jVjNrUDMxalI2MG5oMTFNNlZzbDBodm1rZ05YaEw2UVF5K3ppSjNNRGdp?=
 =?utf-8?B?SytUcDBPb0JjOGV0U0tndEpQbUZ5a2xiQlY1K043MWJjalRSSWhMNVFIb2xQ?=
 =?utf-8?B?TXpwUXU2M3k5NVlDM0RhaVpkaXB5YTRHS0JsVys5dWJCRHNqQTRDbVlnWmVj?=
 =?utf-8?B?ZENXVUVqNWk3YjJPREV6SHMxUEVwSE5KUnFLNXhrRk5IdU5KN01pRUI4N1Ru?=
 =?utf-8?B?L09TQ1JMSEhyWTdEaUJKMG9RU3FyUDAyM3k4VGVMeDBvQWR2NXVyaUJGOTFy?=
 =?utf-8?B?a0RMeHlOcG5XQUIxZDRkbjZVd2lYWThGbnY2UVd5WEtFekRta0J5SldvZFFX?=
 =?utf-8?B?NU5EMHJNNnpDM1BuSHBNRTUrTUZJaldaWWFBN2RETjYwaUl3ZlczT0NYcHNV?=
 =?utf-8?B?eDVGSjZ1YVhzMXZwcHRCMEFzWEVlWVR3cXdnVFBDN1lMeW9JcTBJSGpaTzVY?=
 =?utf-8?B?LzFOUGdORWxnWTFkOWFFenJGWCthcmgwL0dFTExycXJaazVUMUhkWGFodnJw?=
 =?utf-8?Q?OKGJs/ifyRW/8N9k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B12754EEB02F843BA0A6324AABA9ECC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858336a2-3ba3-46e3-846a-08d9ea59220b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 16:44:39.1930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jcicyq3nodBz8xzo0QE7+v+KjX9GSYuO4zlNJMqDJ2ndbWIaukc4sXR+1JlP2D+Ay6cNpzpddIM0bnU6OO9sowCxwJGS+PDpQC4fgSRQiTl4y1xBGCPIo8beYhVyrwuo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7772
X-Proofpoint-GUID: QHzyYGgTuZv9bQCXwPzs41bPQ-gne9B_
X-Proofpoint-ORIG-GUID: QHzyYGgTuZv9bQCXwPzs41bPQ-gne9B_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=876 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070104

DQoNCk9uIDA3LjAyLjIyIDE4OjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNzoyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDcuMDIu
MjIgMTg6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAyLjIwMjIgMTc6MDcsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wMi4yMiAxNzoyNiwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiAxYi4gTWFrZSB2cGNpX3dyaXRlIHVzZSB3cml0ZSBsb2Nr
IGZvciB3cml0ZXMgdG8gY29tbWFuZCByZWdpc3RlciBhbmQgQkFScw0KPj4+Pj4gb25seTsga2Vl
cCB1c2luZyB0aGUgcmVhZCBsb2NrIGZvciBhbGwgb3RoZXIgd3JpdGVzLg0KPj4+PiBJIGFtIG5v
dCBxdWl0ZSBzdXJlIGhvdyB0byBkbyB0aGF0LiBEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlrZToN
Cj4+Pj4gdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywg
dW5zaWduZWQgaW50IHNpemUsDQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1aW50MzJfdCBkYXRhKQ0KPj4+PiBbc25pcF0NCj4+Pj4gICAgwqDCoMKgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkgKCByLCAmcGRldi0+dnBjaS0+aGFuZGxlcnMsIG5vZGUgKQ0KPj4+PiB7DQo+Pj4+
IFtzbmlwXQ0KPj4+PiAgICDCoMKgwqAgaWYgKCByLT5uZWVkc193cml0ZV9sb2NrKQ0KPj4+PiAg
ICDCoMKgwqAgwqDCoMKgIHdyaXRlX2xvY2soZC0+dnBjaV9sb2NrKQ0KPj4+PiAgICDCoMKgwqAg
ZWxzZQ0KPj4+PiAgICDCoMKgwqAgwqDCoMKgIHJlYWRfbG9jayhkLT52cGNpX2xvY2spDQo+Pj4+
IC4uLi4NCj4+Pj4NCj4+Pj4gQW5kIHByb3ZpZGUgcncgYXMgYW4gYXJndW1lbnQgdG86DQo+Pj4+
DQo+Pj4+IGludCB2cGNpX2FkZF9yZWdpc3RlcihzdHJ1Y3QgdnBjaSAqdnBjaSwgdnBjaV9yZWFk
X3QgKnJlYWRfaGFuZGxlciwNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHZwY2lfd3JpdGVfdCAqd3JpdGVfaGFuZGxlciwgdW5zaWduZWQgaW50IG9m
ZnNldCwNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHVuc2lnbmVkIGludCBzaXplLCB2b2lkICpkYXRhLCAtLS0+Pj4gYm9vbCB3cml0ZV9wYXRoIDw8
PC0tLS0tKQ0KPj4+Pg0KPj4+PiBJcyB0aGlzIHdoYXQgeW91IG1lYW4/DQo+Pj4gVGhpcyBzb3Vu
ZHMgb3Zlcmx5IGNvbXBsaWNhdGVkLiBZb3UgY2FuIGRlcml2ZSBsb2NhbGx5IGluIHZwY2lfd3Jp
dGUoKSwNCj4+PiBmcm9tIGp1c3QgaXRzICJyZWciIGFuZCAic2l6ZSIgcGFyYW1ldGVycywgd2hl
dGhlciB0aGUgbG9jayBuZWVkcyB0YWtpbmcNCj4+PiBpbiB3cml0ZSBtb2RlLg0KPj4gWWVzLCBJ
IHN0YXJ0ZWQgd3JpdGluZyBhIHJlcGx5IHdpdGggdGhhdC4gU28sIHRoZSBzdW1tYXJ5IChST00N
Cj4+IHBvc2l0aW9uIGRlcGVuZHMgb24gaGVhZGVyIHR5cGUpOg0KPj4gaWYgKCAocmVnID09IFBD
SV9DT01NQU5EKSB8fCAocmVnID09IFJPTSkgKQ0KPj4gew0KPj4gICDCoMKgwqAgcmVhZCBQQ0lf
Q09NTUFORCBhbmQgc2VlIGlmIG1lbW9yeSBvciBJTyBkZWNvZGluZyBhcmUgZW5hYmxlZC4NCj4+
ICAgwqDCoMKgIGlmICggZW5hYmxlZCApDQo+PiAgIMKgwqDCoCDCoMKgwqAgd3JpdGVfbG9jayhk
LT52cGNpX2xvY2spDQo+PiAgIMKgwqDCoCBlbHNlDQo+PiAgIMKgwqDCoCDCoMKgwqAgcmVhZF9s
b2NrKGQtPnZwY2lfbG9jaykNCj4+IH0NCj4gSG1tLCB5ZXMsIHlvdSBjYW4gYWN0dWFsbHkgZ2V0
IGF3YXkgd2l0aG91dCB1c2luZyAic2l6ZSIsIHNpbmNlIGJvdGgNCj4gY29tbWFuZCByZWdpc3Rl
ciBhbmQgUk9NIEJBUiBhcmUgMzItYml0IGFsaWduZWQgcmVnaXN0ZXJzLCBhbmQgNjQtYml0DQo+
IGFjY2Vzc2VzIGdldCBzcGxpdCBpbiB2cGNpX2VjYW1fd3JpdGUoKS4NCkJ1dCwgT1MgbWF5IHdh
bnQgcmVhZGluZyBhIHNpbmdsZSBieXRlIG9mIFJPTSBCQVIsIHNvIEkgdGhpbmsNCkknbGwgbmVl
ZCB0byBjaGVjayBpZiByZWcrc2l6ZSBmYWxsIGludG8gUENJX0NPTUFORCBhbmQgUk9NIEJBUg0K
cmFuZ2VzDQo+DQo+IEZvciB0aGUgY29tbWFuZCByZWdpc3RlciB0aGUgbWVtb3J5LSAvIElPLWRl
Y29kaW5nLWVuYWJsZWQgY2hlY2sgbWF5DQo+IGVuZCB1cCBhIGxpdHRsZSBtb3JlIGNvbXBsaWNh
dGVkLCBhcyB0aGUgdmFsdWUgdG8gYmUgd3JpdHRlbiBhbHNvDQo+IG1hdHRlcnMuIE1heWJlIHJl
YWQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgb25seSBmb3IgdGhlIFJPTSBCQVIgd3JpdGUsDQo+IHVz
aW5nIHRoZSB3cml0ZSBsb2NrIHVuaWZvcm1seSBmb3IgYWxsIGNvbW1hbmQgcmVnaXN0ZXIgd3Jp
dGVzPw0KU291bmRzIGdvb2QgZm9yIHRoZSBzdGFydC4NCkFub3RoZXIgY29uY2VybiBpcyB0aGF0
IGlmIHdlIGdvIHdpdGggYSByZWFkX2xvY2sgYW5kIHRoZW4gaW4gdGhlDQp1bmRlcmx5aW5nIGNv
ZGUgd2UgZGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgYW5kIHRyeSBkb2luZw0Kc29tZXRoaW5nIGFu
ZCBjYWxsaW5nIGNtZF93cml0ZSBoYW5kbGVyIGZvciBhbnkgcmVhc29uIHRoZW4uLi4uDQoNCkkg
bWVhbiB0aGF0IHRoZSBjaGVjayBpbiB0aGUgdnBjaV93cml0ZSBpcyBzb21ld2hhdCB3ZSBjYW4g
dG9sZXJhdGUsDQpidXQgdGhlbiBpdCBpcyBtdXN0IGJlIGNvbnNpZGVyZWQgdGhhdCBubyBjb2Rl
IGluIHRoZSByZWFkIHBhdGgNCmlzIGFsbG93ZWQgdG8gcGVyZm9ybSB3cml0ZSBwYXRoIGZ1bmN0
aW9ucy4gV2hpY2ggYnJpbmdzIGEgcHJldHR5DQp2YWxpZCB1c2UtY2FzZTogc2F5IGluIHJlYWQg
bW9kZSB3ZSBkZXRlY3QgYW4gdW5yZWNvdmVyYWJsZSBlcnJvcg0KYW5kIG5lZWQgdG8gcmVtb3Zl
IHRoZSBkZXZpY2U6DQp2cGNpX3Byb2Nlc3NfcGVuZGluZyAtPiBFUlJPUiAtPiB2cGNpX3JlbW92
ZV9kZXZpY2Ugb3Igc2ltaWxhci4NCg0KV2hhdCBkbyB3ZSBkbyB0aGVuPyBJdCBpcyBhbGwgZ29p
bmcgdG8gYmUgZnJhZ2lsZS4uLg0KPg0KPj4gRG8geW91IGFsc28gdGhpbmsgd2UgY2FuIGRyb3Ag
cGRldi0+dnBjaSAob3IgY3VycmVudGx5IHBkZXYtPnZwY2ktPmxvY2spDQo+PiBhdCBhbGwgdGhl
bj8NCj4gSSBoYXZlbid0IGxvb2tlZCBhdCB0aGlzIGluIGFueSBkZXRhaWwsIHNvcnJ5LiBJdCBz
b3VuZHMgcG9zc2libGUsDQo+IHllcy4NCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2Fu
ZHI=

