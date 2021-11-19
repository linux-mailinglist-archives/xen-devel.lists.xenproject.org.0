Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4B1456EBA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:13:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227821.394132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo2lY-0003NG-At; Fri, 19 Nov 2021 12:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227821.394132; Fri, 19 Nov 2021 12:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo2lY-0003L7-70; Fri, 19 Nov 2021 12:13:16 +0000
Received: by outflank-mailman (input) for mailman id 227821;
 Fri, 19 Nov 2021 12:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo2lV-0003L0-Vp
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:13:13 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 109d9b9a-4932-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 13:13:12 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJC4dsK004508;
 Fri, 19 Nov 2021 12:13:10 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cebkv8108-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 12:13:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3374.eurprd03.prod.outlook.com (2603:10a6:803:18::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 12:13:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:13:04 +0000
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
X-Inumbo-ID: 109d9b9a-4932-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhZeUlM3JR01ERgyI0rvFacxfZKEOpNMgIkW2CnnwuZems6vsXzwNL3t2i9QF7ZYA9Gbb0DlfIQNeTFQ6tqLyT5V668oj+JiKOvORd4/wJyikrHgJDPMR88dWUa24cyMOFD0s6shZMgDir95biD3/NGenBF4dxOzSfJFWVqeM2qxNfb6ULdUGbw5Jq1c5Bq5hgkKQw0Vs1OGSisCKDzx3skWxD0P5Lmu7r6upP67MKayKxzbyB6Qmnd0TrRiTqXfmQvcsaBkN30yR0XHuJ0PLzObynDutcBTaKqy/BlhSKRdgN/l/qthvs66KX1rvi/jD2grgVPtfAmQQ8jfvarrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDBQ80/RC1YqUCquDDAgX3DzhscKRB3rTmwOkWc0igU=;
 b=QGwgfGyAWaWztcVBZzG65y2jD3YcUzORr4DS7ue7qd9GywWWvFrTt8dffiUWQWLx3IGIZcyrjB//lCxZ8lFnWu84sCt1koIjOHiLfyfpDocqLKSq1VVNCPCPAo2fFFw6NCMfAByHFOs7p09STApGTVC3gz601cqBLSaR3JazGYKdzpAkxrZIhbeQzvT8Soz3npnOqCytw5lt91DuuirxDYp0AFa6y2m4zR1VLdArEB5Iu57CAdIsmn0DtjOP7Kzu+2bUMYlOQ8PMiZS7Sq3jxWEuqOQ8x3WwAkHLZ/PvuLUZwwv8fO0mEEDky6JyhlbwMfkYdxlgWkCx/qy9i5Jrog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDBQ80/RC1YqUCquDDAgX3DzhscKRB3rTmwOkWc0igU=;
 b=sbKcUIKq1A1E+omzXbMCljkrwbyDwNX2c3uwV47blHwTYTZk8V+AplxkcSkq4G+N2NH/tqZbq/TjoYtHJaMI3OOsCTAB7vIGDTYZnM73QLBspCu++AgLLVpnLPUH5yt+BerAEO9uocDLD78Al+Qok5oroJ1BK/sUwf60OuWZGthS1glIdMAzySsOQQFdsCBoW+h8fTYNEqUnqeFbOoaiF+e2Sflz39Nuzg5pD08gyWW4tzwUofsCop/I8XASo43Yr/BxTCSFHbvc6r0Q8hd2W2J88Mnc+jP0Z6IPhruet2PE/JBYOUCso/FXPGku1y+C2QSJb3nuDxk6y5HF/N4qQw==
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
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v4 06/11] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHX0hJLwt+wJ2t1lka5jlbMIq7ZAqwK13MAgAACAoA=
Date: Fri, 19 Nov 2021 12:13:04 +0000
Message-ID: <1a380ef9-bdc9-bbfa-35b7-ec1c901e3019@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-7-andr2000@gmail.com>
 <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
