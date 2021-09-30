Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812541D62A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 11:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199650.353843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsFg-0007JG-Jm; Thu, 30 Sep 2021 09:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199650.353843; Thu, 30 Sep 2021 09:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsFg-0007Gk-GK; Thu, 30 Sep 2021 09:21:16 +0000
Received: by outflank-mailman (input) for mailman id 199650;
 Thu, 30 Sep 2021 09:21:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4Rr=OU=epam.com=prvs=0907a041b9=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVsFf-0007Ga-M6
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 09:21:15 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c187d994-21cf-11ec-bd3f-12813bfff9fa;
 Thu, 30 Sep 2021 09:21:13 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U9IuOY004245; 
 Thu, 30 Sep 2021 09:21:11 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bdaga809c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 09:21:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6243.eurprd03.prod.outlook.com (2603:10a6:20b:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 09:21:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 09:21:08 +0000
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
X-Inumbo-ID: c187d994-21cf-11ec-bd3f-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWk5Gu1nOmUhzXAZy0M1eXhlHsyZ2RaRm7nlgtGhJgkqdd94fX9bc/1nTaV0LS4amUq3G6H2aSpX0PEhagmAjwoF2cBOkYSEpwS9O7MT3FnqaMz4ZYuWkRvf3+nMaj0o6dxpzH8j3ATn6IuPFDGwubCbOlyqDTDclh1rSjBaejrieVbP2Vi4YukOsZ3UmS9jRqSDn8X1/oifcgjcYPtlA9rnTZoE5qNU62OVxSiWRe0NmgptQLH0QxiJn8/2WKsoVjvQUit2cXnr6Su6+Ca7zSDGyyX1Hu21pij1q8QOaHbrnZI077QJ/MMQRA4b/YHBwFqM1vApfEdQI1xnqFGIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3mdNhlz9ee2At3vWD9/9dOjLTnENwnSEQLVZCu6rKRE=;
 b=isuotNQ9Xmwxra4CImz1M4KtGOUEHTw1B8hC4xPk0TXzvn4BUkPeQY/3kJAA6o38GuIfb1ETGVsNfem8XUy0YgaoAzxZJwPyOek1SpoM4kksdpPblYSfPsJFKm8iHw9HYovji/6lybii8w+92HlIjPuAOp8fousMfF4bpg2CucpS1LMVldebvuFdBLzh5xl3gygIQoDnVB0zgX+ix16J8AjZXKpU5+82k3LS1DQocX7HRbo61U5PAehK1kkCya4mQnLLVlTlh7+PoganlDHQvR200rMSA/rkPxHrERtfAKXofbO7ylB4pCtlV+ejqfNERRGCGP22a35WMoQWHWKSTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mdNhlz9ee2At3vWD9/9dOjLTnENwnSEQLVZCu6rKRE=;
 b=PNR7C6u/9lJYJJpT6zRkyXvkMRs8R4An3kB9kvM7Ciqw5/hglnyr7h1dI7HG1Hf8mpo5S21dCw5jEKsw49DU8XHc2olMtVxpAAG58NEEkZ0EmNvowEh4pntPsKSq/6RDQslzDiGfI35lb6OOtqed2nIH6KBl4Wv2CQ2IxrCLrQKhUxYBJsM7IWU5/x6Vh2pNWJUj9Fwani3W/E3JE7AEGhRT+WpZsL2/tuHdeXitJV4U7yRv3gC91L07MRCeAtEy7XB5jZx2G4y7fMP1iKyDA4MoAifOEOo8meDgfXPurhTryCsdE3xLwZ1ZFNYi+LrIvIEpj6MipgumNl/rnbMeHQ==
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
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Thread-Index: AQHXtdAg2qzxZ1hIP02wGTFUbQtoPau8PLsAgAAGuICAAAXDAIAABCmA
Date: Thu, 30 Sep 2021 09:21:08 +0000
Message-ID: <91fca69f-1a6f-198d-be27-c6b0ddd62206@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-3-andr2000@gmail.com>
 <79fa6e5f-ace7-c46a-489a-2e1ba52e53da@suse.com>
 <7e179a48-3127-93e4-cdaa-e5be82cfe770@epam.com>
 <7d035651-6e16-a6cb-6760-e5d077e1a85c@suse.com>
In-Reply-To: <7d035651-6e16-a6cb-6760-e5d077e1a85c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f04f02f-371c-4a26-6971-08d983f3a300
x-ms-traffictypediagnostic: AM0PR03MB6243:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB624340A776EB110058C8EC0AE7AA9@AM0PR03MB6243.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z68vKnO0xOjx3CMYfFolhVw9qOovlNLV7pbyWgz5WY25uBcTgoAXIhvVhcpTY6L59uWREVMyGJiG2Znr1sf+Hgu3aoA7UuLZX/B/OvohsuESFjSwjfuTYuMhTc7HRuNK4kMl4VSk0d7vqqWj6gF8ntYzPi9IOAsYnkfC74kRE5h+LcqORwcATkQRkCqbtPDKy1x0Tbe1X3qJQVDeTxZ5ePamhwo1QCkKooRrZ5OQcuh6tkT/f9765aeKRNzRmxnzZ2s0lziwAEzqguoLfGKsmNMsbknX4ZtX+zpDQvLiSb5S6+ASd6CS2SR9Gy51UdsR0UXDCTPNgB0lnfcFBK4jsM/znsQXoweBP6B3v4XPB1ctSB3qyhYFih9V1fZkmPCNCe/o1aa9lp1UH9JBCsq5QpsWeCR/Rj8kk5OUkLg9j6jz/HbUFpF4dLGOGW/nz58HUYcqxZzm5lmEmVKgIn3/nmNvrZ0J6clpNJX7PBwKnYXEE7AHgJM6KbrSb9T6H2Ty5799LDtf7o++dDTbwJG7lg4KY5CQuBX+Z/IkVl5PCxBbbERv4uG7/CNp4J9DhH8aD04w/rMHfN5+8iOCLVmLW8SXTuzUBekvM9Wm+uY8rGWUpuGQFNHRzXOTrkGXI8oT/OwRIXWpmrI81+yM5OWK88J92AvZ7gmHSsdD8c3m+IhU29PUIv8Kdpgts8gKNqd7mn++hR4lVciyiR9cbaEcXJQmP4fwUNiDp78wXy8f9i0oq2BZtv2Pl5YkX2qIQJY9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(55236004)(83380400001)(54906003)(107886003)(508600001)(91956017)(8676002)(2616005)(26005)(2906002)(4326008)(53546011)(6506007)(76116006)(186003)(38070700005)(66446008)(66556008)(64756008)(31696002)(66946007)(6512007)(66476007)(122000001)(38100700002)(71200400001)(86362001)(6486002)(36756003)(31686004)(8936002)(6916009)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MXRQMWc2bmE3RDJmNTFXWTRwYmU3ajFibGJGMlA3NHlpMFpPSzNTWXlnZFB0?=
 =?utf-8?B?a2U4Z1gzMEJFenhvQU5vSEFFT0tKZUhQYWJmdTkzdGFBdVJqbTVZSWNsUzJU?=
 =?utf-8?B?QVpZL1FIZ05jT21Pb3JNM1oxU1oxSnlRUWw1aGxxaGF0NlJLTlE0WDk5YzUw?=
 =?utf-8?B?RFBoRE9wajNWWm13Rk83clFNOTFXQVYwd3QzVkZjRHFmS21GTy8vZlZKRGEx?=
 =?utf-8?B?LzN4ZkhPdlFNYk1ldWl1WjdtakVGQkVkUkJQeER1TWp6bzdFVkc5UnllaTJR?=
 =?utf-8?B?dFpwcHpoV3N3M2cvbGpNTTZjM1AwVFlRQWFNbXhKdFNFSHk4M2ZxNU1CUHdv?=
 =?utf-8?B?NFQ1ODd6WTRSM1BQZkJra3RQNUF3a2I0RWNlS3ZjTnlzcTNkSEtTMlFuL0RS?=
 =?utf-8?B?bU9SWWUyYTZvU0I0aWszTlNnbi9tWllEd0VpNnQ3cjdONy9KeExucmx4Sit5?=
 =?utf-8?B?eGMrcjZOSiszL0hQbnlIdFlpdFhXQjdRTTBrdXh0a084aG5oNk5LUmtubVJB?=
 =?utf-8?B?ck0rSXVkV2Jld3ZCaVJjSmduNVVKTEk2SFdoWDlxQ1hnQmF3OW5HLzM3cTNF?=
 =?utf-8?B?OWR5Y3J0SmdyWFNDbE05ZzBLdHVySVI2VUt4U2hmNlhPZlVRaWpWZDhTekph?=
 =?utf-8?B?NHQ0R2g2V3E4NXN1VDBFR1Jtck5HWXUyc3FmK0dteXc4ZitXNThXNFlYNW9V?=
 =?utf-8?B?WmhaT2ROUzdwT2paeVNMRU9DWHBVSVpBSlZhZU9ibVhLRC9UYjJXcUQ5ZXlD?=
 =?utf-8?B?Q3NqV3ZjeWp5czZCNW5KU1g3VTRXZmFGbzh0UlBiZ3JPTXQ1RXUrT3d4bUxk?=
 =?utf-8?B?bkcxVmVQUzFNeEtiNmZWR1k1SXFlUy9YN3JVYmdIWElGa0FQR29WSW9qcE1i?=
 =?utf-8?B?SFdKRWZRdXVCVmltY2hpQlo4SWs4RXY4U2pTenh1dnQvd0pqSTFhN2F5YlQ1?=
 =?utf-8?B?dlNseVJLaEpyTGJMS3JqQzNBRys3QlQ5TjBVRVlsWjVQY29vUjFnL3M3eGN2?=
 =?utf-8?B?NkhGZmxoNVQvMVZ6OW9NY0R4dkYzS2pIdWNpb3hyb2p2WXh5Njh5TXkyMEhR?=
 =?utf-8?B?c1NUUjgyVDErKzJybXcxZTZNZmdXbE1wTU1yQlFHOVlKVkpubFRsNW5PUXpn?=
 =?utf-8?B?TXpaUEZhaTR1T1hGS2REeFpqakp3RisvVzBlbVpQcU45T3VTeHgzYTU1M1JR?=
 =?utf-8?B?ZG5zcG5QengzUk8rWTBtNDl2UFJKZGZVZnNYejdGSnE2OU5RTUtRVE1mc1BK?=
 =?utf-8?B?NHEvbFhkM2J4S090c1UxUlNZK3pUVmpOZDQwR3VDRy9STVRDclVVaVpaM0dN?=
 =?utf-8?B?UlNKcE9iaWRybU5BVkNiUEJRd2k0KzZvcHlWL1FSc0xiZ2VxNjRMUnZIUk1L?=
 =?utf-8?B?dWFJUDNvTzFoMHovd1NZVXRHZGlLOXY0cjVqL2JhYzN3ckc0dWs1dFJIUWNt?=
 =?utf-8?B?RGczVWoyTENvWm9vVlJHU00wTEMzOW5pWC9NT2pRU2RrK2ZURzRibXBrdGlB?=
 =?utf-8?B?T2NSQUtKUzFpWXkyc1N4OHlkbU14MWZLcHpZQjc2andxR1FXdnlBS1lydjFM?=
 =?utf-8?B?QmtVRjNWRExic3JJY2Z6YkU0Ukp0NjBMT3g2S0VwdlNabEZuVTF3TGlhMG9x?=
 =?utf-8?B?TFY3Z3ltSGtNWE5OQlJNRThkbEdETEZuamtXRkxZQkZDd2dXVXVIMzBLNy9z?=
 =?utf-8?B?bnRNUXpFTFByTWZEdWZFUjZMK1ZaWnFJSVRhWHY3S25Ic09WTUxBK0IxQlI3?=
 =?utf-8?B?ZStYUDYweHF3aW9pTXFVUkN6U3l1SHdLNVFNS3dUeTRlTHgzYnJ6eDd5OEVB?=
 =?utf-8?B?K2EwdlE1S2VEVGFKVlAydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5E8C70EA105B0419C75BB6D7EA4662A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f04f02f-371c-4a26-6971-08d983f3a300
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 09:21:08.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goSWT4q7j5aBVL+4dPO2S05lR5e6NA2pL7MK5Xft/VLcl7hU6HVFcTOBGvzGSCvbpEwqNPySbd9hJXSlQA04XlgAJ6f/9Kgc2Tx+XAD+Y/VTKlg91zUQTWvzPG/lJiVv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6243
X-Proofpoint-GUID: MjhJtAp7tR-othFylupieeP_PNLorz_c
X-Proofpoint-ORIG-GUID: MjhJtAp7tR-othFylupieeP_PNLorz_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_03,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300057

DQoNCk9uIDMwLjA5LjIxIDEyOjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAxMDo0NSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAzMC4wOS4yMSAx
MToyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMzAuMDkuMjAyMSAwOTo1MiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEBAIC0xNDI5LDYgKzE0MzMsMTEgQEAgc3Rh
dGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywg
dTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4+PiAgICAgICAgICAgIHJjID0gaGQtPnBsYXRmb3JtX29w
cy0+YXNzaWduX2RldmljZShkLCBkZXZmbiwgcGNpX3RvX2RldihwZGV2KSwgZmxhZyk7DQo+Pj4+
ICAgICAgICB9DQo+Pj4+ICAgIA0KPj4+PiArICAgIGlmICggcmMgKQ0KPj4+PiArICAgICAgICBn
b3RvIGRvbmU7DQo+Pj4gICBGcm9tIGFsbCBJIGNhbiB0ZWxsIHRoaXMgaXMgZGVhZCBjb2RlLg0K
Pj4gQmVmb3JlIHRoZSBjaGFuZ2UgcmMgd2FzIHNldCBpbiB0aGUgbG9vcC4gQW5kIHRoZW4gd2Ug
ZmFsbCB0aHJvdWdoDQo+PiB0byB0aGUgImRvbmUiIGxhYmVsLiBJIGRvIGFncmVlIHRoYXQgdGhl
IHdheSB0aGlzIGNvZGUgaXMgZG9uZSB0aGUNCj4+IHZhbHVlIG9mIHRoYXQgcmMgd2lsbCBvbmx5
IHJlZmxlY3QgdGhlIGxhc3QgYXNzaWdubWVudCBkb25lIGluIHRoZSBsb29wLA0KPj4gYnV0IHdp
dGggbXkgY2hhbmdlIEkgZGlkbid0IHdhbnQgdG8gY2hhbmdlIHRoZSBleGlzdGluZyBiZWhhdmlv
ciwNCj4+IHRodXMgImlmICggcmMiDQo+IHJjIGlzIGFsd2F5cyAwIHVwb24gbG9vcCBleGl0LCBh
ZmFpY3Q6DQo+DQo+ICAgICAgZm9yICggOyBwZGV2LT5waGFudG9tX3N0cmlkZTsgcmMgPSAwICkN
Cj4NCj4gR3JhbnRlZCB0aGlzIGlzIHVudXN1YWwgYW5kIGhlbmNlIHBvc3NpYmx5IHVuZXhwZWN0
ZWQuDQpJIHdpbGwgcmVtb3ZlIHRoYXQgY2hlY2sgdGhlbi4gRG8gd2Ugd2FudCBhIGNvbW1lbnQg
YWJvdXQgcmMgPT0gMCwNCnNvIGl0IGlzIHNlZW4gd2h5IHRoZXJlIGlzIG5vIGNoZWNrIGZvciBy
Yz8NCj4NCj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gKysrIGIveGVu
L2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4gQEAgLTg2LDYgKzg2LDI5IEBAIGludCBfX2h3ZG9t
X2luaXQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICAgIA0K
Pj4+PiAgICAgICAgcmV0dXJuIHJjOw0KPj4+PiAgICB9DQo+Pj4+ICsNCj4+Pj4gKyNpZmRlZiBD
T05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBk
ZXZpY2UgaXMgYXNzaWduZWQgdG8gZ3Vlc3QuICovDQo+Pj4+ICtpbnQgdnBjaV9hc3NpZ25fZGV2
aWNlKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+Pj4+ICt7
DQo+Pj4+ICsgICAgLyogSXQgb25seSBtYWtlcyBzZW5zZSB0byBhc3NpZ24gZm9yIGh3ZG9tIG9y
IGd1ZXN0IGRvbWFpbi4gKi8NCj4+PiBDb3VsZCB5b3UgY2xhcmlmeSBmb3IgbWUgaW4gaG93IGZh
ciB0aGlzIGNvZGUgcGF0aCBpcyBpbmRlZWQgaW50ZW5kZWQNCj4+PiB0byBiZSB0YWtlbiBieSBo
d2RvbT8gQmVjYXVzZSBpZiBpdCBpcywgSSdkIGxpa2UgdG8gZnVydGhlciB1bmRlcnN0YW5kDQo+
Pj4gdGhlIGludGVyYWN0aW9uIHdpdGggc2V0dXBfaHdkb21fcGNpX2RldmljZXMoKS4NCj4+IHNl
dHVwX2h3ZG9tX3BjaV9kZXZpY2VzIGlzIG5vdCB1c2VkIG9uIEFybSBhcyB3ZSBkbyByZWx5IG9u
DQo+PiBEb20wIHRvIHBlcmZvcm0gUENJIGhvc3QgaW5pdGlhbGl6YXRpb24gYW5kIFBDSSBkZXZp
Y2UgZW51bWVyYXRpb24uDQo+Pg0KPj4gVGhpcyBpcyBiZWNhdXNlIG9mIHRoZSBmYWN0IHRoYXQg
b24gQXJtIGl0IGlzIG5vdCBhIHRyaXZpYWwgdGFzayB0bw0KPj4gaW5pdGlhbGl6ZSBhIFBDSSBo
b3N0IGJyaWRnZSBpbiBYZW4sIGUuZy4geW91IG5lZWQgdG8gcHJvcGVybHkgaW5pdGlhbGl6ZQ0K
Pj4gcG93ZXIgZG9tYWlucywgY2xvY2tzLCBxdWlya3MgZXRjLiBmb3IgZGlmZmVyZW50IFNvQ3Mu
DQo+PiBBbGwgdGhlc2UgbWFrZSB0aGUgdGFzayB0b28gY29tcGxleCBhbmQgaXQgd2FzIGRlY2lk
ZWQgdGhhdCBhdCB0aGUNCj4+IG1vbWVudCB3ZSBkbyBub3Qgd2FudCB0byBicmluZyBQQ0kgZGV2
aWNlIGRyaXZlcnMgaW4gWGVuIGZvciB0aGF0Lg0KPj4gSXQgd2FzIGFsc28gZGVjaWRlZCB0aGF0
IHdlIGV4cGVjdCBEb20wIHRvIHRha2UgY2FyZSBvZiBpbml0aWFsaXphdGlvbg0KPj4gYW5kIGVu
dW1lcmF0aW9uLg0KPj4gU29tZSBkYXksIHdoZW4gZmlybXdhcmUgY2FuIGRvIFBDSSBpbml0aWFs
aXphdGlvbiBmb3IgdXMgYW5kIHRoZW4gd2UNCj4+IGNhbiBlYXNpbHkgYWNjZXNzIEVDQU0sIHRo
aXMgd2lsbCBjaGFuZ2UuIFRoZW4gc2V0dXBfaHdkb21fcGNpX2RldmljZXMNCj4+IHdpbGwgYmUg
dXNlZCBvbiBBcm0gYXMgd2VsbC4NCj4+DQo+PiBUaHVzLCB3ZSBuZWVkIHRvIHRha2UgY2FyZSB0
aGF0IFhlbiBrbm93cyBhYm91dCB0aGUgZGlzY292ZXJlZA0KPj4gUENJIGRldmljZXMgdmlhIGFz
c2lnbl9kZXZpY2UgZXRjLg0KPiBGYWlyIGVub3VnaCwgYnV0IHNpbmNlIEkndmUgbm90IHNwb3R0
ZWQgYSBwYXRjaCBleHByZXNzaW5nIHRoaXMNCldlbGwsIGl0IGlzIGFsbCBpbiB0aGUgUkZDIGZv
ciBQQ0kgcGFzc3Rocm91Z2ggb24gQXJtIHdoaWNoIGlzIG1lbnRpb25lZA0KaW4gc2VyaWVzIGZy
b20gQXJtIGFuZCBFUEFNIChwYXJ0IDIpLiBJIGRpZG4ndCBtZW50aW9uIHRoZSBSRkMgaW4gdGhl
DQpjb3ZlciBsZXR0ZXIgZm9yIHRoaXMgc2VyaWVzIHRob3VnaC4NCj4gICAoYnkNCj4gYWRkaW5n
IHN1aXRhYmxlIGNvbmRpdGlvbmFscyksIG1heSBJIGFzayB0aGF0IHlvdSBkbyBzbyBpbiB5ZXQg
YW5vdGhlcg0KPiBwYXRjaCAodW5sZXNzIEkndmUgb3Zlcmxvb2tlZCB3aGVyZSB0aGlzIGdldHMg
ZG9uZSk/DQpDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBtb3JlIG9uIHdoaWNoIGNvbmRpdGlv
bmFscyB5b3UgYXJlDQp0YWxraW5nIGFib3V0IGhlcmU/IEknbSBhZnJhaWQgSSBkaWRuJ3QgdW5k
ZXJzdGFuZCB0aGlzIHBhcnQuDQo+DQo+Pj4+ICsgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQp
IHx8ICFoYXNfdnBjaShkKSApDQo+Pj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4+PiArDQo+Pj4+
ICsgICAgcmV0dXJuIDA7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gKy8qIE5vdGlmeSB2UENJIHRo
YXQgZGV2aWNlIGlzIGRlLWFzc2lnbmVkIGZyb20gZ3Vlc3QuICovDQo+Pj4+ICtpbnQgdnBjaV9k
ZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKmRl
dikNCj4+Pj4gK3sNCj4+Pj4gKyAgICAvKiBJdCBvbmx5IG1ha2VzIHNlbnNlIHRvIGRlLWFzc2ln
biBmcm9tIGh3ZG9tIG9yIGd1ZXN0IGRvbWFpbi4gKi8NCj4+Pj4gKyAgICBpZiAoIGlzX3N5c3Rl
bV9kb21haW4oZCkgfHwgIWhhc192cGNpKGQpICkNCj4+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+
Pj4+ICsNCj4+Pj4gKyAgICByZXR1cm4gMDsNCj4+Pj4gK30NCj4+Pj4gKyNlbmRpZiAvKiBDT05G
SUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCAqLw0KPj4+IEF0IHRoaXMgcG9pbnQgb2YgdGhlIHNl
cmllcyAjaWZkZWYgaXMgdGhlIGxlc3MgcHJlZmVyYWJsZSB2YXJpYW50IG9mDQo+Pj4gYXJyYW5n
aW5nIGZvciBkZWFkIGNvZGUgdG8gZ2V0IGNvbXBpbGVkIG91dC4NCj4+IFdoYXQgaXMgdGhhdCBv
dGhlciBwcmVmZXJhYmxlIHdheSB0aGVuPw0KPiAiaWYgKCAhSVNfRU5BQkxFRCgpICkiIGFzIEkg
ZGlkIGFscmVhZHkgcG9pbnQgb3V0IHRvIHlvdSB5ZXN0ZXJkYXkgaW4NCj4gcmVwbHkgdG8gdjIg
b2YgcGF0Y2ggMTAgb2YgdGhpcyB2ZXJ5IHNlcmllcy4NClBsZWFzZSBzZWUgYmVsb3cNCj4NCj4+
PiAgICBJIGV4cGVjdCBsYXRlciBwYXRjaGVzDQo+Pj4gd2lsbCBjaGFuZ2UgdGhhdD8NCj4+IE5v
LCBpdCBpcyBnb2luZyB0byBiZSB0aGlzIHdheSBhbGwgdGhlIHRpbWUNCj4gVGhlIHF1ZXN0aW9u
IHdhc24ndCB3aGV0aGVyIHlvdSBzd2l0Y2ggYXdheSBmcm9tIHRoZSAjaWZkZWYtcywgYnV0DQo+
IHdoZXRoZXIgbGF0ZXIgcGF0Y2hlcyBsZWF2ZSB0aGF0IGFzIHRoZSBvbmx5IGNob2ljZSAoYXZv
aWRpbmcgYnVpbGQNCj4gYnJlYWthZ2UpLg0KWWVzLCB0aGUgY29kZSBpcyBnb2luZyB0byBhbHdh
eXMgcmVtYWluIGlmZGVmJ2VkLCBzbyB3ZSBkb24ndCBoYXZlDQpkZWFkIGNvZGUgZm9yIHg4NiAo
YXQgbGVhc3QpLg0KU28sIGRvZXMgdGhlIGFib3ZlIG1lYW4gdGhhdCB5b3UgYXJlIG9rIHdpdGgg
IiNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVCINCmFuZCB0aGVyZSBpcyBubyBu
ZWVkIGZvciAiaWYgKCAhSVNfRU5BQkxFRCgpICkiPw0KPg0KPiBKYW4NCj4NCj4NClRoYW5rIHlv
dSwNCk9sZWtzYW5kcg==

