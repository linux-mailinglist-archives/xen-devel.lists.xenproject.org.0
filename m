Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167EF4394CB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 13:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215746.375110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mey5x-0005Pc-L7; Mon, 25 Oct 2021 11:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215746.375110; Mon, 25 Oct 2021 11:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mey5x-0005MJ-Hm; Mon, 25 Oct 2021 11:24:49 +0000
Received: by outflank-mailman (input) for mailman id 215746;
 Mon, 25 Oct 2021 11:24:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1v/+=PN=epam.com=prvs=0932af52eb=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mey5w-0005MD-CW
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 11:24:48 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3beafa70-963a-47b2-a16e-d18df76c5852;
 Mon, 25 Oct 2021 11:24:46 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PAVQAd003358; 
 Mon, 25 Oct 2021 11:24:43 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bwrnq8tas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 11:24:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3876.eurprd03.prod.outlook.com (2603:10a6:208:73::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 11:24:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 11:24:39 +0000
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
X-Inumbo-ID: 3beafa70-963a-47b2-a16e-d18df76c5852
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL6RFZYShmXXOAcNYGtygEqasjp9QiegZRnLhTsrt+w4ODwSqw+avu2ScfZ2O6Bom51/pG79zcTOI3rDGMrMmN+0+583fzTlAIMKntXeulyIGl/pNgCtkOFF2T6q3OSEpwFw9aaXieYE6APXLFoFIeZ0NhpqnlI9sWc7wXPd8fjQAa8LN7trW/r0Ep90B3pWqMKPXb8uHJmhEYqC9YncLSY9pBpKbuN3u7JB/a//G2WCldkIkTfVkVGgxYGKrGw8h/QSsQxdjPkO7uwap2yZ2YgvxEoZ4i1txhioX1U/Ow/mJKLsfIyXb7JDRvMJbIQV27hHssipk24jD1KKqZiG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/484hsSJzkabnWquya02X52W61kZ2EZqFyBuKAlHgg=;
 b=cYQLmW4NxkkcW3humPx2pfd3OjajeQtEwMuDAfalKr5IjxqIr+YVJbTEe1L1bbwwickfDRpZzSGxbrbIaQ/M2hTMTLrWXgoci7lPPkVusxWbOL+nygdLksZCA6kNx81V8yJFBiEBXoSGrfrCV9pVqpvSwXknhD2PNYEre27BG+RauO2pHPRxZaeHib1Acbdml6SOL0DfF+C0l4nxm707yRY3yXmY70QRd9Smx0NA1wlptME0N3wdBRl3ZJGouybrWRPAn5vN4WCpqhs9P0BxDh29sqnf8M0JeSWoj3bUlYkHcqK0G0ASDCiy1nIpBdgx+x8AxwK+A6jA5LWYk6s72A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/484hsSJzkabnWquya02X52W61kZ2EZqFyBuKAlHgg=;
 b=ZADLsEwj5wnwHS5/ow67t+LsjJS8JT95iwEg/9QEaEMHHyqICGwgz9BLQiDG5PCdQJL6/4Di5Axwcvjbks8E9IPSKs7PG813UZ6w2oC0odIny5evrMQ3m5CGboCXgeuB4fPjjGvQGijR+ecd498DRESzgVtNU887LVVN7f5pbQIYNBmbUB5BTSGI6vyotooAT/Lkq5+syJZuvRYTFUDJHarfwxks1ZPcUgfAxDSapYOIFonpOJU+zYpaaSWctv6FTjrzbSaBNzW14PtScnFhjZIPq0jFokWIun5/92Kr8WjIgxXr2r/j6nPYmoFb3mjJGNtRqdvBSLQoACXBUiY8AA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 10/10] xen/arm: Process pending vPCI map/unmap
 operations
Thread-Topic: [PATCH v5 10/10] xen/arm: Process pending vPCI map/unmap
 operations
Thread-Index: AQHXvAkoZ3HMvjAU2km1yAXW+0PZkavRFnIAgBKXRgA=
Date: Mon, 25 Oct 2021 11:24:39 +0000
Message-ID: <e60a64b8-7e96-6e27-8c48-d8417a020358@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-11-andr2000@gmail.com>
 <35cd8909-1d9b-842f-62e6-7544dcd3da4b@xen.org>
