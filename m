Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07EE409668
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 16:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185746.334462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnJq-0003go-Hk; Mon, 13 Sep 2021 14:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185746.334462; Mon, 13 Sep 2021 14:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnJq-0003eh-EJ; Mon, 13 Sep 2021 14:52:26 +0000
Received: by outflank-mailman (input) for mailman id 185746;
 Mon, 13 Sep 2021 14:52:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuNF=OD=epam.com=prvs=989052e8b7=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mPnJp-0003ea-6c
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 14:52:25 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34a3464c-14a2-11ec-b3b9-12813bfff9fa;
 Mon, 13 Sep 2021 14:52:24 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DDxnx3027407; 
 Mon, 13 Sep 2021 14:52:22 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b279tge92-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 14:52:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3588.eurprd03.prod.outlook.com (2603:10a6:208:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 14:52:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 14:52:19 +0000
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
X-Inumbo-ID: 34a3464c-14a2-11ec-b3b9-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky9tQ3KiIZgtYcW4j0kyLF/cXcrsKAuV0Hc7M0COPMaN1aUo/pBiZtx9u9V207WQzUtYhcGTtDo+KTYtUp9d3cTLtyCtOO9Cs4DvZDaP6HVK3N0gBMaocClBv1o+n9JkomGV4RrpY8cazjw7xgVgdXhh2MGRM1jfHcsZXiwzFofDIMKP/6VR1kZMJ09AV6GI0TmqXcuUsznd5cHV83XMKVn5GJ274EuqnU3/X0Nn+vkw9VAw4D39Pe60y37wc8/TovKZ7c3B2r8NF2npF6UfKJA6LYCzDba2OQaO3zAs/zPj6EQhk9RqdVoGATyQ3/yGTHRfB/VOMuK/brSV2kyiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0ldnG/GMbT4VccrgdRTQVXDGlqcsYzq98mP0a7Rai3I=;
 b=EMUAk3SHkmAa1gTVnFHvR5VNxFEE+nQTzXwAnNRQ3bEF9ndOXrM52kdAw8WpeWonMrisk2xQhT2QmDw4m+PqOTRFSFrdjR7YP1PGMZEagWrWYstarZueAjw9QW/+DmFEKpLuK5Lle7xbh0M7VxlfwbG8Uu6FbNUtadPu+PsdayQuB0Xq+b1TEwXE1o5MFULILJWC00w9SLgMTDfwqQBMel1rabqCMzTJuewc2RWbCW0f+V08+8NK43Tr5xDXNf+v+4fIiv2+FXGAPlH0KM8nQ6n0vqyO7QmFXO4iCfzpY2zUDx2trN1J7H3Fc2S15RKGJgabEWYI+PpqIkN8iN28mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ldnG/GMbT4VccrgdRTQVXDGlqcsYzq98mP0a7Rai3I=;
 b=P3nG/qiP+eps97pJzR5c2YOkjBe0TshBSma0roSN6x+fXZeq4GUHvmiGEAApbzyFIjaMYEVKIMevnzSXrLrJ/rGv6ApwEEtaggnspOU+pr27ophRevFPM9Hc5rr7bSsP0JvaH+OWU7V+6CO5FHOOVXqCgUpMunQBnPcwuvCSO5U916KOfH50F4M/Ud+m7IrK8Ta6LTdg4UM3JjO+2MD1mZ0wE6Kv+G2pMxUxTsDhTjY7cJ6MIgnaGMhsoN3EYfOKzJrL0RXbzzjI+x5R0gigADSH5AlsDE8Ttlb8/AQzAYYgh7JNaBEXji2cF8Fd4fonyD7D+wjjCstKxai0W1YIBQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN on
 ARM
Thread-Topic: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN
 on ARM
Thread-Index: AQHXqK7zTKPAnBLuBkixTqpTrxO8Dg==
Date: Mon, 13 Sep 2021 14:52:18 +0000
Message-ID: <c9484b8e-cad5-d4e4-a25f-749035fe5859@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
In-Reply-To: 
 <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 647da388-103a-400a-ad2e-08d976c615ca
x-ms-traffictypediagnostic: AM0PR03MB3588:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB358859A020CA3123B27C0F38E7D99@AM0PR03MB3588.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 otq8j1HdBH52E8OIOkynUqkKQleEvke4jG7rcrRMq/bGgARAuNzVSxBm4OXte9Bq714V7b8i/6hTH0MyO2ObJOTYf7aDKOPo/lgcGyIjZzuuiCB7UD00WO3l++wiSXvxRPRpUm3jleVGIM3gPZ369JUNbx7iG0QYrHHVzl0OQ0SeLJ7bAInfmrMA21aF9E7AAK/e4UFeOudtJLj8Y0na1jCMI2Mvca2mdINjoqGVAUfiit4jcs4RzgIdefI+iyX2tVpfEKMgSnUsuXD6zlTutNMFqAZLVAhgPoI4YM7XEqxttsQ/e8Gy6G5C4pF7CPWENfs+d0n6/Ce+nuMPMOA08y7eayRdFW/0Hx5t9CybDKGoRtXIXabeyrrPW0xBHA4OtAyxtdJkH10RXf8yOKGcZ8+HuiDn4/UZtCc3M0FjZ4InRRexz0+qwMop+q3RMoBfxfrvL5UtyxZqPGMVZGqZDCK5u/RNgJLhx8NllZkyas/aS0/DHhA5cN3r0U1dHg8MHFwD71pnUjXNfMnxyItao6AVG65Pxf1Swc4LMSmrrBz3q0PkDdEnmqqkd/4MP+aYc+86Btd9s5+FHc2HDYy4QRItnewJ8GqrrRMGMiB1MCFR5O8w3cTiiL8lTESTZdaX8cEs9N0BHXw4J1k5tintSTEqmauvIeAKS9OqCMGcDoFnj72Ljhm9EvIGoZlgP3fswAnrqg0k2wLxuxKiKA2jb1ncQNPpdMh6BmAcj11aKj23t4HP5RXEQEKF1v4fUY13
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(8676002)(6486002)(55236004)(8936002)(31686004)(2616005)(478600001)(186003)(26005)(53546011)(107886003)(6506007)(38070700005)(2906002)(6512007)(91956017)(76116006)(86362001)(5660300002)(38100700002)(110136005)(54906003)(122000001)(71200400001)(66946007)(66556008)(64756008)(66446008)(316002)(4326008)(66476007)(31696002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0g0cER3MnZWTHg4ZTNFZ3ZDWXh2RDlaWjZJaGJ4T1pOSHA1Zlk3UEpXOFpL?=
 =?utf-8?B?MXRiMkg0UkRKK3crTUJqVE5vbHQyN094Vk1nOVk1d3RtOENUK3lyY2RjWWx1?=
 =?utf-8?B?VVVsSVJkQkJoRk5iQktXaW1NaERtYjFlZ3I0OTlrQU1xTHdCeGFhOEx3RWQ4?=
 =?utf-8?B?d2NRcTFZeGpFOC8xTTIvT0tNM3pnWVBEeXNoazQyNXpUMEp3RjQwT1laTG4x?=
 =?utf-8?B?MlJDVzlFL2J2cUVFUmw3a01DZi8yczVYdXIyWU1Uc2RnemVOSk95dHo0bUt1?=
 =?utf-8?B?STh0VURNd1JKek0yTE5keUZMUFVJM21xeDM3MkN3VGhQRnhyVEhMSHl6cFNC?=
 =?utf-8?B?bXBFcWZBdDJzZzdidFpZWXY1SDlSejJyUHlFM0pTOGFSZENoa1FvOUlpV05n?=
 =?utf-8?B?ODgxR1huN1A1WkJBUGhTWjhRNEZtdkdUTmFKeE93QzJwQUJzbWltQStyRTdq?=
 =?utf-8?B?NWZxNTNJTVhCeWZUbXZVc3l5UitaWDhrUWdpblg1OWFSelFKcHNacmhJK2FR?=
 =?utf-8?B?NUlXTGtoeDRiN0ozNG5Tajlud0JLWUl5ZW1yYndERUFxRUZrbkFSdStaSDh0?=
 =?utf-8?B?QTF3ckQ3MHBpUUEwZGRzaEtnb2tGRmlDV0VCZWN0SWQwVVVuVEVkSEhRSkly?=
 =?utf-8?B?SDFweE5VMmFESUFhbDBhbjhCR3ljVTFZQWVHNnpORk1yOVZtYXo4cEFuUDhF?=
 =?utf-8?B?K0FReDNBK3RKd3BNM1gvNDFmZmpVWDJ4UnFrM3FjTG5lMVBMdFdaT2MvUHEy?=
 =?utf-8?B?ZVN5QXFLa1ZjZ3dKNUZST3gvT1dvRVQ5MGVJS2pUY3QyZ0tDNmVSMHhNNUlw?=
 =?utf-8?B?L3lKZjR5d25qekRzVW4vNm8xbU1PMExXSUlNZHdpdjRNaWNuaW9FZmd0bGxm?=
 =?utf-8?B?UDhoTVAvUW95Ri9CVFlTcnNzeTFmVTNiM3lFQnJOQ3Q1OEhiYVVlUEIyMzNo?=
 =?utf-8?B?ZHVYbEIyS00vWGlYUFZMbFUrWk5LZ0NGZzhGQlNaU0tNZ2VDWDMwV0NRdjdV?=
 =?utf-8?B?WlplYzJ4QS9DbVpEMjRGb0VJRjQvQmpWSXVVM3RtNWVidi9LaXgyOFhFcWVk?=
 =?utf-8?B?ZkxISEJFaDUyQnVTUDRaRWFia1YrYlBNU1JpRXhtR0ZhRDg0MFFrcVZSbUJ1?=
 =?utf-8?B?aTI4bi9vRm50eXVHR1BuNFgxWUZBNUlKdnhCVEhhNm52UTY2cGtCK3N2b1My?=
 =?utf-8?B?bWF5TUErdHpIZE84N1lPenRacnlnV3ZvR2UyMWkxU3JxWmFtV1pFVjhqaTky?=
 =?utf-8?B?VHRKTlJPZ0NkaHUwMDFQSnBRUWFwZ2crQXlpRjgzWU1JOUJyTTljMjdPdE5l?=
 =?utf-8?B?YXhDYkVrN3JJeldFQlFVVUNHSXFVMk9QbmNwdy82S3h0WUZoVzZ0OWp4cElL?=
 =?utf-8?B?N1huL2U4bDZQTDExVWtLOWlRaEJqUnp1SVdmLzVrNFo1Q0laWEUvVHBya2xY?=
 =?utf-8?B?U3l4aGFXMkMxMGM2aXhZQ0lqbUN5Q1RpZ0dOL3podWJVYmw1NG1aRzhsSk1p?=
 =?utf-8?B?d3dDM3B5YUxKWC9EaXBNblljL2tnMXUvY3N4NC9zNEFvL0gyMUpYY25LamNl?=
 =?utf-8?B?TnRHVjhMWDRpbElINDgyTHRjV1VWVFVPOGhkVG5hNUdvWGcrRGdkajNGS2RV?=
 =?utf-8?B?NVNNRkVmdnNSaEQ5OGVLSEE1bjcxV2o5bU5OT29Gb1gxdTdKclp2TmdIbUp1?=
 =?utf-8?B?UmxYaFFWN3BkMWlvclBLNVhGbHVkOERkb1NhMmR3a2p3cmFCYXMvdUg5MXM4?=
 =?utf-8?B?dThpMkFscjllZlplYlNyY0lON2RCRkR4Nm5xdVlQbnZtbUI0QUZyeFYwWGha?=
 =?utf-8?B?UWpLUjFtZCtVVjNKRXg3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <067FF25794C5E24989DEA2554A0D9548@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647da388-103a-400a-ad2e-08d976c615ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 14:52:19.0254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ImIyrux7fW54OZcQZxvha7GPNItiWiEUQQZHvSat+NiNJAuaFbzJRxMqVnWo+fACmHzjIDRKGv4ROncnWbMOWfvsvV4h81fD82jitxAPTRmT4KRqjG+g7eWssCkxTg94
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3588
X-Proofpoint-GUID: gXodqNg7eyifdCn9Nm136iFSUQ8wSwj_
X-Proofpoint-ORIG-GUID: gXodqNg7eyifdCn9Nm136iFSUQ8wSwj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_07,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130098

SGksIFJhaHVsIQ0KDQpPbiAxOS4wOC4yMSAxNTowMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+IFhF
TiBkdXJpbmcgYm9vdCB3aWxsIHJlYWQgdGhlIFBDSSBkZXZpY2UgdHJlZSBub2RlIOKAnHJlZ+KA
nSBwcm9wZXJ0eQ0KPiBhbmQgd2lsbCBtYXAgdGhlIFBDSSBjb25maWcgc3BhY2UgdG8gdGhlIFhF
TiBtZW1vcnkuDQpbc25pcF0NCj4gK3N0YXRpYyBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgKmdl
bl9wY2lfaW5pdChzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZWNhbV9yZWdfaWR4KQ0KPiArew0K
PiArICAgIGludCBlcnI7DQo+ICsgICAgc3RydWN0IHBjaV9jb25maWdfd2luZG93ICpjZmc7DQo+
ICsgICAgcGFkZHJfdCBhZGRyLCBzaXplOw0KPiArDQo+ICsgICAgY2ZnID0geHphbGxvYyhzdHJ1
Y3QgcGNpX2NvbmZpZ193aW5kb3cpOw0KPiArICAgIGlmICggIWNmZyApDQo+ICsgICAgICAgIHJl
dHVybiBOVUxMOw0KPiArDQo+ICsgICAgZXJyID0gZHRfcGNpX3BhcnNlX2J1c19yYW5nZShkZXYs
IGNmZyk7DQo+ICsgICAgaWYgKCAhZXJyICkgew0KPiArICAgICAgICBjZmctPmJ1c25fc3RhcnQg
PSAwOw0KPiArICAgICAgICBjZmctPmJ1c25fZW5kID0gMHhmZjsNCj4gKyAgICAgICAgcHJpbnRr
KFhFTkxPR19FUlIgIiVzOk5vIGJ1cyByYW5nZSBmb3VuZCBmb3IgcGNpIGNvbnRyb2xsZXJcbiIs
DQo+ICsgICAgICAgICAgICAgICBkdF9ub2RlX2Z1bGxfbmFtZShkZXYpKTsNCj4gKyAgICB9IGVs
c2Ugew0KPiArICAgICAgICBpZiAoIGNmZy0+YnVzbl9lbmQgPiBjZmctPmJ1c25fc3RhcnQgKyAw
eGZmICkNCj4gKyAgICAgICAgICAgIGNmZy0+YnVzbl9lbmQgPSBjZmctPmJ1c25fc3RhcnQgKyAw
eGZmOw0KPiArICAgIH0NCj4gKw0KPiArICAgIC8qIFBhcnNlIG91ciBQQ0kgZWNhbSByZWdpc3Rl
ciBhZGRyZXNzKi8NCj4gKyAgICBlcnIgPSBkdF9kZXZpY2VfZ2V0X2FkZHJlc3MoZGV2LCBlY2Ft
X3JlZ19pZHgsICZhZGRyLCAmc2l6ZSk7DQoNCkkgYW0gYSBiaXQgd29ycmllZCBoZXJlIHRoYXQg
d2UgZG9uJ3QgZ2V0IHRoZSByZWcgaW5kZXggZnJvbSB0aGUgZGV2aWNlIHRyZWUsDQoNCmJ1dCBm
b3IgZ2VuZXJpYyBFQ0FNIHdlIHVzZSByZWdbMF0gYW5kIGZvciBYaWxpbnggd2UgdXNlIHJlZ1sy
XS4NCg0KRm9yIGV4YW1wbGUsIGZvciBYaWxpbnggd2UgaGF2ZQ0KDQpyZWcgPSA8MHgwMCAweGZk
MGUwMDAwIDB4MDAgMHgxMDAwIDB4MDAgMHhmZDQ4MDAwMCAweDAwIDB4MTAwMCAweDgwIDB4MDAg
MHgwMCAweDEwMDAwMDA+Ow0KcmVnLW5hbWVzID0gImJyZWdcMHBjaXJlZ1wwY2ZnIjsNCg0Kc28s
IHdlIGNhbiBwYXJzZSB0aGUgcmVnLW5hbWVzIGFuZCB1bmRlcnN0YW5kIHRoYXQgdGhlIGNvbmZp
Z3VyYXRpb24gc3BhY2UgaXMgdGhlIGxhc3QgaW4gdGhlIHJlZyBwcm9wZXJ0eS4NCg0KVGhlIHNh
bWUgSSB0aGluayBjYW4gYmUgZG9uZSBmb3Igb3RoZXIgZGV2aWNlIHRyZWVzIHByb2JhYmx5Lg0K
DQpSYWh1bCwgZG8geW91IGtub3cgaWYgcmVnLW5hbWVzICJjZmciIGlzIHZlbmRvciBzcGVjaWZp
YyBvZiB1c2VkIHdpZGVseT8NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

