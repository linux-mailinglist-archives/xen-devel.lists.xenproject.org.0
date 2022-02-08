Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FE4AD675
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268225.462020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOdG-0005Es-Qc; Tue, 08 Feb 2022 11:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268225.462020; Tue, 08 Feb 2022 11:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOdG-0005Cu-Mx; Tue, 08 Feb 2022 11:26:02 +0000
Received: by outflank-mailman (input) for mailman id 268225;
 Tue, 08 Feb 2022 11:26:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHOdE-0005Cm-Vn
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:26:01 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e33a86f2-88d1-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 12:25:59 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218BJqLN004680;
 Tue, 8 Feb 2022 11:25:55 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3q5q84gd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 11:25:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by HE1PR0301MB2234.eurprd03.prod.outlook.com (2603:10a6:3:1e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 11:25:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 11:25:50 +0000
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
X-Inumbo-ID: e33a86f2-88d1-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKl/cP20iAKiVm42A8xu0LXkK5fJvBWNheTSkdIFtqOcwIBvBH7rpJFuqQcyYOVoFh97NeaIMXK7wXlka0I5L1r0DLDQWfIaFYkGeNbZvzajSsmyKGgwQU0WsBSW9FYrcxMcvdgGSTKoKjKr4W0JoNWbLwnEuSyMxEBTLB7JLSj6D+cLKDA2u5J01UWer4PrfYtCF6Awy80g1/4oIX4TU6GEO0nY9bWtaoTEimnse51pWnok0sQSWpsoVgTdCV5kRXOVm7KeDeyqtFRkzHI35DgLJnTjYfYAeQw+hKGOy0UMwccDZSTmkL122tzCFs/mgbyzeK+PguYcbv2hGEkiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCMVOrFUQqXNUOyiXSwWQO5UeehFDIHcUOil6SjR4g0=;
 b=CGgJUK1C3nuh7V5sTLlMsIpenWt6m3GGV2Nj/7mQQIdhLEkPvS/LZNxwUo2LoeTZJa3AgtoxBnxouf24NCKuMwXhgnrLkjABhuEodm20xDbQsRo56E+ivfvp3cHLb1KqVRqMD1xW7X08Q4JMSuk4iSog6xc2dqsef1UHJ6ob8Y7AktRRpW3HnZ/jhfSpU8euSqnhXBbJs2vbPlK1mQrBoNCACJa7u6SOF/oVnXcZAtvfdzvLJhnYJs5j8rUMDa5DcRV+A1IlVgILdJjak2bvWTbPd2wioeeySr763IFkj6Zee8xgEExBmU2F/mURILN0wc+1wpgv/cNTfDEe9OwZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCMVOrFUQqXNUOyiXSwWQO5UeehFDIHcUOil6SjR4g0=;
 b=MJZ6MR67S4060AxhGNUZDeNeu0bXNB3ZUhm4Q37VnwOGQQ0o+gezV37Qg697kl9quIxSQHt8GpK1EjBlPcxK2SpYaHsqxZDiEEF8Wb/Q3bA0+dtVm/dsxSmSsu6GhBeiM2/h0uD1JGpELXQ9lCUjyrMcCl+7dBDSHa5di38xCkaYpuoPWaiOLRIxW+wBx6ERGe1XITYDRROxmEhWx3czQOic8WBHZXyxGC594y1rRT24Olhg08ta9b0LNlrR8M/9s6uu8GtUXq6KRi9E2rbMM8055X21HpoCs7fcboWjmWBITYr76U8PF3U0q9xwnZfagZ3r2YPPenXt97wPdeWJEA==
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
 AQHYGZFdYv4W1RdbQkeQtzN+PyKqmqyITGQAgAENNICAAAt2AIAAA+uAgAAEsACAAAMyAIAABAgAgAADmACAAAHqgIAABl2AgAACJ4CAAAczgA==
Date: Tue, 8 Feb 2022 11:25:50 +0000
Message-ID: <a0015951-6eff-38a8-a9f0-bdbc8bd51940@epam.com>
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
In-Reply-To: <cf584e13-f257-9355-50fa-c35e8fc8cf5e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7f34a40-658d-443f-cddd-08d9eaf5c2b9
x-ms-traffictypediagnostic: HE1PR0301MB2234:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <HE1PR0301MB2234C067DE47F6AE9CAA28F3E72D9@HE1PR0301MB2234.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GKoiuyhGmNUs7R4QghPyUakexakKx8I1YkEZJMhBOuK5nR6YrjVjZ6ov1/BIJM44wq3voP1WW1mfA8GHkoocT66ttyofXwIh6p+JGnMalHp1Wcdx5t8/SvWmB7uSgl2jRjOy9wmpBO9gxX5dl6LxBwLjZkR5my+ifVdV5/fquOe7803SBllKh4Y7gXxQtEtoW+2QVgtPvrq4mxyDDv+LYGWfXFarv2Pgz+BBvBDCx9i2pNSbPOgD6ul7zD0CR8Ckd+xZEzBtkBXcdtrA/++pFdT6A2mzUpZGyA+qv37AepCPvN8j1FVdlrZ1TNqfTdBL8bmg7Znt8r6mPf6opXaZKUFoKhIPZQtJBbuXlwB34VYfrHnRUbc/4cLlJuOANZ9EIBrSpcMagwvBbvdMbGX713REpaIprV80xDpEuci2t2pwQDsBCUzJNpLWH9JKYKcCsU3IL6DSKGTplIdc5c4F2c/XL8etaSXWbI3PjJ79AP8qGAq16v8cNd5ClayfsfArzos5zLSE9wuPJEv5vdK2Y1zuHgIYRBs/8gJ33bmqcDkNpDbmnWvJ066nJRRV1Eolhk3NYmGCfS6hu0kBd1b8oGPNk9VhEZ37g1+e+/sxHjF3szXzj7fi31/nVA3VEHCyA9MJMzzTZVhp6h/RR0YK/FV92IOORE2pPtGFFAsfZhxmGgo/pQEk6ZpcDbvv6rcH9K687PdUbtm6kRXRw+TBEmAjZmUZzkfcTKynL3rtoGFAnTxte5MKv4f3FOcPARcw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(107886003)(2616005)(316002)(55236004)(2906002)(31696002)(36756003)(31686004)(122000001)(86362001)(38100700002)(53546011)(7416002)(64756008)(76116006)(6916009)(508600001)(5660300002)(6486002)(4326008)(66556008)(91956017)(66476007)(8936002)(186003)(26005)(38070700005)(83380400001)(71200400001)(66446008)(54906003)(6512007)(66946007)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ejRENlhJUkhGSDFVaXNLR3A5YXFEVXlxTzUzc1gydm03NFhrU1EyNlF4UUVu?=
 =?utf-8?B?dDZ3TWRBUXordnFZb1RaWm1Ld2hKL3hDUWhyK1ZTMjQ3SmRTMis3d0N5amda?=
 =?utf-8?B?SnNpMzE5cVJ1Sk91dDdTWWNaL0N0RDZ5ZHV6c2hsQ24wVXpwWFdEOXRKKzNS?=
 =?utf-8?B?Rzc0Zm90WUt4UDkyaWtzdFdSRW5sT3VLZ2hPeFRqT2FJV0ZCVFJESXpBVUkz?=
 =?utf-8?B?Qk0rcjFVYktxM1pNdktSUHlXMERPRC9WTTdtUzZSdi83WmhtZlBjSk5FU0pH?=
 =?utf-8?B?OUk3NTBVT1hGU1RJQ0FZMDdUYyt2U3FHYld5OUowVDFQeHVhTThIZ2NzWVhT?=
 =?utf-8?B?WDF4NUVTakhUUGRuUXRQanZQVndNbnBOUElqdWpJL0EwbUtFN0dyM2lOT2dR?=
 =?utf-8?B?azZtYVErS3FNODNLVXdqbmxJU0U4c1RKV1BMcHFXZStvdEt2QXRGQnJuMkpq?=
 =?utf-8?B?dnZvUTlTNklyRGZqK1QweVZHWFBsOGhuSXRaYjFxVmlJQXJLSk1CdlVpZ3NB?=
 =?utf-8?B?Zk5xckJwSmlxQ2tTVEZjNEZTbmsvVUovaDFxWDEzK1NtSzZWaThMZlNoaHlr?=
 =?utf-8?B?QVhITit2VEJLMThLRWdtL01FV3Q1QUs4MDhJK2hqenZMZzdXVStBMk0wbWF1?=
 =?utf-8?B?a3ZlZG5wZnF0dFV2UjVDQmNMUjNHQ2JyT3g0UDRuajV5QzFscGlFMnZobkVB?=
 =?utf-8?B?NEdNc1RUYjhPVUQ4K0Q3RVlaVjU4ZTlTbEFHU09yODBPTVppaVlUUit1bXBn?=
 =?utf-8?B?aFFVbEgxZmhOSkhpZ2JsNTZESWV2elFqZEthT2VQMDVvNVpJRkpQRDJSRWVv?=
 =?utf-8?B?czhlU2k1NHhlSStRenNGMnc4NGM2c29oZi9EYVZkamhvNzExRWNaZi9tRm5E?=
 =?utf-8?B?RmFiVnFhTFlyMmtjdXFuKzlPL1lYQ2xVS1MxbWxBSzNiSldwLzNJVWorWHJo?=
 =?utf-8?B?TWN1c3VveDBHa0w4cTl6aGVWbnNmc3BNTDAwWFArS1BkN3RVZzBRRUhxY25h?=
 =?utf-8?B?UEd0dW04TEQ3VjFPbjBvTDhaOHo4c25LL2lRMDJ4RnZvNVUzTXBIeCtCeGU1?=
 =?utf-8?B?V3VFRE9nb2cxdS9CTXR2QkxQb0Y2RnNnT3JFMFA4eFJxTVpheXR6UnVCUVFN?=
 =?utf-8?B?TnViTG1vUHVPdWhCZHNuY3pqTlNGcU9sYmZBRUwxUEdaZGN4dmV3bnBYK0VT?=
 =?utf-8?B?dWlTWnpwV2NGc0VOSDk1QzBLd3lycUFUY3FVeHpMRDBwNXlBcHU3ZFVXQzhK?=
 =?utf-8?B?M2JFZzltU0JiR2l3SDRvNGM4ZFo5L2wrOUJkUnJpZFVJN0ZrNjlGazZWWWVP?=
 =?utf-8?B?ZU9MVFFsc1VUMS9NNWNFTE5nTGlJTnhYV0kxc0FjSzF0T21RREwwVm9lWEdu?=
 =?utf-8?B?OFF0UnV3SEZlZkNZdHlTTzc0emhHYW5DVDlWQUhwUjBiamxvWTd4L0JucnQ5?=
 =?utf-8?B?cDBtbE1ERzBnOE1JMHNxenFLNVY2aDFxdkNQc1VQdkJzNlhkb0pMLytkZ2tD?=
 =?utf-8?B?RlBYREw1RXBvc1VBL3g1QnRTYUlOckNuM244Z212aDhySHRkQWdzNHBSTnVL?=
 =?utf-8?B?U2h6cTV2TXFMeVVLNTJYTm1uL1FxNmtaRTZZMjEzLy9sUGlUQ1FuWGczSlN1?=
 =?utf-8?B?aTdxRlV0NWNocXkzWitKajBjYlhrcjhkb2loemxzSnZQbVlEb0NxSHdQRTRm?=
 =?utf-8?B?T0JwWDdrM3MwbXZRVW80RGJ3OWxXVWVkQnRXaEF0ZTdEby9JT0lIandjQmZo?=
 =?utf-8?B?NW5kQmZvNkp6NHBjdW5Mb1V3aHN0Q1Y4bFE2S0ttNnhGbHRDZ1RaS0UzL2RY?=
 =?utf-8?B?MVBqamoyQ1FnRkdtM01sZitqRHJBN1RzVndKUktLcVFMOTRvazdPUmtBbEFj?=
 =?utf-8?B?SWxubjh4bHhIV1pvbHZCYlJtM0k3SkloS3FUTWtNdE1sUGRPcDJRNmJMR3Vx?=
 =?utf-8?B?NkV0OHc0aWpLaVFVc09BRis1ZUlMOXZRaWsrSUFYU3ZleWhUUThMb3RDNnNs?=
 =?utf-8?B?WFpYcHZyN25NU2wrRHZDQzA5dndISERYazR0QjlUVW1FYTRUTFZIRkNXMnZG?=
 =?utf-8?B?U0J3SHExSXdtZWs4ajhNbkNuRzhWckRtUUkwZnJNSGVtc09IWm5VVGF4dWZp?=
 =?utf-8?B?Z0Q3T1BXK0Z5Rk8rV0gzVjZKTzBKOTMxZXI3SDRKa0xjYXN3RE1TVUNhYm5O?=
 =?utf-8?B?enJjNDE3Sm1OTmlnL1RocDJuUVdYcXQycER2azBlcWJoak8ydG5IbzFGa1Ux?=
 =?utf-8?B?ZlVJd1FCVlRCS0RzRXFWbWhPUGZIYi9lLy9VMVhsbDNkWktZZ0w3bmVqNVRY?=
 =?utf-8?B?S3JMeXo3R3BYOVFxaFVIaGQxVUo2Q0hOVTBBUk1MRmlkZlVuaVZMOTR0K1k3?=
 =?utf-8?Q?lwXcIKZDbQSIlw6k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6F31CA4A0898F4B82AF6BE81840C596@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f34a40-658d-443f-cddd-08d9eaf5c2b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 11:25:50.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GMVqIFEmyF8cRFgTxrGOiAw6Rdf37JN/5WHznw7Mo7tiTRcWrYQXJ17KpzmWIYLZVzUYPcUeenBhrywklaS0Ya/TdwFAdT4Om5s091HXOUs1U172Ib3zHeibSGYM2lLD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2234
X-Proofpoint-GUID: BXkYBc2v5-4zl6HnMx27BQSLjy3ZAeTG
X-Proofpoint-ORIG-GUID: BXkYBc2v5-4zl6HnMx27BQSLjy3ZAeTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_03,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080068

DQoNCk9uIDA4LjAyLjIyIDEzOjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAxMTo1MiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBUaGlzIHNtZWxscyBs
aWtlIHdlIGZpcnN0IG5lZWQgdG8gZml4IHRoZSBleGlzdGluZyBjb2RlLCBzbw0KPj4gcGRldi0+
ZG9tYWluIGlzIG5vdCBhc3NpZ25lZCBieSBzcGVjaWZpYyBJT01NVSBpbXBsZW1lbnRhdGlvbnMs
DQo+PiBidXQgaW5zdGVhZCBjb250cm9sbGVkIGJ5IHRoZSBjb2RlIHdoaWNoIHJlbGllcyBvbiB0
aGF0LCBhc3NpZ25fZGV2aWNlLg0KPiBGZWVsIGZyZWUgdG8gY29tZSB1cCB3aXRoIHByb3Bvc2Fs
cyBob3cgdG8gY2xlYW5seSBkbyBzby4gTW92aW5nIHRoZQ0KPiBhc3NpZ25tZW50IHRvIHBkZXYt
PmRvbWFpbiBtYXkgZXZlbiBiZSBwb3NzaWJsZSBub3csIGJ1dCBpZiB5b3UgZ28NCj4gYmFjayB5
b3UgbWF5IGZpbmQgdGhhdCB0aGUgY29kZSB3YXMgcXVpdGUgZGlmZmVyZW50IGVhcmxpZXIgb24u
DQpJIGRvIHVuZGVyc3RhbmQgdGhhdCBhcyB0aGUgY29kZSBldm9sdmVzIG5ldyB1c2UgY2FzZXMg
YnJpbmcNCm5ldyBpc3N1ZXMuDQo+DQo+PiBJIGNhbiBoYXZlIHNvbWV0aGluZyBsaWtlOg0KPj4N
Cj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiBpbmRleCA4ODgzNmFhYjZiYWYuLmNjNzc5MDcwOWE1
MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiArKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gQEAgLTE0NzUsNiArMTQ3NSw3IEBA
IHN0YXRpYyBpbnQgZGV2aWNlX2Fzc2lnbmVkKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQo+
PiAgIMKgc3RhdGljIGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcs
IHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQ0KPj4gICDCoHsNCj4+ICAgwqDCoMKgwqAgY29u
c3Qgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7DQo+PiArwqDCoMKgIHN0
cnVjdCBkb21haW4gKm9sZF9vd25lcjsNCj4+ICAgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBk
ZXY7DQo+PiAgIMKgwqDCoMKgIGludCByYyA9IDA7DQo+Pg0KPj4gQEAgLTE0OTAsNiArMTQ5MSw5
IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1
OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykNCj4+ICAgwqDCoMKgwqAgQVNTRVJUKHBkZXYgJiYg
KHBkZXYtPmRvbWFpbiA9PSBoYXJkd2FyZV9kb21haW4gfHwNCj4+ICAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZGV2LT5kb21haW4gPT0gZG9tX2lvKSk7DQo+Pg0K
Pj4gK8KgwqDCoCAvKiBXZSBuZWVkIHRvIHJlc3RvcmUgdGhlIG9sZCBvd25lciBpbiBjYXNlIG9m
IGFuIGVycm9yLiAqLw0KPj4gK8KgwqDCoCBvbGRfb3duZXIgPSBwZGV2LT5kb21haW47DQo+PiAr
DQo+PiAgIMKgwqDCoMKgIHZwY2lfZGVhc3NpZ25fZGV2aWNlKHBkZXYtPmRvbWFpbiwgcGRldik7
DQo+Pg0KPj4gICDCoMKgwqDCoCByYyA9IHBkZXZfbXNpeF9hc3NpZ24oZCwgcGRldik7DQo+PiBA
QCAtMTUxNSw4ICsxNTE5LDEyIEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9t
YWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykNCj4+DQo+PiAgIMKg
IGRvbmU6DQo+PiAgIMKgwqDCoMKgIGlmICggcmMgKQ0KPj4gK8KgwqDCoCB7DQo+PiAgIMKgwqDC
oMKgwqDCoMKgwqAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcgIiVwZDogYXNzaWduICglcHApIGZh
aWxlZCAoJWQpXG4iLA0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZCwgJlBD
SV9TQkRGMyhzZWcsIGJ1cywgZGV2Zm4pLCByYyk7DQo+PiArwqDCoMKgwqDCoMKgwqAgLyogV2Ug
ZmFpbGVkIHRvIGFzc2lnbiwgc28gcmVzdG9yZSB0aGUgcHJldmlvdXMgb3duZXIuICovDQo+PiAr
wqDCoMKgwqDCoMKgwqAgcGRldi0+ZG9tYWluID0gb2xkX293bmVyOw0KPj4gK8KgwqDCoCB9DQo+
PiAgIMKgwqDCoMKgIC8qIFRoZSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZG9tX2lvIHNvIG1hcmsg
aXQgYXMgcXVhcmFudGluZWQgKi8NCj4+ICAgwqDCoMKgwqAgZWxzZSBpZiAoIGQgPT0gZG9tX2lv
ICkNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCBwZGV2LT5xdWFyYW50aW5lID0gdHJ1ZTsNCj4+DQo+
PiBCdXQgSSBkbyBub3QgdGhpbmsgdGhpcyBiZWxvbmdzIHRvIHRoaXMgcGF0Y2gNCj4gSW5kZWVk
LiBQbHVzIEknbSBzdXJlIHlvdSB1bmRlcnN0YW5kIHRoYXQgaXQncyBub3QgdGhhdCBzaW1wbGUu
IEFzc2lnbmluZw0KPiB0byBwZGV2LT5kb21haW4gaXMgb25seSB0aGUgbGFzdCBzdGVwIG9mIGFz
c2lnbm1lbnQuIFJlc3RvcmluZyB0aGUgb3JpZ2luYWwNCj4gb3duZXIgd291bGQgZW50YWlsIHB1
dHRpbmcgaW4gcGxhY2UgdGhlIG9yaWdpbmFsIElPTU1VIHRhYmxlIGVudHJpZXMgYXMNCj4gd2Vs
bCwgd2hpY2ggaW4gdHVybiBjYW4gZmFpbC4gSGVuY2Ugd2h5IHlvdSdsbCBmaW5kIGEgbnVtYmVy
IG9mIHVzZXMgb2YNCj4gZG9tYWluX2NyYXNoKCkgaW4gcGxhY2VzIHdoZXJlIHJvbGxpbmcgYmFj
ayBpcyBmYXIgZnJvbSBlYXN5Lg0KU28sIHdoeSBkb24ndCB3ZSBqdXN0IHJlbHkgb24gdGhlIHRv
b2xzdGFjayB0byBkbyB0aGUgcm9sbCBiYWNrIHRoZW4/DQpUaGlzIHdheSB3ZSB3b24ndCBhZGQg
bmV3IGRvbWFpbl9jcmFzaCgpIGNhbGxzLg0KSSBkbyB1bmRlcnN0YW5kIHRob3VnaCB0aGF0IHdl
IG1heSBsaXZlIFhlbiBpbiBhIHdyb25nIHN0YXRlIHRob3VnaC4NClNvLCBkbyB5b3UgdGhpbmsg
aXQgaXMgcG9zc2libGUgaWYgd2UganVzdCBjYWxsIGRlYXNzaWduX2RldmljZSBmcm9tDQphc3Np
Z25fZGV2aWNlIG9uIHRoZSBlcnJvciBwYXRoPyBUaGlzIGlzIGp1c3QgbGlrZSBJIGRvIGluIHZw
Y2lfYXNzaWduX2RldmljZToNCkkgY2FsbCB2cGNpX2RlYXNzaWduX2RldmljZSBpZiB0aGUgZm9y
bWVyIGZhaWxzLg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

