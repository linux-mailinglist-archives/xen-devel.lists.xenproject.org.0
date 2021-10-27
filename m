Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5268743C63D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216767.376495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeyy-0003Nv-IP; Wed, 27 Oct 2021 09:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216767.376495; Wed, 27 Oct 2021 09:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfeyy-0003Kx-FC; Wed, 27 Oct 2021 09:12:28 +0000
Received: by outflank-mailman (input) for mailman id 216767;
 Wed, 27 Oct 2021 09:12:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lYk=PP=epam.com=prvs=0934bd4bd6=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mfeyw-0003Kr-WA
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:12:27 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0027afa8-3706-11ec-8457-12813bfff9fa;
 Wed, 27 Oct 2021 09:12:25 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19R6Y1jP026938; 
 Wed, 27 Oct 2021 09:12:21 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3by1m1rkx8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 09:12:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2830.eurprd03.prod.outlook.com (2603:10a6:800:e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 09:12:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 09:12:15 +0000
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
X-Inumbo-ID: 0027afa8-3706-11ec-8457-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPFEe62w1CQEbDkLPHbqtkunJ4Xz1x2fbBHa+e+2Y+ePj7PQaEE2Q3ThF2yiPAmErgOP66tCR2Rr8QtW3sF6lpF7F9gdmNOCEQdonlf3s0mnvYjIJ3T+IPoWsZGErJSQ1UeCDYuLN1NiL3u6kaU4+UrVJ9lb9NL2/IKZ9Ed2lJvS+YgoI0S7CVfUgQ/Ix93CLaJUcpStZb0nTgtJZdaU2iTko099c7v8TN4nm1G4KSq1oUVvn4Lsyn4lkaZ7/hO0vvZ4l021jqvijkTOqHbdM49oY9vRs3oF8M08p1VB6CniDsXgwG9DNbu0xl/4XA9IVZ0aIxgFmNoz7iVDVk5FsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cTXzK1Sb5+ewj/DvvP9J6UW+QqHWp2DE6YuusLLBxk=;
 b=ocgQ18M1XaH3nJ09gIjEHUDRVcRMEHUUNbYhbm/Zl2dThV7aevADenxpmL5zQsJgI4vA9Zn1xn9ECdlmYjbwg6iAIV5r24ZuSD0ql8B6dpUemuL9EmXgRo+ltEJG9JDFJzsm2uLJex2/znk49do8LAidvEXomqy8iua3nRSTixr+ZY4NFE3sG2kmW0nbEdGDDLveKkrnII9SVqZQerbnVgaiVlUF6p9RkQ2K2JaVZylEuc5aOm5O/jp/etmh2szOBFETEA6BnH3s8z0zJURwkkOMijfIMYZfQ/wPta2yPgZIIL/ulyAc1phpB9S67F8akF3K5UCgpz+ODnhQCk+iMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cTXzK1Sb5+ewj/DvvP9J6UW+QqHWp2DE6YuusLLBxk=;
 b=hBTYBHRuLcInuMeKKqiOwsVPWf8lXZ1f7OmX6AQJ0soKs4734+7/fODuz7mN+qzT9jo0ELq/jpF15IbUv5KcsfcNkPU3qadPNGnwSzJ3PvipJa5nPT1/b7hl7y+0M7GDXTqXTNGJgnrQiaIJR2hZrUSZdsi3dY6fs7tkXGUNvElr5xFhAuw056B9Bvuoep8H0rlOhiTKZ4iZagyi9qSs/w2wkEnwhhMDZUuFzGFrliAYuIuD9CXYQCRsKj/JyPhh8uhSEGl5XiYWOYormsa4J8OkapOPoPTJ65jz+LTs4yZ0fkMXFbU5NXCPH5y4Y+WpwqiAc3pClwCxsHhJtpRp4g==
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
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Michal Orzel
	<michal.orzel@arm.com>
Subject: Re: [PATCH v3 01/11] vpci: Make vpci registers removal a dedicated
 function
Thread-Topic: [PATCH v3 01/11] vpci: Make vpci registers removal a dedicated
 function
Thread-Index: AQHXtdAgeXiPCGUCJ0Oi6HCqPD8Y4KvQ2oUAgBXfUAA=
Date: Wed, 27 Oct 2021 09:12:14 +0000
Message-ID: <387d3729-b182-1aaf-870e-505e90141606@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-2-andr2000@gmail.com>
 <YWa+4hsaOxuX4tWJ@MacBook-Air-de-Roger.local>
In-Reply-To: <YWa+4hsaOxuX4tWJ@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b6acc2e-822f-4fe5-1b63-08d99929de4a
x-ms-traffictypediagnostic: VI1PR0302MB2830:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2830B51CB19AB819AC138048E7859@VI1PR0302MB2830.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qtWTPQrOlf6wCJ+/MPNBQ6AGXcQhWhAVkzy8xRhNEqW09c5+spptqikou6uJ0gvg1aCkWNIYkhpfbXGi3mdxvsEHV0alJNMl/K0J8K+hP42dR9gYnCFQLd8FEiNqSRrAlFRy3TEYpVUEvOYHgQpvOnsXaIhGt7v9/ecI0qZgs097R70CWispip5yAIyvybIN1ojIEEJ3+R0sL/kHWhTRUI9DrcfipEsqHPUlqtR36tDPAn+O3UqZGvX5iXX0Cu0z52a/BUVGC+UAhj8rQWhsA+1kyKpk2rSke73DZjUTfQtL+LQEVU6she46hlJzs2w3NAZpZlgiRJ7LBB7828dkWmDENG/fybs30MBPHBVZw6jAv88m5w/7MgJJMmjS/3ARATj/ixTQgYr+0YA3qowMSPzdSHGLGTBAkXlVRgliDdR+EQRebxUylmRe7FZucI1CsR5eL5WIO8GnW1XLr+ZMSeLs9gFWGVP/4/Ok6hHN9N/fiFg5cfpt+nSelc5R7axqvYNM0vrDUFq9d8ZOJ5T7UQm28vfmqPh1xS3PJLmZKJiLekM/fJW/QFSByGep3RKzXppJW9z2R0S7cNt4LtGxzVBz5hyRZHMYaiwFE49L7lnoZ9lqEYa7048e/AxNRzVzC11C3mbQcZnFwOwP7zULzAV0rizLEHP7VKJDx7LqSlgGWfIi5UHo6Ol8GR+QQSlOdXlnPnaeRbxX/pPgnPODfv/KUC7QGuVI1ne0BcOkFp9c95SlqWwmJcs6yiBEBktl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(66556008)(6486002)(31686004)(8936002)(53546011)(38100700002)(26005)(4326008)(76116006)(6506007)(71200400001)(5660300002)(86362001)(2906002)(316002)(66476007)(54906003)(91956017)(122000001)(31696002)(186003)(64756008)(66446008)(38070700005)(2616005)(6916009)(83380400001)(66946007)(36756003)(8676002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dkRNbzY3b0FMZ1cxRGY2RlR3S2RxWFpMT3h1TUFJeTJ3WmVlbDR4ZGorOUla?=
 =?utf-8?B?Rkc2WlVpbzhrWjBsNW8zMkNnek9pS1EzWHR4RUFlSjBrVWdSOEsvUk4rMkx1?=
 =?utf-8?B?VWdlcm1IZUxlM3dNVjRWME9hV3NxRjN1RGZNaVJ0bWJVZ2RXQzYvbk43cHhV?=
 =?utf-8?B?OExOREJPNlJqY1pEZkNoa2srSmw0bmxnYlFMTFZwc0liVFREUk5IRllwTkY5?=
 =?utf-8?B?b2dqTGg4SWpyakl1Y0FjdHV6TVhTS1kxOXZuTU5OYkIvcmg3czdodC94SWRi?=
 =?utf-8?B?Y2RyTkVZL21FbzJ3bWxST3B5NytpUEVmbjcvUndacUxGOVpxaGxLR1BGOVN5?=
 =?utf-8?B?M1dhTm1tSFBXaERNazB3VU91RmZ0T1JBNXI2alVIcS9hMERZbTRraEJkQ2lD?=
 =?utf-8?B?cVpDUzF3MmFXMEFDYy9tWHd5eXBNUjdGa3Jqa054WDRUaXdmK2tCNVFISVg5?=
 =?utf-8?B?QXlhZGQxSnp4ZUFqZ2FneUNYSWV1Y1B4ZDB2WldhWXNJRTk1dzRjeVlaUFlB?=
 =?utf-8?B?bVRMSktEUFYrNWZ6UmIrNlJ4OXlHc01rNkpwTEZKeUM2VE9ZUzYraXV4eHdY?=
 =?utf-8?B?ajVrZXNOeDZsa1JMK0QyRXhEV0Fma1NQWGFiVkFsSGw2M2R0anVRUmRlTWZ6?=
 =?utf-8?B?WE94ZmlYeDNVYURLUUJ0UC9QVmluOXRjVlJDVWZQRWpuemJEZzVRd1kzNkhh?=
 =?utf-8?B?Z1pZUFJsM3dodXRPbm8vY2tpaWRQOEVFdmU1QkFWR25TSVMzd3VwN3cyc3gw?=
 =?utf-8?B?aGhyLzhDMGhmL0FOM3prZWwvelhRL2oxd2VPcUhoeEpSUkVZK0lvVTVUWmhR?=
 =?utf-8?B?T1VVWGJNYStrZ3ZvcHpYVUI1Yk5LSHdybi8xTmtNVG4yZmJBYzl4dUxFZGdY?=
 =?utf-8?B?UkhkQmc2Zk9ZUklQZ3IvSVpWVDlKb1hERVpWdDh3TG5wQURNOTRFREhEdTJI?=
 =?utf-8?B?NHl5VnNiT2VlZStYNFFPK2pEQVZGdklsWXFQd2p1dlJVRFp1Q2tDeEdPdytV?=
 =?utf-8?B?T21oL2M3dERnSStOem9mM1AyYlNwdlVEbEpWTUR3NXk0UnAyS0cvMHFDU3ZK?=
 =?utf-8?B?dEpmRU9MeG03RXdERjcxSTNyMTMxR0Z5V3d4WDJxaWptQVdQTmg1L0lGTDF6?=
 =?utf-8?B?MnlnS1lyNEd2eDJFZlJiSlJlb05aYW83R0FFSUJRdWo1bWJZV0JmZ1d3bVpr?=
 =?utf-8?B?SUlOakc4K3F2RXpqd01HZjR6cWlkcldaOHpGQWtybFlOWFBjaVZHbGhNeUY4?=
 =?utf-8?B?TEFkV0xydmRxWlpGcHpBVWVNcjMwVCt5TWtCMGpGSFlIa3VJbFJNdDZYeUVr?=
 =?utf-8?B?WFBLZENUa3BRc3hqQU1ObmtmMzhvVWNkN1pHVmNkYmh4Y3hRTFo3Mmx3SHRU?=
 =?utf-8?B?RFlyL3FHVnhIdzJ1Qmt3cEhRWXYyMllWKzd3ZHg4NHN5c3FOWnNHTXBpb0xU?=
 =?utf-8?B?YUpkcDNZcnQzeU5TMVV0NFdlTzlYT0gwVWNFWVJkOFFaeWZydHJaZ2xxdnZl?=
 =?utf-8?B?SHNCdzlBWDRxUUVEVElpWnBCKzluNkhVTTdyeDMvUVB1QlJldnVrcUZ2N2kz?=
 =?utf-8?B?V3V1SC85bVdJS1p2cmQ3WTFTMFo0a0c0cEVhdzc3MG1DN0pRc3ZaT090aGFv?=
 =?utf-8?B?TDJkR2dKSFE0VjlPb1k3dWVTSnh0Vy9NV3hNM1dVS3hFN2NvUXR0WW90L04v?=
 =?utf-8?B?MVlUNWpwQ0dWZGxqQkVIbTNKbFJEVkFPM29FSUlsZHlYL2VKakNYRU92UFJV?=
 =?utf-8?B?dGkwcVhhODhjUEpXaHg2QlZlYTE2d2RQTzVuSlRDMHJHeis3alh3MHVTaHEy?=
 =?utf-8?B?NmQxblducTdNeGpjSUdaaHBCRTVuL2U1dUZMbXpYWjkxZ3MxbmhDTHpFUUJM?=
 =?utf-8?B?TWhZaE5hVDMweWZMekNUNmV4cUZBc0pmMi9KbkFyUThWT1hrQ1pHZGxNVjZ0?=
 =?utf-8?B?RTRjblMvN1ZOQWFMSFdXdzZJZ1lDYnBjNXo2K2wwYVRLbFV2d1p2WFJSTDgw?=
 =?utf-8?B?L2hSaG44SlduanVGVndZYmhrYVF6RE5wR1dSNGNJUllSMnFObnNacStDaFNZ?=
 =?utf-8?B?REFNUHZEQlZiK202SXc1NDR0ajZWTEdrS3ZSeHdZRE5TV2VQRWhDYnJRaFdT?=
 =?utf-8?B?RVZKckZDRzVwTU4veGdWeGpDcEFrYUdqbjFUMXpxaWtISmFQNTNZUXZKTjBL?=
 =?utf-8?B?Y2xVQ2hYK013c0YwWk1aRTRzV3hMdW9sRHQ5eXBSdWlxL3EwdWlZbFJTdWtq?=
 =?utf-8?B?UVRvdTB3Nk5lcFg3SlBxdFNuandLajVOVWZXNnVGZU8vUjczVng5bmVaZjZC?=
 =?utf-8?B?SVZ1WGcvMlR4Q0k5QVNMc21DdHBOYTgrWUZSL3M2Ym1mbEtCZitkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6663B64F77FFB409FD179092D195AB7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6acc2e-822f-4fe5-1b63-08d99929de4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 09:12:15.0249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O7o638qslUb1euyGRjoI9FpmdIb3kKFyRNIemkm5dVMijDraI4Us7McS2KynetrPfNqUUrXQFum7btjnpeNS/finLK/Cva3MSmEn20teJHu5IU2hDY8TepS2D5reBtpo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2830
X-Proofpoint-GUID: XYnu3R2EmAdObfk0IedEAA5OXGGctZTE
X-Proofpoint-ORIG-GUID: XYnu3R2EmAdObfk0IedEAA5OXGGctZTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_02,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=987 phishscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270056

SGksIFJvZ2VyIQ0KDQpPbiAxMy4xMC4yMSAxNDoxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMTA6NTI6MTNBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVGhpcyBpcyBpbiBwcmVwYXJh
dGlvbiBmb3IgZHluYW1pYyBhc3NpZ25tZW50IG9mIHRoZSB2cGNpIHJlZ2lzdGVyDQo+PiBoYW5k
bGVycyBkZXBlbmRpbmcgb24gdGhlIGRvbWFpbjogaHdkb20gb3IgZ3Vlc3QuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPg0KPj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFybS5jb20+DQo+PiAtLS0NCj4+IFNpbmNlIHYxOg0KPj4gICAtIGNvbnN0aWZ5IHN0cnVjdCBw
Y2lfZGV2IHdoZXJlIHBvc3NpYmxlDQo+PiAtLS0NCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS92cGNp
LmMgfCA3ICsrKysrKy0NCj4+ICAgeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAgfCAyICsrDQo+PiAg
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92
cGNpLmMNCj4+IGluZGV4IGNiZDFiYWM3ZmMzMy4uMTY2NjQwMmQ1NWI4IDEwMDY0NA0KPj4gLS0t
IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBj
aS5jDQo+PiBAQCAtMzUsNyArMzUsNyBAQCBleHRlcm4gdnBjaV9yZWdpc3Rlcl9pbml0X3QgKmNv
bnN0IF9fc3RhcnRfdnBjaV9hcnJheVtdOw0KPj4gICBleHRlcm4gdnBjaV9yZWdpc3Rlcl9pbml0
X3QgKmNvbnN0IF9fZW5kX3ZwY2lfYXJyYXlbXTsNCj4+ICAgI2RlZmluZSBOVU1fVlBDSV9JTklU
IChfX2VuZF92cGNpX2FycmF5IC0gX19zdGFydF92cGNpX2FycmF5KQ0KPj4gICANCj4+IC12b2lk
IHZwY2lfcmVtb3ZlX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt2b2lkIHZwY2lf
cmVtb3ZlX2RldmljZV9yZWdpc3RlcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+IE1h
a2luZyB0aGlzIGNvbnN0IGlzIGtpbmQgb2YgbWlzbGVhZGluZywgYXMgeW91IGVuZCB1cCBtb2Rp
ZnlpbmcNCj4gY29udGVudHMgb2YgdGhlIHBkZXYsIGlzIGp1c3QgdGhhdCB2cGNpIGRhdGEgaXMg
c3RvcmVkIGFzIGEgcG9pbnRlcg0KPiBpbnNpZGUgdGhlIHN0cnVjdCBzbyB5b3UgYXZvaWQgdGhl
IGVmZmVjdHMgb2YgdGhlIGNvbnN0aWZpY2F0aW9uLg0KT2ssIEkgd2lsbCByZW1vdmUgY29uc3QN
Cj4NCj4+ICAgew0KPj4gICAgICAgc3Bpbl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+ICAg
ICAgIHdoaWxlICggIWxpc3RfZW1wdHkoJnBkZXYtPnZwY2ktPmhhbmRsZXJzKSApDQo+PiBAQCAt
NDgsNiArNDgsMTEgQEAgdm9pZCB2cGNpX3JlbW92ZV9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQo+PiAgICAgICAgICAgeGZyZWUocik7DQo+PiAgICAgICB9DQo+PiAgICAgICBzcGluX3Vu
bG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+PiArfQ0KPj4gKw0KPj4gK3ZvaWQgdnBjaV9yZW1v
dmVfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgdnBjaV9yZW1v
dmVfZGV2aWNlX3JlZ2lzdGVycyhwZGV2KTsNCj4+ICAgICAgIHhmcmVlKHBkZXYtPnZwY2ktPm1z
aXgpOw0KPj4gICAgICAgeGZyZWUocGRldi0+dnBjaS0+bXNpKTsNCj4+ICAgICAgIHhmcmVlKHBk
ZXYtPnZwY2kpOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94ZW4v
aW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBpbmRleCA5ZjViNWQ1MmUxNTkuLjJlOTEwZDBiMWY5MCAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi92cGNpLmgNCj4+IEBAIC0yOCw2ICsyOCw4IEBAIGludCBfX211c3RfY2hlY2sgdnBj
aV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKmRldik7DQo+PiAgIA0KPj4gICAvKiBSZW1v
dmUgYWxsIGhhbmRsZXJzIGFuZCBmcmVlIHZwY2kgcmVsYXRlZCBzdHJ1Y3R1cmVzLiAqLw0KPj4g
ICB2b2lkIHZwY2lfcmVtb3ZlX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+PiArLyog
UmVtb3ZlIGFsbCBoYW5kbGVycyBmb3IgdGhlIGRldmljZSBnaXZlbi4gKi8NCj4gSSB3b3VsZCBk
cm9wIHRoZSAnZ2l2ZW4nIGZvcm0gdGhlIGVuZCBvZiB0aGUgc2VudGVuY2UuLi4NClN1cmUNCj4N
Cj4+ICt2b2lkIHZwY2lfcmVtb3ZlX2RldmljZV9yZWdpc3RlcnMoY29uc3Qgc3RydWN0IHBjaV9k
ZXYgKnBkZXYpOw0KPiAuLi5hbmQgbWF5YmUgbmFtZSB0aGlzIHZwY2lfcmVtb3ZlX2RldmljZV9o
YW5kbGVycyBhcyBpdCdzIGNsZWFyZXINCj4gSU1PLg0KT2ssIHdpbGwgcmVuYW1lDQo+DQo+IFRo
YW5rcywgUm9nZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