In-Reply-To: <9aec23b3-2269-39fe-9fc0-fb8cf7f9de44@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57e50c3a-8349-4bd7-b5cb-08d9ab55f093
x-ms-traffictypediagnostic: VI1PR0302MB3374:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3374F9093D687C1DAFD81616E79C9@VI1PR0302MB3374.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P+r8cPVDwLmYruEGztkUyLcEMpXZuw2oE4rd01ve+4IeJje3/qDxmXNhs0a7MhD3Kz1Wdw2pvJNIS2Pb2GgUzBdJgiF/BAoXZdMRA4w0QxtasPUSUscWIclOCCfkcuyvXnMmE7bOAyrbgCRElRmF0fxnCeoEVWg1eIfGqznVG//z8LNQyp7dWV9JuXPMRW6M0gucU9ataaPXPYkKuA73zzrjqULguew32Emyd42r9+f1WAUx6fgM7OKylP/6b5bVhvw3bTAQVlaupgT/oOqdpX/u3H6x5aoyqVjQM/H5gXwltw/QGe9VTcZPm/F4c+swoPI6WEbzx1+yTxRAGBT9c2CrHrxHVfuiOhWPJrWU2r3gNZcm3yh2NuEfii9/gSC54naRQJ1KFFJg15bx1WCMhHx139WCTKUGLkkRLiFjd6NKRtZo+rqGjEYf1NS3J/Vrag6F6Plw5gzrISZIdZshLFa/gyUrjDr/c/mCwXpswi/KKhKVT2dayOtbP8UqRvpzqX1feQzhAmD9u+IAD6xR3gL8rMjykzrewnvbTQlPUi15lccYK7XKZ0ZXYdVwJNJVFV6ZvDLbdFSKC+yScfCuvCz+barNYMhIdjouWMVv+je3BdJuCHYFiYYXja1LtjFr5C6hiOjdEbVKeLRc7S3xARe8iXTWKYUqGfRcIzluOfQRl2iUmsznCKPBMjSi6mr1V0S1spVyN+CA8MTCuHjwqyH338CFwKSL1IOV7q2D++hg2m+C6taq911/uqMbklAi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(4326008)(2906002)(36756003)(31696002)(6486002)(6916009)(7416002)(66946007)(54906003)(508600001)(2616005)(122000001)(6512007)(8936002)(31686004)(6506007)(53546011)(86362001)(71200400001)(316002)(64756008)(38070700005)(8676002)(66476007)(5660300002)(186003)(26005)(91956017)(38100700002)(76116006)(66556008)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eW1aTytTS09Oai94QnM2cXE5ZU1OOTVjSXVtMEYzZ0Z4YTVvbzk4bDBIcXhH?=
 =?utf-8?B?aW1BODlsb09zc2dsdUdNbUtwakp1UGU0RUNHNzVYUndRWWI3Q0srVHFLeUNs?=
 =?utf-8?B?bWhxb29QMUk3ZS9ZMzBWanN4RU5oSzRpc04zYUs1NHlCMERaaXpHSDNINFFp?=
 =?utf-8?B?ZmJLZzN5UXh4RXNhWXBzYXpyaWlBMG5GME16S2U0M2JndUVCUzJCdzlxVlJx?=
 =?utf-8?B?WUh6ZHdQcE11Qzg4UU5aYzRLS1FwQzlMTzhud2RmaWwrWGYwelFha1FUMDFM?=
 =?utf-8?B?ekNqTTFpTDAvMEZaWENmZ3E1TnZURkY2d0hJZWVrTGJxS1FnRFAwSTRYNWRN?=
 =?utf-8?B?ME16N2RrOEpBc2htMXdVUEU4MVdBSVlRenIvMzI2eGNuZW1KbHcycXUvTnh1?=
 =?utf-8?B?aHdQb1RCQXU3S1pSeVY5M2lFc1VtR01GaW5lTTVCZXBsSnJZVkNaNXd3Z2JY?=
 =?utf-8?B?WkIvWm41MW9BUDlFN3RaWWtkbG9nQTVwN3FiclU2VjY4aVR5K2ZsTFdkd25i?=
 =?utf-8?B?M20xcmQ0cW5WaUNzSU4rWmZMVGxRVGVqWHhSNU55V2dhT2RwcjFyaHFyaHNY?=
 =?utf-8?B?V1JGUVhmcjJKeVlTTzNKdDBzU0VNOGhBV3FiQlRtTHZRNG9ZZUo4VWEyNUZH?=
 =?utf-8?B?aTlCaFFtMy9GODYxWGpaQkJ3d09HNGxzVVBIVTBPWGxPTEg4UlhObkl4ZFpF?=
 =?utf-8?B?a1ZKQ1A1bDVPMk9MUWRzU3FkQUhjVC9heEkxSERXdk1RQUxFcW9UcHZzZFVC?=
 =?utf-8?B?b0F4QWZTeTlrLzhSSjVhYkpXbGF1anRUODhhcmh0bHpSaDRPRG04YUM4bHRC?=
 =?utf-8?B?cmVPdEpQOEdIaUxreUMwWllhcFVwby9DdjVNTGFFSURNdlNzdUp2NXVwdG1r?=
 =?utf-8?B?dDRpaXh5aUNXWGFab3BzWm10bi9VS2dlSW5BK042UHI3T3h5OTNCbnJOTUNj?=
 =?utf-8?B?aFdydHpsdC82ZlcrUGJXQXhXVkVGYWdIV1dlSzF1c0o5SWg0emQ3S3hxckR2?=
 =?utf-8?B?RHBIaTZHU3dCaVJWUFdXTFpWenQ4RnZ0UjBEekNxV21nbURMU2srbkY0NkVY?=
 =?utf-8?B?VzhydzFMUS9aa050cmZMZGxDY3lOWUpVUG1FNlpGNHJvSC9VcERHS3BnUktC?=
 =?utf-8?B?MkhyK0p2eWViN1gxdEhLcXk0OFVaKzIrcFRVTU9kSzVtNkRNR2xHTGVlcFNN?=
 =?utf-8?B?VkRLOWNWektRMUdncUpVUk1XSVZKdVhnMEZRYmZ1MmtiRHdBWklXNFRQVUUr?=
 =?utf-8?B?YVErRGErOVVHc09pci9ySCt3bkhmVENyQXB6K3lMSDhZQ1RsakNDaGNIVWVL?=
 =?utf-8?B?Ly9Nc0Y1SzZZemhLY3E0N2hRZHJoVytIaTQ3SG1UcUdFcHpQQmFNQUJOaHNt?=
 =?utf-8?B?MU5JUWMvK1dacGVia0Rkc1Q3OGJaRm9MY0xHSnlZUkNIOVk2V2NvTWR1OHp3?=
 =?utf-8?B?OWJhbDY3TUZ5SCtubW84NVFrM09RY0trKzFnTklUWG5KTGUvOU1Qc3NTbS9D?=
 =?utf-8?B?Y2ZjUUluU0xab0FOR0hVMHBES05JNUdNMlFueE5OREJpQVkzK1pKNWRlMWN1?=
 =?utf-8?B?ZGYydE9WaXhsV213a2JDaHQvOUYxeU1sV2FmTGRQa3I0dW1UMjdOWWZYV3NU?=
 =?utf-8?B?dFBFNEMwSHc1Y3dUNUpjQkVCS1ZVU3JDZkNlM1ltOTNwOHZqK0JEWEcraG0r?=
 =?utf-8?B?RGZGb3F3bTUxc0RwYXgxQnRyS1pjc3lrUlFacEM0Sk4ydkRjQkN6NXdvKytW?=
 =?utf-8?B?b05kbzR1K3krbGFHekR3a1doMFpMcW9kZUZ3K3k3ZTRSbzYzVXNGZXBURDM3?=
 =?utf-8?B?NGpqelU5cDl5U09UZXNSd0VxVjBpeE5ETWtrUGVMcDJidjl0RWdJR3R2ZVBm?=
 =?utf-8?B?YWpyRzZjcDZoQmFoNytBMVNYb2tNaVl4SVoycy9qYjJETmtuSnRyNUhjNDR2?=
 =?utf-8?B?OTJYNzlzeEdaWXcwRVVwVGhjK3h1UGhBbmFZbkg4ZmhYaXkvTitoZGFqWSt3?=
 =?utf-8?B?WjJMUElGbkFoMVRJWmNYRWd2TVVqN0dXQVJaL1ZQZitvOWQ1U2ZMajYyeWJl?=
 =?utf-8?B?dnlWR2x1T2RTUjFVd3JtakU4UUMrVkdSeUhGdGJXWmVrUFlNM053WStVcmRh?=
 =?utf-8?B?WTcrcmRxd1QvL1dsbFdiK2J2cTBQd0piNXk5UjV1L1pRbzVpUmxTRi9ZL1Z6?=
 =?utf-8?B?b0JSNUFtRUk2dVJZSUdveThIS3JyUFpLQ2FCVHdOTk1CelZUOFpDRC9KWTVy?=
 =?utf-8?B?aDRGVTJZamcxZ3F6UUoxYTJGOHNWdHF2WE10aW1QOENyVmlIMW1uSXdmeG0z?=
 =?utf-8?B?YUVVdXpGNml5blUyWHN5WEVlVHMxR1A2azdyNHMrS09kUHIwc2p6QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A79C096B0DD70C49BBAD96E67455F1E5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e50c3a-8349-4bd7-b5cb-08d9ab55f093
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 12:13:04.5591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nzbPTswmMO7LRZtzKfLImJ6NhHnS4zR9plLTjkTRNbN6lrNO6kZ18tfEhwiwp87IS2eVx+Q7G+5/TMHDH7dxwRbzo+W7YjrvJNTB81PvK8SF/8p2LPK3rW00ld7yxIz6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3374
X-Proofpoint-GUID: 3erRKLj1AqiVLa3XAKpPuWDWmK0j-SlV
X-Proofpoint-ORIG-GUID: 3erRKLj1AqiVLa3XAKpPuWDWmK0j-SlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 mlxlogscore=848 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190069

