Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A0F45EDC8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232648.403400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaCs-0007N6-Mq; Fri, 26 Nov 2021 12:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232648.403400; Fri, 26 Nov 2021 12:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaCs-0007KZ-Jc; Fri, 26 Nov 2021 12:19:58 +0000
Received: by outflank-mailman (input) for mailman id 232648;
 Fri, 26 Nov 2021 12:19:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l8BS=QN=epam.com=prvs=1964012c71=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mqaCq-00079e-Hi
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:19:56 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2925b5d3-4eb3-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 13:19:55 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AQBauFu002728;
 Fri, 26 Nov 2021 12:19:45 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cjwtr0cdu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 12:19:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3428.eurprd03.prod.outlook.com (2603:10a6:208:c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 12:19:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 12:19:35 +0000
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
X-Inumbo-ID: 2925b5d3-4eb3-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORb6+PizVGtoovzi9WJhKaX6voejuoNyKFAtlN3PQMjRwO7Epdzu5iSd5TfrgtESaLR88Pz32nICQZw9ng0/c720WzoORPJGlIlMQy4iAsUvSWzH4QZiAebLiDOIRpIFeOyN680Asx9HEWH1uCdKocXsqVKufD+9KuuaK6Hn7ipBGrMZIKxLPmKMklzQr0XlSrlHb8MkRqb4aDpy2SN1ua5osrqTdHqVYrbA6VqYk7Z2TKltu2jw+aEeyVqOp/Jic3YWHZKMYKbSnKH2lHt+P9QjSbYfhzxQSxu0QxzDcnLEq53kncpe2avGlq3dh169yUIMIomDjmmQZemiEGHF2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CJN6twaB/kwiO/2k7M17iV0qjqIB85527pwEKBSqL4=;
 b=OE5NniKjdngx0CB5YQ1o+1cVHjqVz/EEsmyKLUpTbJUPDEO8HPOMLGzoqtqtX6rc03Sl6gzanQWviGRqe3QFdPczV9KCzIGcSzP4oZDG1U/MG4fA/KpZxjSF256ZPVcZwxIvt47yhGjIqWkpMKyQFYHvf+jJXVh3bQ939K6tIZUlfh8AQEwPHDF9cio9gdgHa/Wt/6kMCt9nIGfBxHFLIizvgn3NMjB1opUHYeJAiPANyESPDUZI5qz6UKWKnDeNx2pK0/74ck4gxocYeC1Lu+V3pxnwY68IwqrDViEOsxePVkLS4xQwp+e4yI/+PyYPYDhE86yC0p3AnOocGZac/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CJN6twaB/kwiO/2k7M17iV0qjqIB85527pwEKBSqL4=;
 b=Bf2IzO9gffoICiz6x+fohKvWs9ylda9UA8W9oIhWx9EHGBZbY9mTmjftUh/Q6bDFKyqmVoVYWth4JZH87T/tOB4oU03AoSVuuCGuls3RqbmlL40u06UjKawqZ3vI7Kc6mC2964EfLzh5g40JwOSi7JJrszK9S8hdYyQ1e7NcmVoUktER7p7Sx28pZZSZfZfYiCi6UurtN441EMGZw9Dz1Ig6xqwH+cS+vqZoi2PO+0Mjb5mkwWYRN1qok2SsRnKuSrKgnXG4C7seaiJQQ3h9Pmwb76KE9ONZKzdIHsKiOBaQPHBOJ/b6FJb5+7suPyS0/mLPNeoJVpG6vnTJQ+Q9Bw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
        "paul@xen.org" <paul@xen.org>, Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNawUby8AgAFMuIA=
Date: Fri, 26 Nov 2021 12:19:35 +0000
Message-ID: <a6ee236b-5a00-8116-c744-6c94fcf46ae1@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
 <34FC3FE6-EBA8-4A5C-A1F3-1E9F98C0337F@arm.com>
In-Reply-To: <34FC3FE6-EBA8-4A5C-A1F3-1E9F98C0337F@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1af71ed0-bb3b-4311-8abf-08d9b0d702ba
x-ms-traffictypediagnostic: AM0PR0302MB3428:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3428CC62BD187FF0FE34E975E7639@AM0PR0302MB3428.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zmG3WO0jvcheHsiqFAljNe4hPZigfU/ah2YYKYh/HoR/T8S6NY4sQ0LWZTF7AszpTSiTAhlM9oF7oBCtrtYONghNORyXFBVOXsG9YcwOoFWG9wLevG89hrKKrJ0Mp++em1rg/8938+x+d682gxXlLooBGbLUnzF7iHVrpP2IZut9rt6bQ6RJYhOO8oHkLzser6i+lWkK9tdZFnb1spq7rCdQ1MtEOyVp35THzfWczE0GXKg7JAcBzlzhRFsDrf1dHin2rK70GVEeAsp5FaiO146xNsKEagyzsinuzFlYYWrKvprHnE2M+4QIwK1BR1xO5YeVABup9+HaNEhS/yPm33HBFBA45cAl35xe3mVLn3G3j8YVEO3zfIIYpK3BM6gvJiiC9WQv5NZQuMbCRVcKXOGFNyAhBmEhkFMuOT0ol1xRsgkGfEg2BMxU4+KS2WNJSKx6UtxCc8KOBubXJ8Ahf/5KZUiYZHGtpIlutPn3kgcA2M1YfMgnOFabgPIO6L6rxQgWS65KIt6od4p45lX+/76e+V+lD5BipNFWHFaP1aX41tNfWLVnYh0Q/RJdzByQ8KeelVjA182jWqFMam1HXoDuNvhHUkMD+a4hEXhkN6d/Ned9IGViKwPV3aThvq5Q0B5z4EUebqP84lQvF1HSLZsGN+s7pqf76xVVzl3YSesE188F9eTR5LHR/3xle9hdxGxkRA/Pl6e4sAfkPM8gRurrx/VEQR3heNFRGyPiia+zU3ADju4eiOOBZ0A1xfDq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(38100700002)(2616005)(26005)(38070700005)(71200400001)(36756003)(8936002)(8676002)(122000001)(31696002)(66446008)(508600001)(6486002)(6512007)(66946007)(86362001)(64756008)(66476007)(7416002)(66556008)(107886003)(91956017)(76116006)(5660300002)(4326008)(316002)(54906003)(110136005)(2906002)(6506007)(83380400001)(55236004)(53546011)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dzJKb293TU5pdEJEOEZLTUQxZ09NdTFIQ052ZG80dzk2a0ZoekRldkkvV1dz?=
 =?utf-8?B?OVF5NXVsWGFwZExMOXRaM0lPZTRSZjE1Q0ZxTXVha1o2ZDVscWFWQTlra2R1?=
 =?utf-8?B?bnBWN3VlM2FtbzkzblNQVDFjR3VxZmFlMHF6bVoydmlJUE42MW5oSFlqaEQ0?=
 =?utf-8?B?UXBjVkpNZGdpSG1EZjBxSmtPR0VHVnlSSEFIb0Z2UXR3dTQwNUQzWnB1NTJt?=
 =?utf-8?B?RDNqQ3VVNnVVd3dweC9DVEJiejJGQ05HSWpnakFNOG9uLzJrUmo4bjk5aVFR?=
 =?utf-8?B?T1ZzNWJsU1A3L251UzF1ZzlvSnVGcE5FR045LzltSUNxRE1lMnpCcEhHWlds?=
 =?utf-8?B?OGs0NmRvQzIzOEpDQ1hFRkMrN1N0c3prZDFTL1c1ZjVwVklSN1FXWS9KWU9I?=
 =?utf-8?B?a2ZyNDZOMEMvZWxlOUxVSWVoK3NhcG93SDRoTENyUUdaWVlCYmw5d2NQY0xt?=
 =?utf-8?B?a3dDbXc4UzBtVWV6TDdTOFc0ZFNJRkIyMlNTcUFncmZ3dEIraDdwd0NVZG9P?=
 =?utf-8?B?RmJjQnpLUEtMeGR4djNLM1ZwVGd0UzN6QnZWSStHZ0tRVU1tdUhIaDB3dThR?=
 =?utf-8?B?dDVOeWpUUHBYaUlzVmRqRjJnR3pqTENCVHFrK1RBT09MRHRQL1Y0TGhVQ2FQ?=
 =?utf-8?B?cDVRUVRpbXlvS0QzSXZvckU0ZWxVZnFJTnkyTTBnZzc1KzZ6ZHRJcE1EbmNj?=
 =?utf-8?B?MHViR3NzeUhSaG95cGRNYzBwNzRuVmlTUjZUcS95YU1aT2dIVUlvS1Y5RUdr?=
 =?utf-8?B?ZXV3dm1EY1RnUnU0U1V1T2lkenNTMTZxVE1QRjUrSnNRQnNFc2FZa0dvWGFL?=
 =?utf-8?B?bXd4b2drVzgwWk85aGFtRkJqZkJtTlFyZEdQcmx6S2w5QS9qQTRkaXBteXNE?=
 =?utf-8?B?enpLVkxVOHJHNVdzQVpoeDBDYk9hT0JCSTNwTCs1aXo2b3Jna1NlNDdXOUR2?=
 =?utf-8?B?WlJZY29wOFFTcjZqNWs4ZWZZRGVpZ041Y2xibWZ3S2xocklXdGxUYXFjbTd6?=
 =?utf-8?B?YjNpSk9tVFVId2U5VVFLbXh6bnpRVHVPdmNCaStMVHhtaEVjMkJXcTBhaExi?=
 =?utf-8?B?MFJBRnBxUW1SdjVUNHFxaVZwek4zSUFvMHk5aVpLSHVGUWFONVA2ZTFJN0tI?=
 =?utf-8?B?dFVvMjhOazVIcEtHOVBLSE9RVEFkb1BNS2NiQnQ3ajQrRVFjYlBxV3JwYzVG?=
 =?utf-8?B?Y1VxUTRZSHZVeUhBMDVNRzlHRDl1QUxJdGpuQ3EzZUliNmw1Y0pkNUdWakhG?=
 =?utf-8?B?NXRzM0VtU2VWZ21GWmtWaCsvUkJxVWFpK1JMZjFtTHQySm1GWnVSWEU1cHdP?=
 =?utf-8?B?VTZBNU0zdzFWQU1WUi81cXB3aURrM3VMQ1RsMXQ5b3hGUWJFdkMwcktZRXpB?=
 =?utf-8?B?MGZwajh2UFMzWFJGK29DU2I5aGtlNmtPbjRiUFVRVmNKQVJVcWFmZkVadE9C?=
 =?utf-8?B?WCtIQkdEM1Z3US9rK3ZmM0l2SDhuOUxHdVluek5PMGx2SGtFTnpSTERvYmZE?=
 =?utf-8?B?Z28vNTFyOWVvV25iL3JaOUsxanRQbXdWR2ZjQ0JudkMvQVZNTmYyYjhIVE1L?=
 =?utf-8?B?UHFReDBFcWdORG1JWG1qRDJCaDhEQ0lFMWVSa0psM0FoellleWczMUJ0TmU4?=
 =?utf-8?B?NUp2Z0dmcFZYOHVXN1V2WHBHbmxTUEZmK3V4dVRldVFDcUZuTTRJTUZ0SWhQ?=
 =?utf-8?B?bzI0QjRvMjJBS3hKejUyL3NncngrallWZ3VreHV2UXRzQlEwSUhoWjdQcHU1?=
 =?utf-8?B?WDlnV283WlpvdkVQOWxnczV5Rmp3S2srQ2ZJVmpwU0FHOW5IWFJnQlo4Tmg1?=
 =?utf-8?B?ckdSemxQTGZmSUxHS0NSV1AwcFFNZzQxanlyRnVOaW9JcGNuMFJmUU5heFNh?=
 =?utf-8?B?cG51bkM3aHRPTlB6K3p3SGVET3JzSmFWQXNnL1JIL2JyM1l3WXdEUFhqVVo0?=
 =?utf-8?B?UFVZK2E4K2ZhM3RjKzJ4NnAxTWVrVjRyckI4OTdCaG0xd3d3RU43MzFiR3Nt?=
 =?utf-8?B?L2RNUnNqem9ENnJ0K01UZUd1NTkrbE1KQ0NWZlc5YWxoVWRHNGtUMFRXZXJK?=
 =?utf-8?B?aVd5bjV1c2d4K2JmcVhkUnpNVWFLd00zcmJTTnIzL2YzRkFyRCtYYkY1bCtK?=
 =?utf-8?B?empPSVB3QzhwT3l6SVBWRGw5dllxUzlkVnhYNENFQVNjczhIWjYrdzBNTnla?=
 =?utf-8?B?REdyOGZNZStIUUgzUGN2RlFzRTBjTlhlUzNrN2NWVzlCRUxwUkU5SXRrTmNI?=
 =?utf-8?B?UnczQnUrV0pMWG5lMFdvaEgzbFFBY3p1YlZYU0VHRFFneW81Z2NYQkdrRXJU?=
 =?utf-8?B?VGdxTjAxWDMzNWpkTlBMS3ArMGdmbkt2N2N0YlVtZytRK3BwR3hpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FC9E477967B5344AA0FCE1A07344634@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af71ed0-bb3b-4311-8abf-08d9b0d702ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 12:19:35.8608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UweeIsC2LMWVikAnOamCnCRVLnBpTt3/iXN1216DH2EaGy1lpd9bxydbpfIF+jKzH+KHeTM7Rnrq5jWnVYbh21YIzZn2qa3cREdHTSqI60mCtNjjaC1kDuS3mGixae3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3428
X-Proofpoint-ORIG-GUID: STJUTReb5n_nCz0qnjvJAZV5PjptMEX2
X-Proofpoint-GUID: STJUTReb5n_nCz0qnjvJAZV5PjptMEX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_03,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=388 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111260073

SGksIEJlcnRyYW5kIQ0KDQpPbiAyNS4xMS4yMSAxODoyOCwgQmVydHJhbmQgTWFycXVpcyB3cm90
ZToNCj4gSGkgT2xla3NhbmRyLA0KPg0KPj4gT24gMjUgTm92IDIwMjEsIGF0IDExOjAyLCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8YW5kcjIwMDBAZ21haWwuY29tPiB3cm90ZToNCj4+DQo+PiBG
cm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+DQo+Pg0KPj4gQWRkIHJlbGV2YW50IHZwY2kgcmVnaXN0ZXIgaGFuZGxlcnMgd2hlbiBh
c3NpZ25pbmcgUENJIGRldmljZSB0byBhIGRvbWFpbg0KPj4gYW5kIHJlbW92ZSB0aG9zZSB3aGVu
IGRlLWFzc2lnbmluZy4gVGhpcyBhbGxvd3MgaGF2aW5nIGRpZmZlcmVudA0KPj4gaGFuZGxlcnMg
Zm9yIGRpZmZlcmVudCBkb21haW5zLCBlLmcuIGh3ZG9tIGFuZCBvdGhlciBndWVzdHMuDQo+Pg0K
Pj4gRW11bGF0ZSBndWVzdCBCQVIgcmVnaXN0ZXIgdmFsdWVzOiB0aGlzIGFsbG93cyBjcmVhdGlu
ZyBhIGd1ZXN0IHZpZXcNCj4+IG9mIHRoZSByZWdpc3RlcnMgYW5kIGVtdWxhdGVzIHNpemUgYW5k
IHByb3BlcnRpZXMgcHJvYmUgYXMgaXQgaXMgZG9uZQ0KPj4gZHVyaW5nIFBDSSBkZXZpY2UgZW51
bWVyYXRpb24gYnkgdGhlIGd1ZXN0Lg0KPj4NCj4+IFJPTSBCQVIgaXMgb25seSBoYW5kbGVkIGZv
ciB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBmb3IgZ3Vlc3QgZG9tYWlucw0KPj4gdGhlcmUgaXMg
YSBzdHViOiBhdCB0aGUgbW9tZW50IFBDSSBleHBhbnNpb24gUk9NIGhhbmRsaW5nIGlzIHN1cHBv
cnRlZA0KPj4gZm9yIHg4NiBvbmx5IGFuZCBpdCBtaWdodCBub3QgYmUgdXNlZCBieSBvdGhlciBh
cmNoaXRlY3R1cmVzIHdpdGhvdXQNCj4+IGVtdWxhdGluZyB4ODYuIE90aGVyIHVzZS1jYXNlcyBt
YXkgaW5jbHVkZSB1c2luZyB0aGF0IGV4cGFuc2lvbiBST00gYmVmb3JlDQo+PiBYZW4gYm9vdHMs
IGhlbmNlIG5vIGVtdWxhdGlvbiBpcyBuZWVkZWQgaW4gWGVuIGl0c2VsZi4gT3Igd2hlbiBhIGd1
ZXN0DQo+PiB3YW50cyB0byB1c2UgdGhlIFJPTSBjb2RlIHdoaWNoIHNlZW1zIHRvIGJlIHJhcmUu
DQo+IEluIHRoZSBnZW5lcmljIGNvZGUsIGJhcnMgZm9yIGlvcG9ydHMgYXJlIGFjdHVhbGx5IHNr
aXBwZWQgKGNoZWNrIGNvZGUgYmVmb3JlDQo+IGluIGhlYWRlci5jLCBpbiBjYXNlIG9mIGlvcG9y
dHMgdGhlcmUgaXMgYSBjb250aW51ZSkgYW5kIG5vIGhhbmRsZXIgaXMgcmVnaXN0ZXJlZCBmb3Ig
dGhlbS4NCj4gVGhlIGNvbnNlcXVlbmNlIHdpbGwgYmUgdGhhdCBhIGd1ZXN0IHdpbGwgYWNjZXNz
IGhhcmR3YXJlIHdoZW4gcmVhZGluZyB0aG9zZSBCQVJzLg0KWWVzLCB0aGlzIHNlZW1zIHRvIGJl
IGEgdmFsaWQgcG9pbnQNCj4NCj4gSSB0aGluayB3ZSBzaG91bGQgaW5zdGVhZCBtYWtlIHN1cmUg
dGhhdCB3ZSBpbnRlcmNlcHQgYWxsIGFjY2Vzc2VzIHRvIEJBUnMgYW5kIHJldHVybg0KPiBzb21l
dGhpbmcgZW1wdHkgZm9yIElPUE9SVFMgQkFScy4NCkkgd291bGQgbGlrZSB0byBoZWFyIGZyb20g
Um9nZXIgb24gd2hhdCB3YXMgdGhlIGluaXRpYWwgcGxhbiBmb3IgdGhhdCwgc28NCndlIGFyZSBh
bGlnbmVkIGJldHdlZW4gdGhlIGRpZmZlcmVudCBhcmNoaXRlY3R1cmVzLCBBcm0gYW5kIHg4NiBo
ZXJlIGZvciBub3cNCg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

