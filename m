Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A540A578
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 06:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186102.334836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ0Ae-00022f-LU; Tue, 14 Sep 2021 04:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186102.334836; Tue, 14 Sep 2021 04:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ0Ae-0001zE-Hb; Tue, 14 Sep 2021 04:35:48 +0000
Received: by outflank-mailman (input) for mailman id 186102;
 Tue, 14 Sep 2021 04:35:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pQww=OE=epam.com=prvs=98919bdb76=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQ0Ad-0001z8-5s
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 04:35:47 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a0ce553-1515-11ec-b3f4-12813bfff9fa;
 Tue, 14 Sep 2021 04:35:46 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E3wdqR005744; 
 Tue, 14 Sep 2021 04:35:45 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b2m9x02m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 04:35:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6769.eurprd03.prod.outlook.com (2603:10a6:20b:284::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 04:35:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 04:35:41 +0000
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
X-Inumbo-ID: 3a0ce553-1515-11ec-b3f4-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoOtIWZh2/DPELcvQtLjPhHukonkO3OhkgCvqhSFdHMsA7TZQHhvLdb/ZywRlKhUl9Q2z+vLugtvR93c7ms6RfCYTgCWlOpR5p++t95P23U2wGrHZjqXFTH1beyS4RbTFW6KDb+mes1h/Q2xnBLiQ52nlmfhTdXQcgKQ15rggzwXfCjXG86Suwj9mgQkCF1Z0ezaci83zyWQ7xGUZvlNKhF4d15pJj+/LBNIbs6lAUKDPJJsb1vsBPqulJE8HRGV9t5jD6J+60CxEZwJKuZZ3jSMeBaUV2OuoA/59hE7zeJnMvJ9FjXMsCVhO2qTesdTNa3D2gOg0ytC10H4I0QgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TJOA6MUaPes8jOkE4ItpZOYt9qq325SK+uhICFJLD0k=;
 b=Z3sx2QVMOoqlM82epxinJCXBhciFKZlyKchPYDdKmQJchdjNxcpRp+xQ3v7VK7kcVZThF7uOGDNPgwFVGQPaqvdhske6OzXPMvgKzvjKgWr7GNHo/K4T12el8WTaxQ8zhZzBZ4ZC9o8JwGInvKpS7o0WOlYVLndR6IkHua7EIiB3bHO/QOZrnQd2OdItmottxMBQG8Qi+DHXt07zIx9gumCw+SPqKeg/H6alDzYNEM1Bvf40U5UWQN0rHD4MHoeH8VXlLVI/FlpHyTnjFomrUIMs/HywKeFaOESKo7tq/wlIUbejHKgCFn5sf+kXvJo7eSEf1VwiAg7nHMOOXCWMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJOA6MUaPes8jOkE4ItpZOYt9qq325SK+uhICFJLD0k=;
 b=j4nlQ0ovz1kYKXlWRgUtLdsu4jM/qPTvt0InysPNfaaw8GwKmZ6rTVE52LaoslsS/IrJoQnRsLt1EcHtgPDYS7tNrbYgtw+qWZXwu9P8UJ6H4XZtbDoF0/fSdgGdK8Wpo846ovzgXYBLI7B3bHaWx083do9rjBT+NUI5l7EDDNuIg0s5LcZCPZChhsSy6SNkIHMyD4gPUhI6mi9nE1I3NqGLxJ+B1aA6klFuqQMND4pJqeJ2zLtz1A+unz41+RtY8MI6aT5OHN3980VKsa3JysisMRUpboD1rdLyhAPyD5RlZkfYdKQdtElAV/CUo0SVLAAG0Z6yJ7yo4LEvJ9CAEA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN on
 ARM
Thread-Topic: [PATCH v1 05/14] xen/arm: PCI host bridge discovery within XEN
 on ARM
Thread-Index: AQHXqK7zTKPAnBLuBkixTqpTrxO8DquiaS0AgACJYwA=
Date: Tue, 14 Sep 2021 04:35:41 +0000
Message-ID: <b0fc12be-7228-b1c8-f98c-44adf92bfa16@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <412b6574170d96d6fc4196fab4bb2b9286a770c8.1629366665.git.rahul.singh@arm.com>
 <c9484b8e-cad5-d4e4-a25f-749035fe5859@epam.com>
 <alpine.DEB.2.21.2109131322190.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109131322190.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4335ae96-3b18-43c4-e1d9-08d977391bcc
x-ms-traffictypediagnostic: AM9PR03MB6769:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6769FCCDA3D078E6EFDE39E3E7DA9@AM9PR03MB6769.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6Fif3tt/UDhJgS/rvEvH+UittFcWxWWegC5/ON5pKtZzN+6YK156282PtykDhHIy84itm/YZiOhA7GXNONlEQE7bgk8qivWRvNDgzmfFgrx73aD0jwZaW1ovQsZ16NZhveGyoU+x/X2z94Q5pRq1olVrqrawXWqUEsnaSv1zQHKvQW6Apygnyx/Yhb8UTsE19+zq/XKnxfXiV9GWE4/jw4G1sLgInO44lnpA9mVU3VErPKzHP8gjWFtjvf6Zf1JhB47R6KfT6aB1fS7ya6OXQd6bzsbiHDe35GKhCuk97SH+nO89bwfCfsZ529+7F8FXJ50otpkIV9oJMniLjJwYO5YR3GPkqqBbPNyscwurOO7Wtd9wb/YEQBnPRqTEOQjKcM1mufhmrElyoEjjCQRQjbeCwhPgfDeBQ1ZJyFPAl63QZWE17IJUNGAvRjTrs36NzFWuzMgq8dmnuqpG0ExWSsstHoKBEqo02QmEvVdVorvti4M9gJy4ak2wpGsCNfbC+oQJMR8kVK1L7iUOjpx63Ul6exjpd8cPomhJPJ96iFGscJStuKMwy/oN6DbHiUwzkOoFPjTZKt/bL71ZTFaZWULoVdRnBVHlLVnXU6ZPlB3gOx9dSlN/D0mFDRAv6Y1eCSyIVKREkQ9sIgV6Dc1k9yJjwUeMT/B6qTUEuS5FTqO6Fzi/01kxr8Qjj48NXiUnTlSn78mhCJdPtcTvO4bdvf6aq0+aLzo8igA+Ho2NjAmpqJbTPLKsTJVUyS33QDbM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(54906003)(6916009)(5660300002)(2906002)(6512007)(8936002)(71200400001)(6486002)(86362001)(107886003)(66556008)(36756003)(76116006)(38070700005)(53546011)(316002)(6506007)(91956017)(66476007)(66946007)(2616005)(38100700002)(122000001)(478600001)(64756008)(31686004)(31696002)(55236004)(66446008)(4326008)(26005)(8676002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZzNBemxqWUkxcElHWlA5QWI5MGhkQnRPTjg2ejdPSlAwQm8rOXlpaWx2VFBS?=
 =?utf-8?B?cTNCNjRNRjQ4Wmh0aGVzY1REUHA2NzZ4NEJJblF2RnVtNXE1MVd1YUdkaWJh?=
 =?utf-8?B?Uk5wTi9qWTBadlltRXhPa3VJVnY4VHByWXlXQXZsc2ZaaTVqYUJoVlJQV3Rj?=
 =?utf-8?B?ZGtKbjBMQkg2SU4rNVg0eDNsRFB2VC92aWp5TjJEYjRodGppZi80VzJySU52?=
 =?utf-8?B?eTRYUEJMc3ZacTU1VmFsK2E1TVIvVXNxaFhOWjM1UHBBNnhFV002aW5nNjU2?=
 =?utf-8?B?QmZBZ1dFOU9sZ09VZGlyUkowZG9GL3VONWgxUkJIZmJkaEMvZ3dacHgxVURM?=
 =?utf-8?B?Y0lCSVJSYkZkSTYwZnlTQjluQzQvNXE3d09UdnF0TjRmT3NnZTZ4Z002dzd4?=
 =?utf-8?B?VFMrb0cyK1J6c2liS2FHdTFMZlFkai9SSkxrYjdTeUIyZllnRWY1VlZWN3dI?=
 =?utf-8?B?ZlNTSGF5aUtQbzV2ZW9RWWVlSGcyNEg0RjVGcEo1UFY4cUFzOW1zZm04aEcv?=
 =?utf-8?B?RDljRmN0OXZuenZxdFdvME1iUXVuYllWcURnOXlhNFoxMmFoMC9oRTBBemtm?=
 =?utf-8?B?cHFQWmlqcVB3bmt4cDNCWUxZa1lJVFdwbWp1eDl5RUQ4RTVleWdReGg4RU9i?=
 =?utf-8?B?cjNadE5pQjNSRGJqM1hIS1c1MnFzOWdLS3I5S1p3ZEdweElTeGdNTUh2Z0lF?=
 =?utf-8?B?WkVKYy9WRVZxODlLdU5Xb2JpMzJXTWtHT0VDcmFPbUdEYU0vWEhaVTZuSUF6?=
 =?utf-8?B?UnZuVzl4YitOY2JmVWlicUIyN3hPclYvS3ZwbzVXSm1UVjNXNnhDc1ZjZFN4?=
 =?utf-8?B?cmU0UXRDWDcxcW1pdHp6TUZNdDB0K0s0eDlaMjI5c2NQNTVsMnBEZ014UGJZ?=
 =?utf-8?B?clpwYU43dnMzaXVSUHlqQmhJaldCNDkwNjAvY1cvVlA3TWZRNnNuWHdHZEF4?=
 =?utf-8?B?d1ZYdFdKK3pnY2J2M3VCUUlQRmZ4cnFXVTQwcERBSUM4QzlrL2FDakEwdEJp?=
 =?utf-8?B?MTVjOFhyVUdLTVR3Z2I0NjZGd0E2aFhWVlNZS1ZObktmd2ZZdHM5TTA2MktN?=
 =?utf-8?B?UVVseWhCMmxQc21vUmZFMUNRZTNRdm1yUkwzdlNzQWg2eFZZUHplM0lWQ1ZX?=
 =?utf-8?B?SmhGamZLdGRkcWhBTmVVNUFTYWdxdGV2U1Ribm40Rld4cExVb3JNdDV3Ukd3?=
 =?utf-8?B?T1pNSURIVFVCWlNNbnhwakRHbi94cGQ3eFBDYXJuemx0YWtmRmZOcWFWcTF1?=
 =?utf-8?B?MGVWbVhQSkFKQzArR2cvayt1eEpLQ0h2VlovSGYxdFNIa3gwSHhNZFFnTWI4?=
 =?utf-8?B?c2dGbHI4TEJVSVdCQnpvdVhqckE0bE1Ga1dkaWJUKzI3MVhIOWdWWmQ3b2Iy?=
 =?utf-8?B?YkNPODVCRy9FZUFCRzlySCs4NC9uUVJlT1FHanNSOFBFdzg0RlJnaXhrMmho?=
 =?utf-8?B?OEZHNVkyK2pKYVBqUE1iYzB3cmwvQkUwWDVzendwUlIrZVV6aXNwdktpRkVk?=
 =?utf-8?B?b2ppc3c1YWwzZjBwVW1rZnpVL0txQXVqSitsUkJhbHdaa3ZDa3dtUGFzaHNW?=
 =?utf-8?B?YmR1bVN4TU5rTHNsc0dRUXRFdVJxRkF0dEJrTER3RVVKREdWU1BiRzZxck1n?=
 =?utf-8?B?NEgxczZSbHpIUElOeUU5YXdwWHowM0swRk10U1hDSGZmRWovYnFMODJPVmdt?=
 =?utf-8?B?eGJBMlBaQmpFc3B4eXhqQXIxUmJuN2dZZ0tObWRQUGpiTXB5UzNQTEZRTWM1?=
 =?utf-8?B?S3BMS0dlQ3JUZ05CTDFodXdPK0VkdFdVRHN5SnowY3pPQVkvbEk4ZGlaYjl1?=
 =?utf-8?B?c0tFa3JqUWF3ZUUwUzNvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA25D76A5157C945858200BC27EF23EA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4335ae96-3b18-43c4-e1d9-08d977391bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2021 04:35:41.2042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z+OXIF4QtPmYb54aUsLNEe4sWAxxOn4iJrhpPxiDbPUzbz2zrcusPsEefaF4UE75D7pCzQD1eOaAeCohQrEZmlZc67U812slVVVD+3NkT55b77noaZdB9thl2VdLlpFo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6769
X-Proofpoint-ORIG-GUID: y1Yp4mXo_w7xpOWdNBKwfG4-1KYWfQqh
X-Proofpoint-GUID: y1Yp4mXo_w7xpOWdNBKwfG4-1KYWfQqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_09,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140026

DQpPbiAxMy4wOS4yMSAyMzoyMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBNb24s
IDEzIFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEhpLCBSYWh1
bCENCj4+DQo+PiBPbiAxOS4wOC4yMSAxNTowMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gWEVO
IGR1cmluZyBib290IHdpbGwgcmVhZCB0aGUgUENJIGRldmljZSB0cmVlIG5vZGUg4oCccmVn4oCd
IHByb3BlcnR5DQo+Pj4gYW5kIHdpbGwgbWFwIHRoZSBQQ0kgY29uZmlnIHNwYWNlIHRvIHRoZSBY
RU4gbWVtb3J5Lg0KPj4gW3NuaXBdDQo+Pj4gK3N0YXRpYyBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5k
b3cgKmdlbl9wY2lfaW5pdChzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwNCj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBlY2FtX3JlZ19pZHgp
DQo+Pj4gK3sNCj4+PiArICAgIGludCBlcnI7DQo+Pj4gKyAgICBzdHJ1Y3QgcGNpX2NvbmZpZ193
aW5kb3cgKmNmZzsNCj4+PiArICAgIHBhZGRyX3QgYWRkciwgc2l6ZTsNCj4+PiArDQo+Pj4gKyAg
ICBjZmcgPSB4emFsbG9jKHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyk7DQo+Pj4gKyAgICBpZiAo
ICFjZmcgKQ0KPj4+ICsgICAgICAgIHJldHVybiBOVUxMOw0KPj4+ICsNCj4+PiArICAgIGVyciA9
IGR0X3BjaV9wYXJzZV9idXNfcmFuZ2UoZGV2LCBjZmcpOw0KPj4+ICsgICAgaWYgKCAhZXJyICkg
ew0KPj4+ICsgICAgICAgIGNmZy0+YnVzbl9zdGFydCA9IDA7DQo+Pj4gKyAgICAgICAgY2ZnLT5i
dXNuX2VuZCA9IDB4ZmY7DQo+Pj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIiVzOk5vIGJ1
cyByYW5nZSBmb3VuZCBmb3IgcGNpIGNvbnRyb2xsZXJcbiIsDQo+Pj4gKyAgICAgICAgICAgICAg
IGR0X25vZGVfZnVsbF9uYW1lKGRldikpOw0KPj4+ICsgICAgfSBlbHNlIHsNCj4+PiArICAgICAg
ICBpZiAoIGNmZy0+YnVzbl9lbmQgPiBjZmctPmJ1c25fc3RhcnQgKyAweGZmICkNCj4+PiArICAg
ICAgICAgICAgY2ZnLT5idXNuX2VuZCA9IGNmZy0+YnVzbl9zdGFydCArIDB4ZmY7DQo+Pj4gKyAg
ICB9DQo+Pj4gKw0KPj4+ICsgICAgLyogUGFyc2Ugb3VyIFBDSSBlY2FtIHJlZ2lzdGVyIGFkZHJl
c3MqLw0KPj4+ICsgICAgZXJyID0gZHRfZGV2aWNlX2dldF9hZGRyZXNzKGRldiwgZWNhbV9yZWdf
aWR4LCAmYWRkciwgJnNpemUpOw0KPj4gSSBhbSBhIGJpdCB3b3JyaWVkIGhlcmUgdGhhdCB3ZSBk
b24ndCBnZXQgdGhlIHJlZyBpbmRleCBmcm9tIHRoZSBkZXZpY2UgdHJlZSwNCj4+DQo+PiBidXQg
Zm9yIGdlbmVyaWMgRUNBTSB3ZSB1c2UgcmVnWzBdIGFuZCBmb3IgWGlsaW54IHdlIHVzZSByZWdb
Ml0uDQo+Pg0KPj4gRm9yIGV4YW1wbGUsIGZvciBYaWxpbnggd2UgaGF2ZQ0KPj4NCj4+IHJlZyA9
IDwweDAwIDB4ZmQwZTAwMDAgMHgwMCAweDEwMDAgMHgwMCAweGZkNDgwMDAwIDB4MDAgMHgxMDAw
IDB4ODAgMHgwMCAweDAwIDB4MTAwMDAwMD47DQo+PiByZWctbmFtZXMgPSAiYnJlZ1wwcGNpcmVn
XDBjZmciOw0KPj4NCj4+IHNvLCB3ZSBjYW4gcGFyc2UgdGhlIHJlZy1uYW1lcyBhbmQgdW5kZXJz
dGFuZCB0aGF0IHRoZSBjb25maWd1cmF0aW9uIHNwYWNlIGlzIHRoZSBsYXN0IGluIHRoZSByZWcg
cHJvcGVydHkuDQo+Pg0KPj4gVGhlIHNhbWUgSSB0aGluayBjYW4gYmUgZG9uZSBmb3Igb3RoZXIg
ZGV2aWNlIHRyZWVzIHByb2JhYmx5Lg0KPiBXZWxsIHNwb3R0ZWQhDQo+DQo+DQo+PiBSYWh1bCwg
ZG8geW91IGtub3cgaWYgcmVnLW5hbWVzICJjZmciIGlzIHZlbmRvciBzcGVjaWZpYyBvZiB1c2Vk
IHdpZGVseT8NCj4gVW5mb3J0dW5hdGVseSBpdCBzZWVtcyB0byBiZSB2ZW5kb3Igc3BlY2lmaWMg
Oi0oDQo+IFdoaWNoIG1lYW5zIHRoYXQgImR0X2RldmljZV9nZXRfYWRkcmVzcyIgb3Igc2ltaWxh
ciBzaG91bGQgYmUgbW92ZWQgdG8gYQ0KPiB2ZW5kb3Igc3BlY2lmaWMgZnVuY3Rpb24uDQoNCkkg
anVzdCBzdGVwcGVkIG9uIHRoaXMgd2hpbGUgd29ya2luZyBvbiB0aGUgcGF0Y2ggZm9yIG5vdCBt
YXBwaW5nDQoNCk1NSU9zIGFuZCBjb25maWcgdG8gRG9tMCBhbmQgbmVlZCB0byBmaW5kIGEgd2F5
IHRvIHRlbGwgdGhlbSBmcm9tDQoNCmRldmljZSByZWdpc3RlcnMuIFNvLCB5ZXMsIGl0IHNlZW1z
IHdlIHdpbGwgbmVlZCBzb21ldGhpbmcgbW9yZSBnZW5lcmljDQoNCnRoYW4ganVzdCBhbiBpbmRl
eC4gV2UgY2FuIHN0aWxsIGhhdmUgdGhlIGNhbGxiYWNrIGZvciB0aGlzIG9wdGlvbmFsLA0KDQpz
byB0aGUgYnJpZGdlcyB3aXRoIHRoZSBzYW1lIHJlZyBuYW1lcyBjYW4gdXNlIHRoZSBkZWZhdWx0
IGNhbGxiYWNrDQoNCmFuZCBkb24ndCBuZWVkIHRvIGltcGxlbWVudCB0aGUgc2FtZQ0KDQo=

