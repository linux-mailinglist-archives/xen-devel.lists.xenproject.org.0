Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4845A412E5E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 07:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191313.341287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSYhN-00053j-9E; Tue, 21 Sep 2021 05:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191313.341287; Tue, 21 Sep 2021 05:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSYhN-00051P-64; Tue, 21 Sep 2021 05:52:09 +0000
Received: by outflank-mailman (input) for mailman id 191313;
 Tue, 21 Sep 2021 05:52:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K4gq=OL=epam.com=prvs=989865dee5=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mSYhL-00051J-Bt
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 05:52:07 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cd6095c-1aa0-11ec-b89b-12813bfff9fa;
 Tue, 21 Sep 2021 05:52:05 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L5mxts014878; 
 Tue, 21 Sep 2021 05:52:03 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b6xr2h9w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 05:52:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6067.eurprd03.prod.outlook.com (2603:10a6:208:15e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Tue, 21 Sep
 2021 05:51:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 05:51:59 +0000
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
X-Inumbo-ID: 0cd6095c-1aa0-11ec-b89b-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcys5ssmyzGK87bAAxQTZLJHRSCpUExoBat5mO3XLGoEpLcC0+E4vgevkj2z4cJ+n2wNj/jgRpxh56nJ8RKGlasp+ZvDSwUAhqdpLu51BEr+2cDXPbnyS58Yn0eceSsxxVP43SWlBvYKkp26n/4w34xXbDCPmdLofeAnQ0akpJbtk6jB0L8W4HNA6FZeLjKtAgExQNcIzAc1U/8DmsIsQRaduEl5FIoIT3D0ToMA8NdEy5+iXqx3sUiVORqu70V/u96+0ra9U/Y2jhyRANoPWs3SXAZI6eOu2hrhVhhWebf09QEmLvR++3j52uv7ADYDUUIIIpLt+Td9FqJr8nIhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4b6BvHvGl6harng3BJDJHlMvVVQEncyR9TRwiV/Vvx8=;
 b=UTq2Ax2s/dk0JooqGkgmeYe5mvAZhYpVebaqNhToiA08W3jrSyVsCkJve/pNejg16Wi9w4to5AUobiwlqjACw/+0wkNEVvbl+1uWKnVPdkMQqpR3RQW5EuonyCDwI2drRNIe8ztl84YuUAyft8RxSYDdUayIGtV0WaM+NecpU9cL8Z3Wx+g6Xp0PzYCDVw/8zh+SV0LuhkEgXAJNTOAD5LigmEqxiEjEeBF1Et8tZQdwH/2gbQI3j5Fv3l7W+b5NjP0imueYYt1VkcEzVbQLGM8LqFsSVn1IVlRPWAVUynzAqUaBfKEFBPH4kcajI8tA6IbKlhiTZOTNUj6CZhRusw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b6BvHvGl6harng3BJDJHlMvVVQEncyR9TRwiV/Vvx8=;
 b=5yPlqlZZccINQsmas4v/YR4n9+/irAI5ALB4b8HhtepeHyN6FPkoKiFrn4UNutRUHVLRfMV25+hY+VuQXP2NKUNCBSqcbXnmNTyXCX037fe/zG5/mwKTR/xujtgSV1z2UczJTUsbR1QnIrwwlvdr/83NlF+Va5UlWoAg6/2JfQcwJyAuBPUSNFksAEoCOzOU9hEVi2vfTX71xx6fKRU313syfI7I7TmYjl5Mzf3lB893F7yBiQVLADyBQJiu65KhiAInroktts9B4gMnZj0keSMsA/kKCtH860b/OIIJD49ckWK8MasRTzPbQX9rl7sKIYTbV9Q3ZBC5ZuzW4sxHfg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia
 Lukianenko <Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: 
 AQHXq8QnOfGIukpGqE2hMWXmS9bdmKuow0KAgAOkhICAAGZ9AIAAAmOAgADCywCAAGXhAIAACLuA
Date: Tue, 21 Sep 2021 05:51:59 +0000
Message-ID: <82e55df9-74d3-6365-ab29-2bdfc4b74a1f@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
 <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com>
In-Reply-To: <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65f234ac-1d38-4cb7-ac97-08d97cc3ed9c
x-ms-traffictypediagnostic: AM0PR03MB6067:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB6067A8116A39F801AF63A214E7A19@AM0PR03MB6067.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EepylDbOu4trE/IJKaDkqJ9shMNzqkMI2ESn/DPXEmBEcNVCo4BB4KcIiOs6BUU3P21/bvqA+BNFdxp7BZCuk4bw0tASsEAi4uS9QP4g9PnBt1hxJW15vu2NxR/RQEzCx6p/MT7MC95K3/+nEBT4AcmRuDX4U9HbrQ92eNnJJsGPlCtKutbkrxXgKyZqN1pPMPMXhvh22hbyGTiMFgqFbiCol9TzybpadI9xtEFW7n04PaTCdjIWYWmvw3asq08Uc5rOGgp8AaKTojBF2H3DRkX2jM2ktUL91oLkj+KXyyZ9zIeHFQd52t9ksCRjynbWlndBFfs66BJCHctXnhKy2Zm/kkU59Ho8pTACGW18yKi+dL231GOiNuaADwU899uD9JlDWeG1vRM1wpuVU/AS4NFB2JjI5wn2LKzp7XNB6RvBDjL04jNklzDTUX1EqY8B9woikVsK1VE8CaJ9ZHfirz57pzc4dGvqXitdzaFX/NAjNi3c3MgwEkoHr1kXuxT3LHx+IuUjFGFA4b8rxrXOMVQBNY0VGg4uizDLuR1hyfluWdBgdOSR9H6q/Zxc/Qc0+qGJEkScjbMIAyfhxR4m1PruEGIih9ywSBmUmHFwfSC/JQSW5tIjmOip+7++29QprmhYCdWk7+bbPxva2tadrqrdJmRSRmBKl6+Txt2f5//BfgGTvfFIgoT+5GUX77wc9xzCagNrUN2dAArvHJHv77i9gzd7T6ZGf8UhmiqKUuu/wE0aVXveAyTGIOceDzI0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(5660300002)(83380400001)(122000001)(316002)(26005)(2906002)(55236004)(53546011)(6506007)(71200400001)(2616005)(186003)(54906003)(110136005)(8936002)(36756003)(66476007)(86362001)(64756008)(66446008)(66946007)(31686004)(91956017)(31696002)(76116006)(66556008)(8676002)(4326008)(508600001)(6486002)(38070700005)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VTNBVkRORjZ0QkY3UXRSbGdZNlZOUENQL0s5OXJ0Q3Qwd2FqWTI2SWtpbm4w?=
 =?utf-8?B?U1JRelNhMHNzY1FkcitoaThHOWUxbXQ0Y3I5dFZ0Rk1uc2hGaUVuZGpDN1BP?=
 =?utf-8?B?Y3hvRFpjcGptMU1mSitEeGcwOVdUNFBla2tpMlM4VGlkdFFHUjJNMndBRERT?=
 =?utf-8?B?dW9NcFRNSmVteWt4bS85WUNxY1U3UlkwbzVwckxLT3NzZ0FRckgrQ0xpUE12?=
 =?utf-8?B?VTBqaHNBdkdUaFpvR1Vjd0w3RXBYbHJ3Rnh6M2R1MC80Q2lqTDVDRC8yUTZy?=
 =?utf-8?B?dkc5S2s3cnVKUnhvc29mMlhJdUk1a05pUnZ1WUlHWXVRZnhjajI0V1Nmd3Nt?=
 =?utf-8?B?cU5CSEdQUHRwN0IyaHREMzlZVEs0bllTZElHejRIK24vdjh4OHJzV2gzSWdx?=
 =?utf-8?B?YVVWQ3ROM0NFZFB4UXROZnpDcUVKMkk0SktqZG10dGJmaDVsS0hkdVd6Z2ZP?=
 =?utf-8?B?TnhZSUI5QnpwUHZPYU1pYWhZaUdPbUw4TTZDN3M1Y3pqQStLcWQwbUpUZTUr?=
 =?utf-8?B?cTQweFlRQXZpclRocS8yR1dBcUh2MTJVbndDTmxQd1N6dTVMZ0ZTZC9EUlhJ?=
 =?utf-8?B?cjBkQ3pkb0JwbklncklwanMzK1JsZVlrQi9TT0ZmYnFMZ0pqVUhWMVNEaWl6?=
 =?utf-8?B?RDk3c0U5ZmNqN3BKQXRhbXd4Z1UyN1RtNFBhcmlqb1NOMDIwRFI2Zm5PcEsr?=
 =?utf-8?B?bjVRcFM2RE91a1hnMTNTdnk0RzhiNEF1SDBTelZ2cEhhYjZoWmU2elZybkFi?=
 =?utf-8?B?RjM2VjVFMnhraWM5RTVaSDdXWi9Nd1ZMQi9aOGdZVGt2Y2RCWlZiYXFjK0Uv?=
 =?utf-8?B?a3NjemJaZHVkS3FnWjBvRnNOUGJFOUpVM0M5YllRRTVSNmM3S040NnR1NUZW?=
 =?utf-8?B?OG9GZGVzYTdzQ3hDK1JQdlo5bmtZQXVVbXBIZWpkMWNBZlpLMUVEdVZqd1Bh?=
 =?utf-8?B?eEtVL1lrTVFuZW4xRHgvaEcrU2Q0ZzRSQXJsanlhQ01Ea1Zxd0YxUXhDTEhW?=
 =?utf-8?B?aTF3MEdPemQvc2ZyUUxRV2tLakdWYjA0RmJGcGc5YzJDeUh3dXk4YkhrdktP?=
 =?utf-8?B?UFNEQ2Vvb3EvemFxcEJlQVRCbTdQVVJFRUt0dmhHaDB4MDR2NENtTlF3U250?=
 =?utf-8?B?TWkxbVVXdDBxcHB6dGd0ZUNyZFA2ckY1VE1HcU5HdjJDN05IQTl1dEVIczgz?=
 =?utf-8?B?QnkxakJDWEdMZmd1SE9GTzUvN3BOWTJzeDRJa0RCTUVHbVFNV1EzRTlQYXNB?=
 =?utf-8?B?Z1pvWVhmY2pmTDlLeDVMaEZoUktLdXFncjRYbm5INThlMElUUXhlQWdid0lH?=
 =?utf-8?B?YVRmUHpGS3ZlbVBkRm8yNlAwTVZVVXVWTU90Nmt2dk04cmxVSDYzN1FML1JD?=
 =?utf-8?B?dkxhczU1NlRjcnhSY2d6SWJoaElxN0w3QmhXc3FwalZpSmpxc2Q0KzlEVTRB?=
 =?utf-8?B?SytpMFMyNkU5amJkN3JtNGxuL2lMaTlRNDBpb0oyMkhYNndHMG9WMWZMb1NT?=
 =?utf-8?B?bGJzU0lRbDZvRnhFMHpZbWE5NnFsRHpEZUlza2RQbUxLQ09Fdm1UdUg4K08x?=
 =?utf-8?B?L254RTlQR00vYVBhL2EyOVRQUVlGUFBQS2I4MlgwVmhBOUwzdFJSLytZZnpB?=
 =?utf-8?B?SWJ1bVhCTFF4R2pBaUNHbXREVTdaVzdBR3lsbmhhTnVXQVdUeFMySHNEM1pH?=
 =?utf-8?B?WkMva21QNmhGa01rTXpVL0NnWTVQaXAyUFI2bWMxakkrNGxZcHJBS2w5dlNQ?=
 =?utf-8?B?VnRPTVlzWTFnN01CLzhyU2RIYWJvem04RC95MlFDbzRUeXNhWnBOSFFkMWR6?=
 =?utf-8?B?cGVrSi96bmdteCtpMU5RUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6413BF715B895D408A3094B32829DF99@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f234ac-1d38-4cb7-ac97-08d97cc3ed9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 05:51:59.5535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NT6Fp0tGlWYsAVlqOSufjUuMHcqCrc4r49ZytqNbaQKxHObq/vcnnchXYgtcwiCYBoZBRmWECfk8OQFgbk1dNbQJz9oLnZ27/Qn0Z28Oow54BFUihazokqKBkZGORgHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6067
X-Proofpoint-ORIG-GUID: 1Ne9NicsKgy2jpSW4D6M-ZfxcCDeUEfm
X-Proofpoint-GUID: 1Ne9NicsKgy2jpSW4D6M-ZfxcCDeUEfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210037

DQpPbiAyMS4wOS4yMSAwODoyMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjEuMDkuMjEg
MDE6MTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IE9uIE1vbiwgMjAgU2VwIDIwMjEs
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+IE9uIDIwLjA5LjIxIDE0OjMwLCBK
dWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+PiBPbiAyMC4wOS4yMSAwNzoyMywgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBIZWxsbywgU3RlZmFubyENCj4+Pj4+DQo+Pj4+PiBP
biAxOC4wOS4yMSAwMDo0NSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+Pj4+IEhpIE9s
ZWtzYW5kciwNCj4+Pj4+Pg0KPj4+Pj4+IFdoeSBkbyB5b3Ugd2FudCB0byBlbmFibGUgcGNpYmFj
ayBvbiBBUk0/IElzIGl0IG9ubHkgdG8gImRpc2FibGUiIGEgUENJDQo+Pj4+Pj4gZGV2aWNlIGlu
IERvbTAgc28gdGhhdCBpdCBjYW4gYmUgc2FmZWx5IGFzc2lnbmVkIHRvIGEgRG9tVT8NCj4+Pj4+
IE5vdCBvbmx5IHRoYXQNCj4+Pj4+Pg0KPj4+Pj4+IEkgYW0gYXNraW5nIGJlY2F1c2UgYWN0dWFs
bHkgSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGVuYWJsZSB0aGUgUFYgUENJDQo+Pj4+Pj4gYmFj
a2VuZCBmZWF0dXJlIG9mIHBjaWJhY2sgb24gQVJNLCByaWdodD8gVGhhdCB3b3VsZCBjbGFzaCB3
aXRoIHRoZSBQQ0kNCj4+Pj4+PiBhc3NpZ25tZW50IHdvcmsgeW91IGhhdmUgYmVlbiBkb2luZyBp
biBYZW4uIFRoZXkgY291bGRuJ3QgYm90aCB3b3JrIGF0DQo+Pj4+Pj4gdGhlIHNhbWUgdGltZS4N
Cj4+Pj4+IENvcnJlY3QsIGl0IGlzIG5vdCB1c2VkDQo+Pj4+Pj4NCj4+Pj4+PiBJZiB3ZSBvbmx5
IG5lZWQgcGNpYmFjayB0byAicGFyayIgYSBkZXZpY2UgaW4gRG9tMCwgd291bGRuJ3QgaXQgYmUN
Cj4+Pj4+PiBwb3NzaWJsZSBhbmQgYmV0dGVyIHRvIHVzZSBwY2ktc3R1YiBpbnN0ZWFkPw0KPj4+
Pj4NCj4+Pj4+IE5vdCBvbmx5IHRoYXQsIHNvIHBjaS1zdHViIGlzIG5vdCBlbm91Z2gNCj4+Pj4+
DQo+Pj4+PiBUaGUgZnVuY3Rpb25hbGl0eSB3aGljaCBpcyBpbXBsZW1lbnRlZCBieSB0aGUgcGNp
YmFjayBhbmQgdGhlIHRvb2xzdGFjaw0KPj4+Pj4gYW5kIHdoaWNoIGlzIHJlbGV2YW50L21pc3Np
bmcvbmVlZGVkIGZvciBBUk06DQo+Pj4+Pg0KPj4+Pj4gMS4gcGNpYmFjayBpcyB1c2VkIGFzIGEg
ZGF0YWJhc2UgZm9yIGFzc2lnbmFibGUgUENJIGRldmljZXMsIGUuZy4geGwNCj4+Pj4+IMKgwqAg
wqDCoCBwY2ktYXNzaWduYWJsZS17YWRkfHJlbW92ZXxsaXN0fSBtYW5pcHVsYXRlcyB0aGF0IGxp
c3QuIFNvLCB3aGVuZXZlciB0aGUNCj4+Pj4+IMKgwqAgwqDCoCB0b29sc3RhY2sgbmVlZHMgdG8g
a25vdyB3aGljaCBQQ0kgZGV2aWNlcyBjYW4gYmUgcGFzc2VkIHRocm91Z2ggaXQgcmVhZHMNCj4+
Pj4+IMKgwqAgwqDCoCB0aGF0IGZyb20gdGhlIHJlbGV2YW50IHN5c2ZzIGVudHJpZXMgb2YgdGhl
IHBjaWJhY2suDQo+Pj4+Pg0KPj4+Pj4gMi4gcGNpYmFjayBpcyB1c2VkIHRvIGhvbGQgdGhlIHVu
Ym91bmQgUENJIGRldmljZXMsIGUuZy4gd2hlbiBwYXNzaW5nIHRocm91Z2gNCj4+Pj4+IMKgwqAg
wqDCoCBhIFBDSSBkZXZpY2UgaXQgbmVlZHMgdG8gYmUgdW5ib3VuZCBmcm9tIHRoZSByZWxldmFu
dCBkZXZpY2UgZHJpdmVyIGFuZCBib3VuZA0KPj4+Pj4gwqDCoCDCoMKgIHRvIHBjaWJhY2sgKHN0
cmljdGx5IHNwZWFraW5nIGl0IGlzIG5vdCByZXF1aXJlZCB0aGF0IHRoZSBkZXZpY2UgaXMgYm91
bmQgdG8NCj4+Pj4+IMKgwqAgwqDCoCBwY2liYWNrLCBidXQgcGNpYmFjayBpcyBhZ2FpbiB1c2Vk
IGFzIGEgZGF0YWJhc2Ugb2YgdGhlIHBhc3NlZCB0aHJvdWdoIFBDSQ0KPj4+Pj4gwqDCoCDCoMKg
IGRldmljZXMsIHNvIHdlIGNhbiByZS1iaW5kIHRoZSBkZXZpY2VzIGJhY2sgdG8gdGhlaXIgb3Jp
Z2luYWwgZHJpdmVycyB3aGVuDQo+Pj4+PiDCoMKgIMKgwqAgZ3Vlc3QgZG9tYWluIHNodXRzIGRv
d24pDQo+Pj4+Pg0KPj4+Pj4gMy4gRGV2aWNlIHJlc2V0DQo+Pj4+Pg0KPj4+Pj4gV2UgaGF2ZSBw
cmV2aW91c2x5IGRpc2N1c3NlZCBvbiB4ZW4tZGV2ZWwgTUwgcG9zc2libGUgc29sdXRpb25zIHRv
IHRoYXQgYXMgZnJvbSB0aGUNCj4+Pj4+IGFib3ZlIHdlIHNlZSB0aGF0IHBjaWJhY2sgZnVuY3Rp
b25hbGl0eSBpcyBnb2luZyB0byBiZSBvbmx5IHBhcnRpYWxseSB1c2VkIG9uIEFybS4NCj4+Pj4+
DQo+Pj4+PiBQbGVhc2Ugc2VlIFsxXSBhbmQgWzJdOg0KPj4+Pj4NCj4+Pj4+IDEuIEl0IGlzIG5v
dCBhY2NlcHRhYmxlIHRvIG1hbmFnZSB0aGUgYXNzaWduYWJsZSBsaXN0IGluIFhlbiBpdHNlbGYN
Cj4+Pj4+DQo+Pj4+PiAyLiBwY2liYWNrIGNhbiBiZSBzcGxpdCBpbnRvIHR3byBwYXJ0czogUENJ
IGFzc2lnbmFibGUvYmluZC9yZXNldCBoYW5kbGluZyBhbmQNCj4+Pj4+IHRoZSByZXN0IGxpa2Ug
dlBDSSBldGMuDQo+Pj4+Pg0KPj4+Pj4gMy4gcGNpZnJvbnQgaXMgbm90IHVzZWQgb24gQXJtDQo+
Pj4+DQo+Pj4+IEl0IGlzIG5laXRoZXIgaW4geDg2IFBWSC9IVk0gZ3Vlc3RzLg0KPj4+IERpZG4n
dCBrbm93IHRoYXQsIHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcNCj4+Pj4NCj4+Pj4+IFNvLCBsaW1p
dGVkIHVzZSBvZiB0aGUgcGNpYmFjayBpcyBvbmUgb2YgdGhlIGJyaWNrcyB1c2VkIHRvIGVuYWJs
ZSBQQ0kgcGFzc3Rocm91Z2gNCj4+Pj4+IG9uIEFybS4gSXQgd2FzIGVub3VnaCB0byBqdXN0IHJl
LXN0cnVjdHVyZSB0aGUgZHJpdmVyIGFuZCBoYXZlIGl0IHJ1biBvbiBBcm0gdG8gYWNoaWV2ZQ0K
Pj4+Pj4gYWxsIHRoZSBnb2FscyBhYm92ZS4NCj4+Pj4+DQo+Pj4+PiBJZiB3ZSBzdGlsbCB0aGlu
ayBpdCBpcyBkZXNpcmFibGUgdG8gYnJlYWsgdGhlIHBjaWJhY2sgZHJpdmVyIGludG8gImNvbW1v
biIgYW5kICJwY2lmcm9udCBzcGVjaWZpYyINCj4+Pj4+IHBhcnRzIHRoZW4gaXQgY2FuIGJlIGRv
bmUsIHlldCB0aGUgcGF0Y2ggaXMgZ29pbmcgdG8gYmUgdGhlIHZlcnkgZmlyc3QgYnJpY2sgaW4g
dGhhdCBidWlsZGluZy4NCj4+Pj4NCj4+Pj4gRG9pbmcgdGhpcyBzcGxpdCBzaG91bGQgYmUgZG9u
ZSwgYXMgdGhlIHBjaWZyb250IHNwZWNpZmljIHBhcnQgY291bGQgYmUNCj4+Pj4gb21pdHRlZCBv
biB4ODYsIHRvbywgaW4gY2FzZSBubyBQViBndWVzdHMgdXNpbmcgUENJIHBhc3N0aHJvdWdoIGhh
dmUgdG8NCj4+Pj4gYmUgc3VwcG9ydGVkLg0KPj4+IEFncmVlLCB0aGF0IHRoZSBmaW5hbCBzb2x1
dGlvbiBzaG91bGQgaGF2ZSB0aGUgZHJpdmVyIHNwbGl0DQo+Pj4+DQo+Pj4+PiBTbywgSSB0aGlu
ayB0aGlzIHBhdGNoIGlzIHN0aWxsIGdvaW5nIHRvIGJlIG5lZWRlZCBiZXNpZGVzIHdoaWNoIGRp
cmVjdGlvbiB3ZSB0YWtlLg0KPj4+Pg0KPj4+PiBTb21lIGtpbmQgb2YgdGhpcyBwYXRjaCwgeWVz
LiBJdCBtaWdodCBsb29rIGRpZmZlcmVudCBpbiBjYXNlIHRoZSBzcGxpdA0KPj4+PiBpcyBkb25l
IGZpcnN0Lg0KPj4+Pg0KPj4+PiBJIGRvbid0IG1pbmQgZG9pbmcgaXQgaW4gZWl0aGVyIHNlcXVl
bmNlLg0KPj4+Pg0KPj4+IFdpdGggdGhpcyBwYXRjaCB3ZSBoYXZlIEFybSBvbiB0aGUgc2FtZSBw
YWdlIGFzIHRoZSBhYm92ZSBtZW50aW9uZWQgeDg2IGd1ZXN0cywNCj4+Pg0KPj4+IGUuZy4gdGhl
IGRyaXZlciBoYXMgdW51c2VkIGNvZGUsIGJ1dCB5ZXQgYWxsb3dzIEFybSB0byBmdW5jdGlvbiBu
b3cuDQo+Pj4NCj4+PiBBdCB0aGlzIHN0YWdlIG9mIFBDSSBwYXNzdGhyb3VnaCBvbiBBcm0gaXQg
aXMgeWV0IGVub3VnaC4gTG9uZyB0ZXJtLCB3aGVuDQo+Pj4NCj4+PiB0aGUgZHJpdmVyIGdldHMg
c3BsaXQsIEFybSB3aWxsIGJlbmVmaXQgZnJvbSB0aGF0IHNwbGl0IHRvbywgYnV0IHVuZm9ydHVu
YXRlbHkgSSBkbyBub3QNCj4+Pg0KPj4+IGhhdmUgZW5vdWdoIGJhbmR3aWR0aCBmb3IgdGhhdCBw
aWVjZSBvZiB3b3JrIGF0IHRoZSBtb21lbnQuDQo+Pg0KPj4gVGhhdCdzIGZhaXIgYW5kIEkgZG9u
J3Qgd2FudCB0byBzY29wZS1jcmVlcCB0aGlzIHNpbXBsZSBwYXRjaCBhc2tpbmcgZm9yDQo+PiBh
biBlbm9ybW91cyByZXdvcmsuIEF0IHRoZSBzYW1lIHRpbWUgSSBkb24ndCB0aGluayB3ZSBzaG91
bGQgZW5hYmxlIHRoZQ0KPj4gd2hvbGUgb2YgcGNpYmFjayBvbiBBUk0gYmVjYXVzZSBpdCB3b3Vs
ZCBiZSBlcnJvbmVvdXMgYW5kIGNvbmZ1c2luZy4NCg0KQXMgdGhlIGZpcnN0IHN0YWdlIGJlZm9y
ZSB0aGUgZHJpdmVyIGlzIHNwbGl0IG9yIGlmZGVmJ3MgdXNlZCAtIGNhbiB3ZSB0YWtlIHRoZSBw
YXRjaA0KDQphcyBpcyBub3c/IEluIGVpdGhlciB3YXkgd2UgY2hvc2UgdGhpcyBuZWVkcyB0byBi
ZSBkb25lLCBlLmcuIGVuYWJsZSBjb21waWxpbmcNCg0KZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMg
YW5kIGNvbW1vbiBjb2RlIG1vdmUuDQoNCj4+DQo+PiBJIGFtIHdvbmRlciBpZiB0aGVyZSBpcyBh
IHNpbXBsZToNCj4+DQo+PiBpZiAoIXhlbl9wdl9kb21haW4oKSkNCj4+IMKgwqDCoMKgIHJldHVy
bjsNCj4+DQo+PiBUaGF0IHdlIGNvdWxkIGFkZCBpbiBhIGNvdXBsZSBvZiBwbGFjZXMgaW4gcGNp
YmFjayB0byBzdG9wIGl0IGZyb20NCj4+IGluaXRpYWxpemluZyB0aGUgcGFydHMgd2UgZG9uJ3Qg
Y2FyZSBhYm91dC4gU29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVzDQo+PiAodW50ZXN0ZWQgYW5k
IHByb2JhYmx5IGluY29tcGxldGUpLg0KPj4NCj4+IFdoYXQgZG8geW91IGd1eXMgdGhpbms/DQo+
DQo+IFVoIG5vLCBub3QgaW4gdGhpcyB3YXksIHBsZWFzZS4gVGhpcyB3aWxsIGtpbGwgcGNpIHBh
c3N0aHJvdWdoIG9uIHg4Ng0KPiB3aXRoIGRvbTAgcnVubmluZyBhcyBQVkguIEkgZG9uJ3QgdGhp
bmsgdGhpcyBpcyB3b3JraW5nIHJpZ2h0IG5vdywgYnV0DQo+IGFkZGluZyBtb3JlIGNvZGUgbWFr
aW5nIGl0IGV2ZW4gaGFyZGVyIHRvIHdvcmsgc2hvdWxkIGJlIGF2b2lkZWQuDQo+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMgYi9kcml2ZXJzL3hlbi94
ZW4tcGNpYmFjay94ZW5idXMuYw0KPj4gaW5kZXggZGEzNGNlODVkYzg4Li45OTFiYTBhOWIzNTkg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYw0KPj4gKysr
IGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmMNCj4+IEBAIC0xNSw2ICsxNSw3IEBA
DQo+PiDCoCAjaW5jbHVkZSA8eGVuL3hlbmJ1cy5oPg0KPj4gwqAgI2luY2x1ZGUgPHhlbi9ldmVu
dHMuaD4NCj4+IMKgICNpbmNsdWRlIDx4ZW4vcGNpLmg+DQo+PiArI2luY2x1ZGUgPHhlbi94ZW4u
aD4NCj4+IMKgICNpbmNsdWRlICJwY2liYWNrLmgiDQo+PiDCoCDCoCAjZGVmaW5lIElOVkFMSURf
RVZUQ0hOX0lSUcKgICgtMSkNCj4+IEBAIC02ODUsOCArNjg2LDEyIEBAIHN0YXRpYyBpbnQgeGVu
X3BjaWJrX3hlbmJ1c19wcm9iZShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LA0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgeGVuYnVzX2RldmljZV9p
ZCAqaWQpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIGludCBlcnIgPSAwOw0KPj4gLcKgwqDCoCBz
dHJ1Y3QgeGVuX3BjaWJrX2RldmljZSAqcGRldiA9IGFsbG9jX3BkZXYoZGV2KTsNCj4+ICvCoMKg
wqAgc3RydWN0IHhlbl9wY2lia19kZXZpY2UgKnBkZXY7DQo+PiArDQo+PiArwqDCoMKgIGlmICgh
eGVuX3B2X2RvbWFpbigpKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4gwqAgK8Kg
wqDCoCBwZGV2ID0gYWxsb2NfcGRldihkZXYpOw0KPg0KPiBUaGlzIGh1bmsgaXNuJ3QgbmVlZGVk
LCBhcyB3aXRoIGJhaWxpbmcgb3V0IG9mIHhlbl9wY2lia194ZW5idXNfcmVnaXN0ZXINCj4gZWFy
bHkgd2lsbCByZXN1bHQgaW4geGVuX3BjaWJrX3hlbmJ1c19wcm9iZSBuZXZlciBiZWluZyBjYWxs
ZWQuDQo+DQo+PiDCoMKgwqDCoMKgIGlmIChwZGV2ID09IE5VTEwpIHsNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBlcnIgPSAtRU5PTUVNOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHhlbmJ1c19kZXZf
ZmF0YWwoZGV2LCBlcnIsDQo+PiBAQCAtNzQzLDYgKzc0OCw5IEBAIGNvbnN0IHN0cnVjdCB4ZW5f
cGNpYmtfYmFja2VuZCAqX19yZWFkX21vc3RseSB4ZW5fcGNpYmtfYmFja2VuZDsNCj4+IMKgIMKg
IGludCBfX2luaXQgeGVuX3BjaWJrX3hlbmJ1c19yZWdpc3Rlcih2b2lkKQ0KPj4gwqAgew0KPj4g
K8KgwqDCoCBpZiAoIXhlbl9wdl9kb21haW4oKSkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsNCj4+ICsNCj4NCj4gVXNlICNpZmRlZiBDT05GSUdfWDg2IGluc3RlYWQuDQoNClRoZSB0aXRs
ZSBvZiB0aGlzIHBhdGNoIHNheXMgdGhhdCB3ZSB3YW50IHRvIGFsbG93IHRoaXMgZHJpdmVyIGZv
ciBvdGhlciBhcmNocw0KDQphbmQgbm93IHdlIHdhbnQgdG8gaW50cm9kdWNlICIjaWZkZWYgQ09O
RklHX1g4NiIgd2hpY2ggZG9lc24ndCBzb3VuZA0KDQpyaWdodCB3aXRoIHRoYXQgcmVzcGVjdC4g
SW5zdGVhZCwgd2UgbWF5IHdhbnQgaGF2aW5nIHNvbWV0aGluZyBsaWtlIGENCg0KZGVkaWNhdGVk
IGdhdGUgZm9yIHRoaXMsIGUuZy4gIiNpZmRlZiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EX1NV
UFBfUFYiDQoNCm9yIHNvbWV0aGluZyB3aGljaCBpcyBhcmNoaXRlY3R1cmUgYWdub3N0aWMuDQoN
CkdhdGluZyBhbHNvIG1lYW5zIHRoYXQgd2UgYXJlIG5vdCB0aGlua2luZyBhYm91dCBzcGxpdHRp
bmcgdGhlIGJhY2tlbmQgZHJpdmVyIGludG8NCg0KdHdvIGRpZmZlcmVudCBvbmVzLCBlLmcuIG9u
ZSBmb3IgImNvbW1vbiIgY29kZSBhbmQgb25lIGZvciBQViBzdHVmZi4NCg0KT3RoZXJ3aXNlIHRo
aXMgaWZkZWZlcnkgd29uJ3QgYmUgbmVlZGVkLg0KDQo+DQo+PiDCoMKgwqDCoMKgIHhlbl9wY2li
a19iYWNrZW5kID0gJnhlbl9wY2lia192cGNpX2JhY2tlbmQ7DQo+PiDCoMKgwqDCoMKgIGlmIChw
YXNzdGhyb3VnaCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW5fcGNpYmtfYmFja2VuZCA9ICZ4
ZW5fcGNpYmtfcGFzc3Rocm91Z2hfYmFja2VuZDsNCj4+IEBAIC03NTIsNSArNzYwLDcgQEAgaW50
IF9faW5pdCB4ZW5fcGNpYmtfeGVuYnVzX3JlZ2lzdGVyKHZvaWQpDQo+PiDCoCDCoCB2b2lkIF9f
ZXhpdCB4ZW5fcGNpYmtfeGVuYnVzX3VucmVnaXN0ZXIodm9pZCkNCj4+IMKgIHsNCj4+ICvCoMKg
wqAgaWYgKCF4ZW5fcHZfZG9tYWluKCkpDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPg0K
PiAjaWZkZWYgYWdhaW4uDQo+DQo+PiB4ZW5idXNfdW5yZWdpc3Rlcl9kcml2ZXIoJnhlbl9wY2li
a19kcml2ZXIpOw0KPj4gwqAgfQ0KPj4NCj4NCj4NCj4gSnVlcmdlbg==