DQoNCk9uIDE5LjExLjIxIDE0OjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gSW5zdGVhZCBvZiBoYW5kbGluZyBhIHNpbmdsZSByYW5nZSBzZXQsIHRoYXQgY29udGFpbnMg
YWxsIHRoZSBtZW1vcnkNCj4+IHJlZ2lvbnMgb2YgYWxsIHRoZSBCQVJzIGFuZCBST00sIGhhdmUg
dGhlbSBwZXIgQkFSLg0KPiBJaXJjIFJvZ2VyIGRpZCBpbmRpY2F0ZSBhZ3JlZW1lbnQgd2l0aCB0
aGUgc3BpdHRpbmcuIE1heSBJIG5ldmVydGhlbGVzcw0KPiBhc2sgdGhhdCBmb3IgcG9zdGVyaXR5
IHlvdSBzYXkgYSB3b3JkIGhlcmUgYWJvdXQgdGhlIG92ZXJoZWFkLCB0byBtYWtlDQo+IGNsZWFy
IHRoaXMgd2FzIGEgY29uc2Npb3VzIGRlY2lzaW9uPw0KU3VyZSwgYnV0IGNvdWxkIHlvdSBwbGVh
c2UgaGVscCBtZSB3aXRoIHRoYXQgc2VudGVuY2UgdG8gcGxlYXNlIHlvdXINCmV5ZT8gSSBtZWFu
IHRoYXQgaXQgd2FzIHlvdSBzZWVpbmcgdGhlIG92ZXJoZWFkIHdoaWxlIEkgd2FzIG5vdCBhcw0K
dG8gaW1wbGVtZW50IHRoZSBzaW1pbGFyIGZ1bmN0aW9uYWxpdHkgYXMgcmFuZ2Ugc2V0cyBkbyBJ
IHN0aWxsIHRoaW5rIHdlJ2xsDQpkdXBsaWNhdGUgcmFuZ2Ugc2V0cyBhdCB0aGUgZW5kIG9mIHRo
ZSBkYXkuDQo+IEphbg0KPg0KVGhhbmsgeW91IGluIGFkdmFuY2UsDQpPbGVrc2FuZHI=