In-Reply-To: <35cd8909-1d9b-842f-62e6-7544dcd3da4b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ec35195-72b4-4135-3369-08d997aa08a1
x-ms-traffictypediagnostic: AM0PR03MB3876:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB3876B3E7E8FB2FB5F32DACDBE7839@AM0PR03MB3876.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RQuDAn3OcN/5JJ5E7vONYHO6x7IQyd/+NvhNmq+fVZnw/RrlaIVWZ8HvHrWvZLKRIsygDoIJOBLvgC1/f2gCvfrPpShOuyopW5lgOkwogOiyibyGYy9pZfPbFCYLxU2b+RG5BdyPhg3Lsns11sGTpgKr0iFTiaoaRMEqR9aSy8mjlxjZuyhQFIG0PTpxpQtTfZifChMZS4jIKDV6Vfcx97yv+ceTGoIxBmJXyWcdARsm0+nyft6fZop/LTtTM6NcgSrF2bNnKy2nrX3D/BuQFgzyOg2KmIB/ln6FlRUeswhP2LLCeWYA2UeMf9U3stnc9HvsAAVu+OfYfUMrW6iU7ymS0ez6WBDwhokDtjBDacw48+1NK2Eyo5BwsJ+rthlzDl1zwdy2EFT6OqGclJo99awNVWFSEBi6oULcTm1vksZpqaMfPYQp7QeVtV5aDqnYeUStFlSfacmpXucvB33LOBrRCr/dtqhQuOnS+j219poSl40an4ULfJyhRI8vVOcLtCWrNAZV3N3WDz0rZWlGxLV866jn3hkI87NId+dOzrxmTh3gMCkrocKRv0ggwzwj14tF45S7VRZoGXeMa0SZ9aVedWZcUgMe3A1TW2J+hm3izbjcAtC/75fYcUEzomgXqjp+EItWQI1pfGHjYRQWWpO5ZZRSN1MMZ9DpZ8dm0mLDTPHj+VloWyZ7n14UU3W0SxC97r73MSwTP8oEPv4OfqgdoPVg4VfogzHAwcOM/TYXvPbX9MoQ2cAZglDBBmRv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(4326008)(26005)(53546011)(6506007)(8676002)(83380400001)(6486002)(186003)(31696002)(107886003)(122000001)(38100700002)(2616005)(31686004)(71200400001)(91956017)(316002)(66476007)(66556008)(64756008)(66446008)(36756003)(86362001)(76116006)(7416002)(66946007)(2906002)(54906003)(110136005)(508600001)(5660300002)(38070700005)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZnVWbVMzZFFmeVdHeWlaM080RHgvZlNuMFhpMXJiaVJCS0xselQ2aFV6dzRa?=
 =?utf-8?B?YVE0bHplVGpDbnVvbVNCU2NpcHN6NmhucTkyaEs4M2FqOTlNZ0tRRThwdEtk?=
 =?utf-8?B?T0ZlWjNFc1RoMzFWdmdnSWF1RmdSV2pBTG5YcnNYaCt6Vzl5TWsvbzR1L08x?=
 =?utf-8?B?dTBvemlPVVI3c1JuT3o3NmI0d2RKajcyMFJNZzNHT2tWbWxvOGlFQzYvV29U?=
 =?utf-8?B?OENmTnNGQXdScU5qZXlTKzB6OUhPWStmK25HRlc0aStCNWJOcEpyMFFvQUVQ?=
 =?utf-8?B?OG01TVhTTWhYV3g2UHkzYXJ2Uy9NZTh3ejJTTU0vamtmamxsKzgzbWVTV0Fw?=
 =?utf-8?B?ZXUydFBPZkVOaXc1dmVqbzNpaU8vUkFqM0hQb1BpRU5pL213VDZ3cE83NTJS?=
 =?utf-8?B?d2E1R3JqYmdwRExpNHdQWEVQYTFPZi9HSXhnNlhRSmpvdEdqaFZoMmpTNGlw?=
 =?utf-8?B?dU5mUDFQUlplWWUxV2NwK01jVllzcWdaUWVBYmc4WWlsZVY4UHp1Z1NCU0wx?=
 =?utf-8?B?dWpXczlNNjM3NWRMczc4MVJycTlBVUNRWWxUMVdob2pNRVZvNXV5YWRqb244?=
 =?utf-8?B?U0NIR0JPcExqSXJseGI4cG5GU1JvbEE4a2VtM3AyN1lHMFJQdjlQSVFvcmRR?=
 =?utf-8?B?T0FqMXJLY2h4bUt4N1lyUzg1M25ER2RUcTZDNXdRbTlrWTFOak16TmNEMUhr?=
 =?utf-8?B?NHlsYnpjVkRzSkR5cnZwczRKT1EwV1JRVUZrWnRZOTd3SUdHMFdMdkQwMnJu?=
 =?utf-8?B?bngyQlZGekdVcVFZU1pXMjMvdzRZK1lxSytyakRETDJWZ2JaSDVKTFAwR1dV?=
 =?utf-8?B?QU1uK1dHUjNIUU1SUWxXMytwLzc3eXU4aU5yS2s3bzBROW9xUnFCbDJNRzZv?=
 =?utf-8?B?eitwaHZ3NUFKM1ppNEk3cTlMcEZ5YXlVQ1BEbEJML3RxenE1L2RLVlo0WURO?=
 =?utf-8?B?YVJ2OCsvM09aWE5YSnZRQjl6ZTJjUGdWRHF3YTNnakV2MGI5Y0F4aGo3TmNT?=
 =?utf-8?B?Y3B5dkxsUnJ2cVFsK2k5YTN6ZWluakR2RHNST1UwN0RwQUw4K2NRRXZvajhh?=
 =?utf-8?B?eVJYVmpteVRDQmpMOUc4dGpOTDF6ZDE1dVZiMTgzY2l5YWx3amo2d2VEVFMv?=
 =?utf-8?B?dTg2R0RUeWV1ZUxmTi9YR3ZuZWQyZWUzSmtUc2k1bElLMTUyV0FhQTVuZVVB?=
 =?utf-8?B?STBhdGV2bHprOTMrQ1dGeXpuMk5pWWN6MVhQTVNlRjNjaStLVjFUYUpLbWlF?=
 =?utf-8?B?d1dQM1RCcytYM2V4VUtCZ2d2eFB1cDBNRS83NzQzUHJvOXZBZjFvRkU2NWJB?=
 =?utf-8?B?QjFSeUIxWTlSUVZKejBFVWxORTNCN016NHNFaUlFN1VXVzdBK0VjOXpCbFZ4?=
 =?utf-8?B?ZjRybytVcUh0Umd1Q1BFTGhQekhTUFIxN0t0Q1FvTEtYVUpjL1lhd0wzUnkz?=
 =?utf-8?B?T0o2NllFTWoxczRqVVhJSjNjaDIxK0pSSUVmVWUrWHNWTGNRd3FzUWdKNTR2?=
 =?utf-8?B?SG5lRjA0QkZ3aUsvT0hYVUgyQXlsb29kekRmYWpHcHlERGMzd0xvdmJhVUNt?=
 =?utf-8?B?aHFyM2FKQkFBU0Y2dFEzblFKWmVWUyt6SFZ3WDNxNXZ4aFZUM3F1UStmZTBm?=
 =?utf-8?B?ZEY4NWRqYm1WRVo5MWwrbkdKRVlyejdHcGFHQTkxTEkwdzlDTXo4dWRJM3Ur?=
 =?utf-8?B?RFRuUHN4MVRwbVExYVRpNUFSUlBOTGh1ZTFudlRxeUpzRVN5WHlsanBWRlZD?=
 =?utf-8?B?N2NPdGlWWUp1RGRpYkZxZHZVclZ1cXIyeXFiWkh0THljMUlCbUxIUHFsOTNY?=
 =?utf-8?B?OTJJWXovdi9lVjV0RzJjU1BKTUpCOWlENTBYUjVzNElyTkFhSzdHeEoyZzl2?=
 =?utf-8?B?Qm5sZlJ5d29RcDhDMGRPV3RjZnIwZlRITGUrSTJ2bEYxUnBSZ280TlQ3NXlV?=
 =?utf-8?B?T1ZHU1ZGK1dGdlBtQmt1SkwwRUt2MjNjUHdSUWtnaUNKRGJ5SWtJYncxRk5F?=
 =?utf-8?B?d1hsdFdaUzA1MWRxbW4ySkh2bVU2TU5GU2F2QkM1MGVOWlBMTXlYcjc0dTVt?=
 =?utf-8?B?NEhNaXVFVnRrOFZZY25LUjdsWXArak1RVkJQaC9TZ0QvQTNwN1BsZDN1VVVv?=
 =?utf-8?B?VU5INjdwbEpUUWZadnorZG05SDBJS3JaZ21oU1MreGMxbSsxUUdKeE9CbkJz?=
 =?utf-8?B?YnJqdjF2ZmZLWmNWTDRsWnBRdEtqdTlMY2ViMGJTeGFLMGpJa0dTZ0NuUmtr?=
 =?utf-8?B?MXZKY001c2FJanpLMjlKOVJqdmpIMHg0bVJsMmMwY1VGVzhnTmtRb25WMnlv?=
 =?utf-8?B?NzJBSEFyY2E5MTRLZG8wNlhyUnYxUUE3QncxVnRoK3JtZ2VNR1VCUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A4DAC0981E0604E8F7AB0CBD7DC6AFD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec35195-72b4-4135-3369-08d997aa08a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 11:24:39.3487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3aR8SiK1EIJMmXf1kkbFPjjn1TnfqFGPPw/la0NFb6MvCYk1+wq8Fh4JbWzjVv4fKsaYROGKFVOMLwIkjS79BHreBNhLwM5XuFJoFo8Am4GXE2hfHY6xysPiCoQHoDuZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3876
