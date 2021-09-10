Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E44406D41
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 16:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184470.333122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOh6X-00086E-9U; Fri, 10 Sep 2021 14:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184470.333122; Fri, 10 Sep 2021 14:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOh6X-00084P-5T; Fri, 10 Sep 2021 14:02:09 +0000
Received: by outflank-mailman (input) for mailman id 184470;
 Fri, 10 Sep 2021 14:02:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOh6V-00083Y-EB
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 14:02:07 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ada91ffe-123f-11ec-b242-12813bfff9fa;
 Fri, 10 Sep 2021 14:02:05 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ADi9kI004046; 
 Fri, 10 Sep 2021 14:02:02 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b0731ge0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 14:02:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4305.eurprd03.prod.outlook.com (2603:10a6:208:c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 14:01:58 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 14:01:58 +0000
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
X-Inumbo-ID: ada91ffe-123f-11ec-b242-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhH7L5D1JjdVHdTtdKB4kBq6ZDCel+b08VU67z4RdDQoBSbzqOsjyI642TyWLSmKryhzQGAgCEGomEXgVhUoc5alZ78x0jyaBKQFbSRGKYb9UQlY3ao/17IElWlkNd5pWNu1W/Qg3q//5V2MnR0EmU6r/R9qie+o2ygZ328jd+y0FviXmoV1RMCD6+LTsekvyr9ncbzLgf7CUATALF+ZccFQDFXbmqtMH4GRLMBg+Zcjkba3G474JBQuP4Kp1nplKLiqO2C8b/WU1qRHBMeMH74IYqbRC9ESBZMTMlMoIzGMxbIXmt9fCxJ2gcqbvx2H41nl7j94kXJSGMeGKY5jiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CU+lIt2uva7UKXKnBs1OiCP1uunsHpfUorn1ZfAfK5Q=;
 b=b0ox3sFF0BB4pzCbiVHKZkoN68JU9RT/s87oCAjUWDFrQuM2dNQ6genWy3TRJn62RJx+GwWVYKs7DsIyUPwSnFxJFrcsTx+jSKDYX26FwFondm1qpMSEpQXcALZr0QDup8Q6H5Ak1VsiD3/5KnLkS8aIyqnDpkLHk9V/XGYWZjWVeoGjjsg70he6cTOzerW+T8grB7tQ5o1vJVsEQdzjvmvKq3VgbmBDnV2gvyvblkOvMs5BtqnLJI5jpWKpBo/sYZmaQ1nRhXYQpkBIece6DUDIDAbqRB1Q85LFqRMExM+LTaayIIzSKN6/bp23wyozRI98FKzmpD8OOh6gh438Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CU+lIt2uva7UKXKnBs1OiCP1uunsHpfUorn1ZfAfK5Q=;
 b=qHTNMaKBGaFsLiKgLtFeHQg8zjGUgj0ICsLzoScl7ij+5PoifyATXYZx9emTBfRQbrxPL064C96HRA1HXM1yDAyon2nIwcBm0LLJ5BdmrMaHFkH7DSUwiNqzjYp8KKnAp5WInMdOV3z8JYkaRNAq17V15z6pwlef834Kz3qYfRMIwwCPtzH+7oDPFhADdNXG5ciC1dt5V9PKxO4xBisqs4TidIZpQrH4LASEjTqLqyRd73eApEzWHyGLMkhtZPGBOUHWWiH5Du95cWT8wgRyYaBy5LBfkDWGB5mxP5+93T8VhD6PdpymFpsoEFV1TCepDlqEI5AqxPYCPyOocSm7dg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Topic: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Index: AQHXoJ50hf+zXQhc2ka7YfmmERKX+aucB06AgAE4wYCAAAtRgIAADDiA
Date: Fri, 10 Sep 2021 14:01:57 +0000
Message-ID: <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
In-Reply-To: <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf8378c9-8315-400c-0312-08d974638dd9
x-ms-traffictypediagnostic: AM0PR03MB4305:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB430535927169433910E3D5E5E7D69@AM0PR03MB4305.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EIyH6XzrvAHgxgtYiLkJq8STRukS7ay8DOP2bvKnc35q0I8Rb2mlxvrJO6L1LsWX760sPD56ftxu+NVliRn0MbPPHLX6bkBS//mm4C4V4o2GfDjWjz1Tli52kVXiCZoEcVytmQdp6ofp3qlsDsOs2y/fhqkvnHrOjfVg2jqsipZ9DMyAzmM2SUHkbzNlayqAcNI2XNC7lcbPWIdSlXNVP1Ie7545zGgBmNkFYHvZcB4NS1Q4m06Pohp10stoHo664s5Z0weJLgkvtDTtC+1o3R46cAaNr4UHSjn8xM5gXPV/UIXDbvM3YnWm9iO3p1Ybtv+/qwHs/6uyBZ261X9T5R/nfJhC2PdzjyA6RtRJqeDSWaMaW1G7sxuBvDNumoZje5EhulauwSJZ2TCLD+9qycybaMFSPxK1kCoXS80LGeID4XxjnSTrKP6Rh4EuDvrtzu+Qglhv1UvhEEsHeCgE6Bwjnqu2OBaPFt17fDIh/pB7SQ4tisgs3N59T+Sqf6CdraUwUCiWZ3aKSLdUCf/dkJW9fJZXwWWjbPniUo1FaW+yN5r7Z3moyQPDatDAlyoh963CasvFkbrOao6vyEblGs0ev0w+sgSsAVCJir8P9wrYaDu5uW2qlu3fGy6ho78vy43O2flyHnZHjVy+hLh2XE1RlHWlDzu/f8LQDAEG1kI0flKC3lbZ7gyj7adJ6PMNcbR9Do6bznTJTcSqQAs5YJlAoMdrbBlgiVlNc+h5YicBWcKHThRxGPgFW+n60Szk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(6486002)(66946007)(2616005)(66476007)(55236004)(186003)(5660300002)(36756003)(316002)(26005)(86362001)(8936002)(6512007)(110136005)(64756008)(71200400001)(31686004)(76116006)(66446008)(54906003)(8676002)(53546011)(6506007)(66556008)(91956017)(478600001)(2906002)(38100700002)(38070700005)(4326008)(31696002)(83380400001)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VFRvRG5UY2ZSM1JrL3B2VHU3L0hlajR5SFdBdW5mNXJpT1d1NUpVL0Zkd0N0?=
 =?utf-8?B?ZEh6M3BhL1ltVUhuQmJEMU1TQmZQbGF2bXFTZmZNN3ZmMnRWeWVDOExBdFRY?=
 =?utf-8?B?WHVyWkpGaGVLdVQxZ2hjZ3ZhbWxMUi90ZXY2cmY3bFdXL2pHWDdTdURRVlo5?=
 =?utf-8?B?OEkwUkZBQ2hSNmtYT0NzaUhPK2xiQ1FIc2RGV2NQWmVOVG02NFM0K00rMkZD?=
 =?utf-8?B?aVpFZm9tUit2ZEE0UElwTzRzM1psc3dIWlArN0didk8vakU0RjhJVXk5MjJo?=
 =?utf-8?B?L0NRU000ckF4bkRxN0xrVVRxdDA2MWgvWURWR2krbWxTUEo0WXk2eit1bi9U?=
 =?utf-8?B?ZVlqZ3FQbCtJOGZIR0FMTXl4UGdhQ0k1UFk2b0UyTWRlWlFBOVdpYng1Wk1K?=
 =?utf-8?B?UHZPcmt6Z2ZXRTBBeHF1c0xJM2p1RUQ2TngyMGczRFVXbGEwTnExRVNHSVlR?=
 =?utf-8?B?SmMxNnh2QklGa0Mydmx2NGNVUFcxd2wvemEraWsxS1g4SnB5d0s1WGRUNjJa?=
 =?utf-8?B?K0hEQ2FkamFxZkttcXhLMGRIZml1bTl1dFRpWU16VVB3c1lJQVE1OXhkZE5M?=
 =?utf-8?B?Ui9yRzIvd3lHTDRRa0lPd3QxZEh1TnVSZjVHTWhqcUdoRGFHZmJvUjUxcjZ2?=
 =?utf-8?B?MGpKczdNeGtoV1Vqa1Y0a2RRSkpXY09GVmZ6ZVdjYm1JT0hFVHVXWEx1Nk54?=
 =?utf-8?B?TEdzTG0xNTc0OHRGN0J4Vm1weG0wdUdTeW9HVnJQL1VCSTZqZUp6bkM5R2ND?=
 =?utf-8?B?WDdmWWhoV0xNME5zeUU5UGFJSS9vVGVNOFdzYm9mV1dzd2VueENGTFNYaTkz?=
 =?utf-8?B?QzF3ck1VbHI4NTFhQjdheEIvcWZaU2k0NmRxOFlBOWVMWTByejZZZnNQM3cx?=
 =?utf-8?B?VHhQeVVuZlA0eVdudldySDdRMlFva0lzeVhXQzc2RlBXd3NmRTlXVmN0emxE?=
 =?utf-8?B?U1Z0L1ZDVWNkMkRhK1ZGbStHODdac2VoZFpQT09RdlIwdFhqQWVvdVhsU1pB?=
 =?utf-8?B?S2dkN3RjNHpTdjhkd2tVbDZYSnY1enAwcWNxN2drZ2gydzQxWGdKT3QrZnlO?=
 =?utf-8?B?QStVaVVJMjJhNjM3Z3lIQUdQYnkyRFRBUjRjeXFLMUxFblF1d0FWam9TQWFy?=
 =?utf-8?B?anVlK1ZveVluMXFHeWhTTXMwVkpxRmR1eGpXUkVibHBkNitDTkE5WEJCaDdD?=
 =?utf-8?B?MjRDMElhRzR5VlRiemYvM0prTktiR3ZiN0k3Y29VWFJ1YmNFaTlpSkVsMWcv?=
 =?utf-8?B?ME9JL2dDVCtEdFcxdTlZdUVDYWxuK2lNbWR6Q2xSaEZSVDNRMEhTb2xkMzg0?=
 =?utf-8?B?b0VCNmc3ZVJ2d3lYenFjMFBtTlFKR21aNTNha2VwNUhtbDJnYVBFNzRxOFBU?=
 =?utf-8?B?QVNaSkZWRzlGcHdzeEtBQ2FBci9RNlV0aVkrYXFPa3B0MFFqNnpkVGVJM3FL?=
 =?utf-8?B?QVRSUmJIdFU5dEpxcTBKMFFna1o5T1V1dmIyRHZPbXFGanlxdUUvVFRCZ2ZG?=
 =?utf-8?B?eDU4WndoZWVhK3lTelFPbTl2ZG1oTGlYeUN2OFNDOGhsR2lsejh1ejNZYUh5?=
 =?utf-8?B?eS9zOFlHRHE1TlBVeHcydG1mQUZ0TFg3dGkwNmhXTVVoYmdKUmNpRjllR1E0?=
 =?utf-8?B?MCtFak1sSFdZSllFYlNDZDdxMFRpVS9QVnRvdXluTXB0enhuMUw4MDZaek5k?=
 =?utf-8?B?RTJPa2RPOVFQMzdKT1JqbDVhSVBRQlZqUFRmSkYzTVNGRXJZTnhhVi93UnQv?=
 =?utf-8?B?Uyt0UnBRNWRnekYvT1dYUmlNWlFvRFdYVktsMDJlUFo2TWtwclJtUERodGIw?=
 =?utf-8?B?b2tDbDdWRTRkdU0rZDAyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E7C776A2AD0EA45AA99AF0A3C2E69EC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8378c9-8315-400c-0312-08d974638dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 14:01:57.8327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FDe3abXQ8IyzNuukeDbeWUxSNxT/hglfZashJtw9cN27aYM0a830HJPNiaDjNqBb/TvVyHGC6xYgMxpLWE+OpMbajI01hht4vTMPvTX07vpMEW6aIvudjemM9mwEr/sW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4305
X-Proofpoint-GUID: 4u3ouQh2CPlNMZ1LK501c-TPDK21liSf
X-Proofpoint-ORIG-GUID: 4u3ouQh2CPlNMZ1LK501c-TPDK21liSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100080

DQpPbiAxMC4wOS4yMSAxNjoxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPg0KPg0KPiBPbiAxMC8w
OS8yMDIxIDEzOjM3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEhpLCBKdWxp
ZW4hDQo+DQo+IEhpIE9sZWtzYW5kciwNCj4NCj4+IE9uIDA5LjA5LjIxIDIwOjU4LCBKdWxpZW4g
R3JhbGwgd3JvdGU6DQo+Pj4gT24gMDMvMDkvMjAyMSAwOTozMywgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4gSG9zdCBicmlkZ2UgY29udHJv
bGxlcidzIEVDQU0gc3BhY2UgaXMgbWFwcGVkIGludG8gRG9tYWluLTAncyBwMm0sDQo+Pj4+IHRo
dXMgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHRyYXAgdGhlIHNhbWUgZm9yIHZQQ0kgdmlhIE1NSU8g
aGFuZGxlcnMuDQo+Pj4+IEZvciB0aGlzIHRvIHdvcmsgd2UgbmVlZCB0byBub3QgbWFwIHRob3Nl
IHdoaWxlIGNvbnN0cnVjdGluZyB0aGUgZG9tYWluLg0KPj4+Pg0KPj4+PiBOb3RlLCB0aGF0IGR1
cmluZyBEb21haW4tMCBjcmVhdGlvbiB0aGVyZSBpcyBubyBwY2lfZGV2IHlldCBhbGxvY2F0ZWQg
Zm9yDQo+Pj4+IGhvc3QgYnJpZGdlcywgdGh1cyB3ZSBjYW5ub3QgbWF0Y2ggUENJIGhvc3QgYW5k
IGl0cyBhc3NvY2lhdGVkDQo+Pj4+IGJyaWRnZSBieSBTQkRGLiBVc2UgZHRfZGV2aWNlX25vZGUg
ZmllbGQgZm9yIGNoZWNrcyBpbnN0ZWFkLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4+IC0tLQ0KPj4+PiDCoMKgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuY8KgwqDCoMKgwqDC
oMKgIHzCoCAzICsrKw0KPj4+PiDCoMKgIHhlbi9hcmNoL2FybS9wY2kvZWNhbS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDE3ICsrKysrKysrKysrKysrKysrDQo+Pj4+IMKgwqAgeGVuL2FyY2gv
YXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysNCj4+
Pj4gwqDCoCB4ZW4vaW5jbHVkZS9hc20tYXJtL3BjaS5owqDCoMKgwqDCoMKgwqDCoMKgIHwgMTIg
KysrKysrKysrKysrDQo+Pj4+IMKgwqAgNCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCsp
DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4gaW5kZXggZGE0MjdmMzk5NzExLi43NmY1
YjUxMzI4MGMgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0K
Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4gQEAgLTEyNTcsNiAr
MTI1Nyw5IEBAIHN0YXRpYyBpbnQgX19pbml0IG1hcF9yYW5nZV90b19kb21haW4oY29uc3Qgc3Ry
dWN0IGR0X2RldmljZV9ub2RlICpkZXYsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+
Pj4gwqDCoMKgwqDCoMKgIH0NCj4+Pj4gwqDCoCArwqDCoMKgIGlmICggbmVlZF9tYXBwaW5nICYm
IChkZXZpY2VfZ2V0X2NsYXNzKGRldikgPT0gREVWSUNFX1BDSSkgKSA+ICvCoMKgwqDCoMKgwqDC
oCBuZWVkX21hcHBpbmcgPSBwY2lfaG9zdF9icmlkZ2VfbmVlZF9wMm1fbWFwcGluZyhkLCBkZXYs
DQo+Pj4gYWRkciwgbGVuKTsNCj4+Pg0KPj4+IEFGQUlDVCwgd2l0aCBkZXZpY2VfZ2V0X2NsYXNz
KGRldiksIHlvdSBrbm93IHdoZXRoZXIgdGhlIGhvc3RicmlkZ2UgaXMgdXNlZCBieSBYZW4uIFRo
ZXJlZm9yZSwgSSB3b3VsZCBleHBlY3QgdGhhdCB3ZSBkb24ndCB3YW50IHRvIG1hcCBhbGwgdGhl
IHJlZ2lvbnMgb2YgdGhlIGhvc3RicmlkZ2VzIGluIGRvbTAgKGluY2x1ZGluZyB0aGUgQkFScyku
DQo+Pj4NCj4+PiBDYW4geW91IGNsYXJpZnkgaXQ/DQo+PiBXZSBvbmx5IHdhbnQgdG8gdHJhcCBF
Q0FNLCBub3QgTU1JT3MgYW5kIGFueSBvdGhlciBtZW1vcnkgcmVnaW9ucyBhcyB0aGUgYnJpZGdl
IGlzDQo+Pg0KPj4gaW5pdGlhbGl6ZWQgYW5kIHVzZWQgYnkgRG9tYWluLTAgY29tcGxldGVseS4g
DQo+DQo+IFdoYXQgZG8geW91IG1lYW4gYnkgInVzZWQgYnkgRG9tYWluLTAgY29tcGxldGVseSI/
IFRoZSBob3N0YnJpZGdlIGlzIG93bmVkIGJ5IFhlbiBzbyBJIGRvbid0IHRoaW5rIHdlIGNhbiBs
ZXQgZG9tMCBhY2Nlc3MgYW55IE1NSU8gcmVnaW9ucyBieQ0KPiBkZWZhdWx0Lg0KDQpOb3cgaXQn
cyBteSB0aW1lIHRvIGFzayB3aHkgZG8geW91IHRoaW5rIFhlbiBvd25zIHRoZSBicmlkZ2U/DQoN
CkFsbCB0aGUgYnJpZGdlcyBhcmUgcGFzc2VkIHRvIERvbWFpbi0wLCBhcmUgZnVsbHkgdmlzaWJs
ZSB0byBEb21haW4tMCwgaW5pdGlhbGl6ZWQgaW4gRG9tYWluLTAuDQoNCkVudW1lcmF0aW9uIGV0
Yy4gaXMgZG9uZSBpbiBEb21haW4tMC4gU28gaG93IGNvbWVzIHRoYXQgWGVuIG93bnMgdGhlIGJy
aWRnZT8gSW4gd2hhdCB3YXkgaXQgZG9lcz8NCg0KWGVuIGp1c3QgYWNjZXNzZXMgdGhlIEVDQU0g
d2hlbiBpdCBuZWVkcyBpdCwgYnV0IHRoYXQncyBpdC4gWGVuIHRyYXBzIEVDQU0gYWNjZXNzIC0g
dGhhdCBpcyB0cnVlLg0KDQpCdXQgaXQgaW4gbm8gd2F5IHVzZXMgTU1JT3MgZXRjLiBvZiB0aGUg
YnJpZGdlIC0gdGhvc2UgdW5kZXIgZGlyZWN0IGNvbnRyb2wgb2YgRG9tYWluLTANCg0KPg0KPiBJ
biBwYXJ0aWN1bGFyLCB3ZSBtYXkgd2FudCB0byBoaWRlIGEgZGV2aWNlIGZyb20gZG9tMCBmb3Ig
c2VjdXJpdHkgcmVhc29ucy4gVGhpcyBpcyBub3QgZ29pbmcgdG8gYmUgcG9zc2libGUgaWYgeW91
IG1hcCBieSBkZWZhdWx0IGV2ZXJ5dGhpbmcgdG8gZG9tMC4NCg0KVGhlbiB0aGUgYnJpZGdlIG1v
c3QgcHJvYmFibHkgd2lsbCBiZWNvbWUgdW51c2FibGUgYXMgd2UgZG8gbm90IGhhdmUgcmVsZXZh
bnQgZHJpdmVycyBpbiBYZW4uDQoNCkF0IGJlc3Qgd2UgbWF5IHJlbHkgb24gdGhlIGZpcm13YXJl
IGRvaW5nIHRoZSBpbml0aWFsaXphdGlvbiBmb3IgdXMsIHRoZW4geWVzLCB3ZSBjYW4gY29udHJv
bCBhbiBFQ0FNIGJyaWRnZSBpbiBYZW4uDQoNCkJ1dCB0aGlzIGlzIG5vdCB0aGUgY2FzZSBub3c6
IHdlIHJlbHkgb24gRG9tYWluLTAgdG8gaW5pdGlhbGl6ZSBhbmQgc2V0dXAgdGhlIGJyaWRnZQ0K
DQo+DQo+IEluc3RlYWQsIHRoZSBCQVJzIHNob3VsZCBiZSBtYXBwZWQgb24gZGVtYW5kIHdoZW4g
ZG9tMCB3aGVuIHdlIHRyYXAgYWNjZXNzIHRvIHRoZSBjb25maWd1cmF0aW9uIHNwYWNlLg0KPg0K
PiBGb3Igb3RoZXIgcmVnaW9ucywgY291bGQgeW91IHByb3ZpZGUgYW4gZXhhbXBsZSBvZiB3aGF0
IHlvdSBhcmUgcmVmZXJyaW5nIHRvbz8NClJlZ2lzdGVycyBvZiB0aGUgYnJpZGdlIGZvciBleGFt
cGxlLCBhbGwgd2hhdCBpcyBsaXN0ZWQgaW4gInJlZyIgcHJvcGVydHkNCj4NCj4+Pj4gKw0KPj4+
PiArwqDCoMKgIC8qDQo+Pj4+ICvCoMKgwqDCoCAqIFdlIGRvIG5vdCB3YW50IEVDQU0gYWRkcmVz
cyBzcGFjZSB0byBiZSBtYXBwZWQgaW4gZG9tYWluJ3MgcDJtLA0KPj4+PiArwqDCoMKgwqAgKiBz
byB3ZSBjYW4gdHJhcCBhY2Nlc3MgdG8gaXQuDQo+Pj4+ICvCoMKgwqDCoCAqLw0KPj4+PiArwqDC
oMKgIHJldHVybiBjZmctPnBoeXNfYWRkciAhPSBhZGRyOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+
IMKgwqAgLyogRUNBTSBvcHMgKi8NCj4+Pj4gwqDCoCBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1fb3Bz
IHBjaV9nZW5lcmljX2VjYW1fb3BzID0gew0KPj4+PiDCoMKgwqDCoMKgwqAgLmJ1c19zaGlmdMKg
ID0gMjAsDQo+Pj4+IEBAIC02MCw2ICs3Niw3IEBAIGNvbnN0IHN0cnVjdCBwY2lfZWNhbV9vcHMg
cGNpX2dlbmVyaWNfZWNhbV9vcHMgPSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yZWFk
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gcGNpX2dlbmVyaWNfY29uZmln
X3JlYWQsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53cml0ZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPSBwY2lfZ2VuZXJpY19jb25maWdfd3JpdGUsDQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5yZWdpc3Rlcl9tbWlvX2hhbmRsZXLCoCA9IHBjaV9lY2FtX3JlZ2lz
dGVyX21taW9faGFuZGxlciwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uZWVkX3AybV9tYXBwaW5n
wqDCoMKgwqDCoMKgID0gcGNpX2VjYW1fbmVlZF9wMm1fbWFwcGluZywNCj4+Pj4gwqDCoMKgwqDC
oMKgIH0NCj4+Pj4gwqDCoCB9Ow0KPj4+PiDCoMKgIGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
cGNpL3BjaS1ob3N0LWNvbW1vbi5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24u
Yw0KPj4+PiBpbmRleCBhODkxMTJiZmJiN2MuLmMwNGJlNjM2NDUyZCAxMDA2NDQNCj4+Pj4gLS0t
IGEveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYw0KPj4+PiArKysgYi94ZW4vYXJj
aC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+Pj4+IEBAIC0zMzQsNiArMzM0LDI4IEBAIGlu
dCBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4gwqDCoMKg
wqDCoMKgIH0NCj4+Pj4gwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+PiDCoMKgIH0NCj4+Pj4g
Kw0KPj4+PiArYm9vbCBwY2lfaG9zdF9icmlkZ2VfbmVlZF9wMm1fbWFwcGluZyhzdHJ1Y3QgZG9t
YWluICpkLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGR0X2RldmljZV9u
b2RlICpub2RlLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgYWRkciwgdWludDY0
X3QgbGVuKQ0KPj4+PiArew0KPj4+PiArwqDCoMKgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJy
aWRnZTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoIGJyaWRnZSwg
JnBjaV9ob3N0X2JyaWRnZXMsIG5vZGUgKQ0KPj4+PiArwqDCoMKgIHsNCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGlmICggYnJpZGdlLT5kdF9ub2RlICE9IG5vZGUgKQ0KPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb250aW51ZTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCAh
YnJpZGdlLT5vcHMtPm5lZWRfcDJtX21hcHBpbmcgKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gdHJ1ZTsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGJy
aWRnZS0+b3BzLT5uZWVkX3AybV9tYXBwaW5nKGQsIGJyaWRnZSwgYWRkciwgbGVuKTsNCj4+Pj4g
K8KgwqDCoCB9DQo+Pj4+ICvCoMKgwqAgcHJpbnRrKFhFTkxPR19FUlIgIlVuYWJsZSB0byBmaW5k
IFBDSSBicmlkZ2UgZm9yICVzIHNlZ21lbnQgJWQsIGFkZHIgJWx4XG4iLA0KPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbm9kZS0+ZnVsbF9uYW1lLCBicmlkZ2UtPnNlZ21lbnQsIGFkZHIpOw0K
Pj4+PiArwqDCoMKgIHJldHVybiB0cnVlOw0KPj4+PiArfQ0KPj4+DQo+Pj4gSWYgeW91IHJlYWxs
eSBuZWVkIHRvIG1hcCB0aGUgaG9zdGJyaWRnZXMsIHRoZW4gSSB3b3VsZCBzdWdnZXN0IHRvIGRl
ZmVyIHRoZSBQMk0gbWFwcGluZ3MgZm9yIGFsbCBvZiB0aGVtIGFuZCB0aGVuIHdhbGsgYWxsIHRo
ZSBicmlkZ2UgaW4gb25lIGdvIHRvIGRvIHRoZSBtYXBwaW5ncy4NCj4+Pg0KPj4+IFRoaXMgd291
bGQgYXZvaWQgZ29pbmcgdGhyb3VnaCB0aGUgYnJpZGdlcyBldmVyeSB0aW1lIGR1cmluZyBzZXR1
cC4NCj4+DQo+PiBXZWxsLCB0aGlzIGNhbiBiZSBkb25lLCBidXQ6IG15IGltcGxlbWVudGF0aW9u
IHByZXZlbnRzIG1hcHBpbmdzIGFuZCB3aGF0DQo+Pg0KPj4geW91IHN1Z2dlc3Qgd2lsbCByZXF1
aXJlIHVubWFwcGluZy4gU28sIHRoZSBjb3N0IGluIG15IHNvbHV0aW9uIGlzIHdlIG5lZWQNCj4+
DQo+PiB0byBnbyBvdmVyIGFsbCB0aGUgYnJpZGdlcyAodW50aWwgd2UgZmluZCB0aGUgb25lIHdl
IG5lZWQpIGFuZCBpbiB3aGF0IHlvdQ0KPj4NCj4+IHN1Z2dlc3Qgd2UnbGwgbmVlZCB0byB1bm1h
cCB3aGF0IHdlIGhhdmUganVzdCBtYXBwZWQuDQo+Pg0KPj4gSSB0aGluayBwcmV2ZW50aW5nIHVu
bmVlZGVkIG1hcHBpbmdzIGlzIGNoZWFwZXIgdGhhbiB1bm1hcHBpbmcgYWZ0ZXJ3YXJkcy4NCj4N
Cj4gSSB0aGluayB5b3UgbWlzdW5kZXJ0b29kIHdoYXQgSSBhbSBzdWdnZXN0aW5nLiBXaGF0IEkg
c2FpZCBpcyB5b3UgY291bGQgZGVmZXIgdGhlIG1hcHBpbmdzIChJT1cgbm90IGRvIHRoZSBtYXBw
aW5nKSB1bnRpbCBsYXRlciBmb3IgdGhlIGhvc3RicmlkZ2VzLg0KDQpGb3IgZWFjaCBkZXZpY2Ug
dHJlZSBkZXZpY2Ugd2UgY2FsbA0KDQpzdGF0aWMgaW50IF9faW5pdCBtYXBfcmFuZ2VfdG9fZG9t
YWluKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LA0KIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHU2NCBhZGRyLCB1NjQgbGVuLA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKmRhdGEpDQp3aGlj
aCB3aWxsIGNhbGwNCg0KIMKgwqDCoMKgwqDCoMKgIHJlcyA9IG1hcF9yZWdpb25zX3AybXQoZCwN
ClNvLCBFQ0FNIHdpbGwgYmUgbWFwcGVkIGFuZCB0aGVuIHdlJ2xsIG5lZWQgdG8gdW5tYXAgaXQN
Cg0KPiBBbmQgdGhlbiB5b3UgY2FuIHdhbGsgYWxsIHRoZSBob3N0YnJpZGdlcyB0byBkZWNpZGUg
aG93IHRvIG1hcCB0aGVtLg0KV2UgZG9uJ3Qgd2FudCB0byBtYXAgRUNBTSwgd2Ugd2FudCB0byB0
cmFwIGl0DQo+DQo+IFRoZSByZWdpb25zIHdpbGwgb25seSBtYXBwZWQgb25jZSBhbmQgbmV2ZXIg
YmUgdW5tYXBwZWQuDQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