X-Proofpoint-ORIG-GUID: fJsGHX9QufkQjXaQ4-EixEfO0G4zXUsZ
X-Proofpoint-GUID: fJsGHX9QufkQjXaQ4-EixEfO0G4zXUsZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_04,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250070

SGksIEp1bGllbiENCg0KT24gMTMuMTAuMjEgMTg6MzAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwOC8xMC8yMDIxIDA2OjU1LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiB2UENJIG1heSBtYXAgYW5kIHVubWFw
IFBDSSBkZXZpY2UgbWVtb3J5IChCQVJzKSBiZWluZyBwYXNzZWQgdGhyb3VnaCB3aGljaA0KPj4g
bWF5IHRha2UgYSBsb3Qgb2YgdGltZS4gRm9yIHRoaXMgdGhvc2Ugb3BlcmF0aW9ucyBtYXkgYmUg
ZGVmZXJyZWQgdG8gYmUNCj4+IHBlcmZvcm1lZCBsYXRlciwgc28gdGhhdCB0aGV5IGNhbiBiZSBz
YWZlbHkgcHJlZW1wdGVkLg0KPj4NCj4+IEN1cnJlbnRseSB0aGlzIGRlZmVycmVkIHByb2Nlc3Np
bmcgaXMgaGFwcGVuaW5nIGluIGNvbW1vbiBJT1JFUSBjb2RlDQo+PiB3aGljaCBkb2Vzbid0IHNl
ZW0gdG8gYmUgdGhlIHJpZ2h0IHBsYWNlIGZvciB4ODYgYW5kIGlzIGV2ZW4gbW9yZQ0KPj4gZG91
YnRmdWwgYmVjYXVzZSBJT1JFUSBtYXkgbm90IGJlIGVuYWJsZWQgZm9yIEFybSBhdCBhbGwuDQo+
PiBTbywgZm9yIEFybSB0aGUgcGVuZGluZyB2UENJIHdvcmsgbWF5IGhhdmUgbm8gY2hhbmNlIHRv
IGJlIGV4ZWN1dGVkDQo+PiBpZiB0aGUgcHJvY2Vzc2luZyBpcyBsZWZ0IGFzIGlzIGluIHRoZSBj
b21tb24gSU9SRVEgY29kZSBvbmx5Lg0KPj4gRm9yIHRoYXQgcmVhc29uIG1ha2UgdlBDSSBwcm9j
ZXNzaW5nIGhhcHBlbiBpbiBhcmNoIHNwZWNpZmljIGNvZGUuDQo+Pg0KPj4gUGxlYXNlIGJlIGF3
YXJlIHRoYXQgdGhlcmUgYXJlIGEgZmV3IG91dHN0YW5kaW5nIFRPRE9zIGFmZmVjdGluZyB0aGlz
DQo+PiBjb2RlIHBhdGgsIHNlZSB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jOm1hcF9yYW5nZSBh
bmQNCj4+IHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmM6dnBjaV9wcm9jZXNzX3BlbmRpbmcuDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9h
bmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gW3g4NiBjaGFuZ2VzXQ0KPj4gQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+PiBSZXZpZXdlZC1ieTogUmFodWwg
U2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+PiBUZXN0ZWQtYnk6IFJhaHVsIFNpbmdoIDxy
YWh1bC5zaW5naEBhcm0uY29tPg0KPj4gLS0tDQo+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+IENjOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4N
Cj4+DQo+PiBTaW5jZSB2MjoNCj4+IMKgIC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdlIHdpdGggbW9y
ZSBpbnNpZ2h0IG9uIHg4NiwgSU9SRVEgYW5kIEFybQ0KPj4gwqAgLSByZXN0b3JlZCBvcmRlciBv
ZiBpbnZvY2F0aW9uIGZvciBJT1JFUSBhbmQgdlBDSSBwcm9jZXNzaW5nIChKYW4pDQo+PiBTaW5j
ZSB2MToNCj4+IMKgIC0gTW92ZWQgdGhlIGNoZWNrIGZvciBwZW5kaW5nIHZwY2kgd29yayBmcm9t
IHRoZSBjb21tb24gSU9SRVEgY29kZQ0KPj4gwqDCoMKgIHRvIGh2bV9kb19yZXN1bWUgb24geDg2
DQo+PiDCoCAtIFJlLXdvcmtlZCB0aGUgY29kZSBmb3IgQXJtIHRvIGVuc3VyZSB3ZSBkb24ndCBt
aXNzIHBlbmRpbmcgdlBDSSB3b3JrDQo+PiAtLS0NCj4+IMKgIHhlbi9hcmNoL2FybS90cmFwcy5j
wqDCoCB8IDEzICsrKysrKysrKysrKysNCj4+IMKgIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgfMKg
IDYgKysrKysrDQo+PiDCoCB4ZW4vY29tbW9uL2lvcmVxLmPCoMKgwqDCoCB8wqAgOSAtLS0tLS0t
LS0NCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9h
cm0vdHJhcHMuYw0KPj4gaW5kZXggMjE5YWIzYzNmYmRlLi5iMjQ2ZjUxMDg2ZTMgMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBz
LmMNCj4+IEBAIC0zNCw2ICszNCw3IEBADQo+PiDCoCAjaW5jbHVkZSA8eGVuL3N5bWJvbHMuaD4N
Cj4+IMKgICNpbmNsdWRlIDx4ZW4vdmVyc2lvbi5oPg0KPj4gwqAgI2luY2x1ZGUgPHhlbi92aXJ0
dWFsX3JlZ2lvbi5oPg0KPj4gKyNpbmNsdWRlIDx4ZW4vdnBjaS5oPg0KPj4gwqAgwqAgI2luY2x1
ZGUgPHB1YmxpYy9zY2hlZC5oPg0KPj4gwqAgI2luY2x1ZGUgPHB1YmxpYy94ZW4uaD4NCj4+IEBA
IC0yMzA0LDYgKzIzMDUsMTggQEAgc3RhdGljIGJvb2wgY2hlY2tfZm9yX3ZjcHVfd29yayh2b2lk
KQ0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoCAjZW5kaWYNCj4+IMKgICvCoMKgwqAgaWYgKCBoYXNf
dnBjaSh2LT5kb21haW4pICkNCj4+ICvCoMKgwqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGJvb2wg
cGVuZGluZzsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCBsb2NhbF9pcnFfZW5hYmxlKCk7DQo+
PiArwqDCoMKgwqDCoMKgwqAgcGVuZGluZyA9IHZwY2lfcHJvY2Vzc19wZW5kaW5nKHYpOw0KPj4g
K8KgwqDCoMKgwqDCoMKgIGxvY2FsX2lycV9kaXNhYmxlKCk7DQo+PiArDQo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKCBwZW5kaW5nICkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0
cnVlOw0KPj4gK8KgwqDCoCB9DQo+PiArDQo+DQo+IEkgd291bGQgcHJlZmVyIGlmIHRoaXMgYWRk
aXRpb24gaXMgbW92ZWQgYmVmb3JlIHRoZSB2Y3B1X2lvcmVxX19oYW5kbGVfY29tcGxldGlvbih2
KS4gVGhpcyBpcyB0byBhdm9pZCBkaWZmZXJlbmNlcyB3aXRoIHRoZSB4ODYgdmVyc2lvbi4NCk9r
LCB3aWxsIGRvDQoNClRoYW5rcywNCk9sZWtzYW5kcg==

