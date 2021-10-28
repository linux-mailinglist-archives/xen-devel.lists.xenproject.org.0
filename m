Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356B343DECD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 12:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217812.377996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2bH-0006TQ-Pn; Thu, 28 Oct 2021 10:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217812.377996; Thu, 28 Oct 2021 10:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2bH-0006QF-Lt; Thu, 28 Oct 2021 10:25:35 +0000
Received: by outflank-mailman (input) for mailman id 217812;
 Thu, 28 Oct 2021 10:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg2bG-0006Q9-JT
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 10:25:34 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61a69c0c-37d9-11ec-849d-12813bfff9fa;
 Thu, 28 Oct 2021 10:25:32 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S9SRa6013270; 
 Thu, 28 Oct 2021 10:25:31 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bydxahtth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 10:25:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2831.eurprd03.prod.outlook.com (2603:10a6:800:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 10:25:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:25:28 +0000
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
X-Inumbo-ID: 61a69c0c-37d9-11ec-849d-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRvibzKcaVYrZDD9nhv1r9lfHWpm/gO3q71IYn53l/slajJkfx4OwdaSZ3n74OP90vxikzxJ/lYPQ3uqk6pJVWMXMHO+aqnBDwuO2giUi8ppRYfEeSN+UtDMjT5/hZMSoPRvSFJoGAhNKzAdFjt26u1Rufr1tDXI8tVbIlJG3ZTKOwr9ga6CUopuAkOfo/XKknFNEWc85rilgss/Anu0BJgZ8iN1i7djs+tWv8uPyiXtP71Kreq1WAHc0LgWOdHarCCWQjPXd1c+tF7kYvH1+qzXskM4OrnHxk0Eb+2Y2mGI6gm0AqXIhCOK8/gTX83YMk+vqm48CbWJtmYSmsrVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6opf6qcZt0dnnlbGzapi+zs3MS7pr9vRfRnGsTuvFVk=;
 b=e46f6VZHTBJWp1iXcgoIkWQiRSg01/lDRyXT6EDgffUlH/lQVfR699SE26G05lPo+1MSOb4XEOlWfcuX5KJbEA/PJJhUEI6EEn2R4GLyaLKYc3Tcyki30rY+NvJr2FJ24VTgqomCEZ8y7vOkeAEn6FGMnNQsNQAx902Jkvt8sdw9gjUGmlItyJoh4qmpqII1//+L9vjKauydm9uCeZ0s8f+F4SlXWGtEFGuT0JSpVCfLx4/wZn9uRzDG9+QCXvKa2f1RxQaSDTkQHiLxNj9CyWthaiNaaqxOaA2OuZCQC+6hZ5VzJsM5cFXEM8vosZjeGrxUWbqA+8aN+1ziSILj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6opf6qcZt0dnnlbGzapi+zs3MS7pr9vRfRnGsTuvFVk=;
 b=046bH1glEISu5/PwBJ4cQkfJMiBG3Sf6TBhwjw6WQIEDZ6ANg6Sa67YfAf6z8mKLw8bWuzbe8VXhbij5P0nvXUlx3AhI+lZ36EPuCgRrlyre5NqJkKKsDa0YTnmf5skSB8HCiA591Juqi1/07b+AT0jemDJ8ZHoFIIMiV7ZOe/YlLc8tFsZp3KaLGRZlAkjd8k45QgWl15R/QIuEKQNbYmg3JRZ+VdVe+i75HE5VUAgZa/dJf5gG8AuPH2scZQ7acUfcWV3dA32VXhB43+9jTkCavZYqn+usSR3uHo4cGaJfPxyWDz/n2sQ6Wb+MYN/V2/oX1pJEyhxdWYs7/qwH1Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: vpci: Need for vpci_cancel_pending
Thread-Topic: vpci: Need for vpci_cancel_pending
Thread-Index: AQHXy+MtilSp1e2bsUu2TEgvHf6jsavoMiQAgAACRgA=
Date: Thu, 28 Oct 2021 10:25:28 +0000
Message-ID: <9eca8f0d-ca4c-696c-5ce8-4073033f59cc@epam.com>
References: <fd1328da-5ad3-62cc-28d6-0ec60e9ea582@epam.com>
 <YXp4ovmIsHKTGiw0@Air-de-Roger>
In-Reply-To: <YXp4ovmIsHKTGiw0@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b9a55d2-1b96-4772-cd3f-08d999fd436c
x-ms-traffictypediagnostic: VI1PR0302MB2831:
x-microsoft-antispam-prvs: 
 <VI1PR0302MB283187E275EF357355D60348E7869@VI1PR0302MB2831.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 x3G9mY07rxg38y9sHTwGpzPau9R3D+GTS8nBFVS5zAGC3Pz2xdEi5VmrrcymRVDl0bDj9MH8OvG5bmErtNsL7FxSOUYCYZ+V1DWukEyvvDd1wFz+wl6yhFwTITjZbXMMydV0MrMKr+49kpd9KG6r1awiyOVRkmYwCtwe5vnm+TJYnym4jM4zYf+vyZ++vhs8eTqvoxL8ONY0QCLDxCILVa7vC3DPgjEWka4g7DCaR9SPzh7jgRKhV9tH7LpT8Udj8gQcj4JeIThnqOD7cRBW/aND6mciGtbAL7VdSP94ynhoJ8csMbdlg/uTSWu2Te38FXpr77iTXbcfukWJRQnpdLFj+XM+uRt0JvCKeX7N0RbKj+WOLGHnLNr8JKlofQo9F/E6EJNCeJtT0GrEcwqraA53A5ddheEd1ODHCNwzAFKc3Xbj+3LrvXnTjkMh0U1KfI8g30ZTXeE8OaHoh2v/lqzbB1FesBQ8K0ajbdS5mpT4lNjjBFWkr5NEqHSLpyTaHr+rNESBrhBvCbrTcFiMJuQGO8xjvS4BQu+qNmbQB4JMSmOdodrQG9h0j0tiGBKMNVnIVr454xcjPPUpQQdVAPzx37LGP7hBgpDyCjWEj38F//kqwzr50soAZkSZivNX46RbNtroiKTYUGbTxPTHGLPbbaWYp3CPR2wLza6CjbMqsPCI4ZS/GtSQrd6b25K06RwKiXJretmgKguwr593sCrqdeMESUTsriIlAGhDctwgfBSTVW9xkB7J1aKFV/J/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(38100700002)(8676002)(76116006)(5660300002)(64756008)(53546011)(6916009)(66446008)(6506007)(66556008)(36756003)(2906002)(55236004)(31696002)(4326008)(107886003)(66476007)(122000001)(316002)(508600001)(6486002)(26005)(8936002)(31686004)(54906003)(38070700005)(2616005)(83380400001)(86362001)(71200400001)(186003)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZGdYeVkrSSsveGhJV1lUSnliMWpFckhRZGdtSFZSU0d4UWJFS2RCRGhSdVY5?=
 =?utf-8?B?Nk51cnhHTGZBdW9BREFGRlRDbDljb2VZamZ5MlRoREg1UitYNWNKU1MxVnRp?=
 =?utf-8?B?N3g2UGJCMEI5VXZoNnJod1BJQ21ZTkYxdFF0bTRqOGlzbGZGdEJQSER3dGFL?=
 =?utf-8?B?M0ZvajVpL3lFV2F1ZVVhb1dTcDNUemJPVGZyeXc3elVoRjMwTWNoT0l0Z1o0?=
 =?utf-8?B?QjM2SEJMWjZhWWlTTVlSa1FmVmE2ZjY3a0tWYzU5MDBGTklRdGJNN3orc0hP?=
 =?utf-8?B?TkZid3VKRHFOQlowQW9GcFR1N1g3QVYvQzRGR1B3SUFUZVd5bTAvNjQvMFVZ?=
 =?utf-8?B?VDJYZzl3REZUU1lwckkrMG45U2FTOE82Z0IyWGtDZHZqTGR1eWorWGlmNG9r?=
 =?utf-8?B?MUpqUWZRcWRPR3AwcXU1aTdOSEFiZGl4TlVweGppV3NHNWpIY3hTcnBxckl4?=
 =?utf-8?B?ZzBaa1pCUVVoOCsxUDVDM1o5RU1kMlZpc1RPU091L09jUmdlZE5IM2JicXFx?=
 =?utf-8?B?bVFza0h2UVlIOHgxL2k0bWlMVGhUbVBUdnM4WWZLNndkRWxyVWlxSWROWktR?=
 =?utf-8?B?M3l4Yk1Jd1pCb3hJc1F6SzZ4REsvYU4yLzc1RjRvSmQ2Tkt1ZWhlNEMvdG9M?=
 =?utf-8?B?TG1lVDZYVS9lVHA2Q1d3aXRFMTE5TEhKWDVMZW5ZbjlxbzJGcUFkaGlEQ3Ny?=
 =?utf-8?B?WjdrVTVBRHozRFpiZjN2MEV0ZHBmQ3l0T2RrV3ozMElWaC82VldMV081ZHNR?=
 =?utf-8?B?TFBBZC9sdmtLTHRpY2o4NFdsRkVyK255Zng2MERWSzVEeG5yOVJtcHFiTkUx?=
 =?utf-8?B?TmJsSXZNaC9nTU1zMEhubGQzaVhxL2JWWUxZWUdqYjdlZk9QenBYY2lWY1lw?=
 =?utf-8?B?ZUFueDVXdUFRRktmKy9ZcFZUdFNKOXZXcXRRanBTbDloSncrRVUxK0xOMVIw?=
 =?utf-8?B?MVBoUDR6MldwaDBNT2IxSzBjVWZ2S0R4TjltcUpWQlZkZ0ExWmNnV0ZqNXJT?=
 =?utf-8?B?TVNScVBYL05pMVp4WHRieHhrRWN1OXo5SzBYZUEzVzV6eG5scHRSVXZUTits?=
 =?utf-8?B?Yk5IMmNsSkNzTzFqaWR1U0RKbXhJQkhrL3lpeDdwcnBtSXdXeTArQ0dBM3ZV?=
 =?utf-8?B?VEJzTU5aYnNuWTdUbEozWnRIVVp6OEsrdHFaTjdMbDRiV2RZK3ZoeUg1aHJz?=
 =?utf-8?B?NklzMTBtVkV0YlJ4cjRCY3lKQUhZM2VKR3NreUJpWlZGb05YY0VUdWhIQmNL?=
 =?utf-8?B?NFZyZE95M2Iyc2duSkp0MU1KK2s0MThUVXBSWkhDakR1WEJNOURqenFrOFFN?=
 =?utf-8?B?amc2T3R5MmZaei9aUDJINTYrSXptMWhaMldETTRuSnd6V2k5dXN2eGhXMkd1?=
 =?utf-8?B?L1pQMmZCTDdZSFdTTXJFdHdXWWRGd1BmMjBDbk1kak5rY2RpMDVtQ0RtcUY5?=
 =?utf-8?B?QU8wSVZaT2xoV25UK0lhRWEzV01qWEs3ZEk1MFlrL0dBRk1BSHNHL202OUNi?=
 =?utf-8?B?bC94K213Uk5uQjJVU0g1ODBoaTMwYzU3cys5TWtsUkR0Zkpab0JxSDd2TGhL?=
 =?utf-8?B?dHVwN3RpNFNZMjBtNVpmOVozdUZXZDQ3aDB0L0I4dEFveEsxNkp5Ynl6S0JZ?=
 =?utf-8?B?MnNCRjlxM2ZHZlhKTlVxR2lUdUFSUjc1SWozeWdRNUJXUll0elRJTTVaZmp1?=
 =?utf-8?B?NXVkNXpvZWpxbmV3RDJJK0xRclBnNitCSXlpZ2JXRVVYWm5HQXBPa2h3R1Yy?=
 =?utf-8?B?VGk5eStDbDNOK0dtUENQN3VqMXNCVDA2WlF4aWorU2ZKOGl4Zytxd3FwYkcz?=
 =?utf-8?B?R2VuNHNVblQvVFNkbVFhWTc3ZXJlOURnaTJTYTVaUzlPalBkS09hL055TitV?=
 =?utf-8?B?SkE2MHoxaDc0Ly9IV3EwTWFLUkhPWmE0N3Bkd2NxV28wZy8vakxzdmlrT21o?=
 =?utf-8?B?VUx0cFJ5QU0zYlNCK3VackhZWFVuMTY5Zi9oaXlnZERMeDZOYitHL0FtcnE4?=
 =?utf-8?B?R05RUnB2NVBac2dJZjNWWkpnWFNnU0oxQmlHTVU5azEwd1ZidUdiSW1abHhr?=
 =?utf-8?B?TG0rS0EvOUYzUWc3cDNNVG1SYk1wLzAvaUV4SzJaMUlJL295WERaUURGRXhS?=
 =?utf-8?B?Ym9NR28yV1IrVXgwREk2THl4eGZXTi9kSjN0NGdMcDR3cFFBb3NjOW5MUXRn?=
 =?utf-8?B?QjdXMTNiU3JIZDQ2SHNiL29UM3YyWXNHRnh6dTVTZmlSSklvdDJkQnRTSVcz?=
 =?utf-8?B?dDNQQjZFdFByektxbTdhTXlaMTZxV2dHcjU5akpWWmkxWHdPbkkyZDE0YTdO?=
 =?utf-8?B?Z09CcjJoSnRLZ2Jib2N1OVhPZWNkZmhFZDZncWhFTmZDOWVLRmdQdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41FC9834D2E2344686D53FE5DC960945@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9a55d2-1b96-4772-cd3f-08d999fd436c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 10:25:28.6008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIruqOAnEvBSlk71vkheavGuu5vxJwn4JknKkATUjn+2s1brKuELWE4QKDsOcpmLtINiVdNR0OnwqdV2HAaLp2cfjCAJdb9yTddy2Kk/evh190AFFwhscvpR7l+4f/1B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2831
X-Proofpoint-GUID: H3bossY9MqdK-5cRBt6jG8Nq4drz-MJa
X-Proofpoint-ORIG-GUID: H3bossY9MqdK-5cRBt6jG8Nq4drz-MJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=826
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280057

DQoNCk9uIDI4LjEwLjIxIDEzOjE3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUs
IE9jdCAyOCwgMjAyMSBhdCAxMDowNDoyMEFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBhbGwhDQo+Pg0KPj4gV2hpbGUgd29ya2luZyBvbiBQQ0kgcGFzc3Ro
cm91Z2ggb24gQXJtIEkgc3RlcHBlZCBvbnRvIGEgY3Jhc2gNCj4+IHdpdGggdGhlIGZvbGxvd2lu
ZyBjYWxsIGNoYWluOg0KPj4NCj4+IHBjaV9waHlzZGV2X29wDQo+PiAgIMKgIHBjaV9hZGRfZGV2
aWNlDQo+PiAgIMKgIMKgwqAgwqBpbml0X2JhcnMgLT4gbW9kaWZ5X2JhcnMgLT4gZGVmZXJfbWFw
IC0+IHJhaXNlX3NvZnRpcnEoU0NIRURVTEVfU09GVElSUSkNCj4+ICAgwqAgaW9tbXVfYWRkX2Rl
dmljZSA8LSBGQUlMUw0KPj4gICDCoCB2cGNpX3JlbW92ZV9kZXZpY2UgLT4geGZyZWUocGRldi0+
dnBjaSkNCj4+DQo+PiBUaGVuOg0KPj4gbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdA0KPj4gICDC
oCB2cGNpX3Byb2Nlc3NfcGVuZGluZzogdi0+dnBjaS5tZW0gIT0gTlVMTDsgdi0+dnBjaS5wZGV2
LT52cGNpID09IE5VTEwNCj4+DQo+PiBXaGljaCByZXN1bHRzIGluIHRoZSBjcmFzaCBiZWxvdzoN
Cj4+DQo+PiAoWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5bmRyb21lPTB4Ng0KPj4gKFhFTikgV2Fs
a2luZyBIeXBlcnZpc29yIFZBIDB4MTAgb24gQ1BVMCB2aWEgVFRCUiAweDAwMDAwMDAwNDgxZGQw
MDANCj4+IChYRU4pIDBUSFsweDBdID0gMHgwMDAwMDAwMDQ4MWRjZjdmDQo+PiAoWEVOKSAxU1Rb
MHgwXSA9IDB4MDAwMDAwMDA0ODFkOWY3Zg0KPj4gKFhFTikgMk5EWzB4MF0gPSAweDAwMDAwMDAw
MDAwMDAwMDANCj4+IChYRU4pIENQVTA6IFVuZXhwZWN0ZWQgVHJhcDogRGF0YSBBYm9ydA0KPj4g
Li4uDQo+PiAoWEVOKSBYZW4gY2FsbCB0cmFjZToNCj4+IChYRU4pwqDCoMKgIFs8MDAwMDAwMDAw
MDIyNDZkOD5dIF9zcGluX2xvY2srMHg0MC8weGE0IChQQykNCj4+IChYRU4pwqDCoMKgIFs8MDAw
MDAwMDAwMDIyNDZjMD5dIF9zcGluX2xvY2srMHgyOC8weGE0IChMUikNCj4+IChYRU4pwqDCoMKg
IFs8MDAwMDAwMDAwMDI0ZjZkMD5dIHZwY2lfcHJvY2Vzc19wZW5kaW5nKzB4NzgvMHgxMjgNCj4+
IChYRU4pwqDCoMKgIFs8MDAwMDAwMDAwMDI3ZjdlOD5dIGxlYXZlX2h5cGVydmlzb3JfdG9fZ3Vl
c3QrMHg1MC8weGNjDQo+PiAoWEVOKcKgwqDCoCBbPDAwMDAwMDAwMDAyNjljNWM+XSBlbnRyeS5v
I2d1ZXN0X3N5bmNfc2xvd3BhdGgrMHhhOC8weGQ0DQo+Pg0KPj4gU28sIGl0IHNlZW1zIHRoYXQg
aWYgcGNpX2FkZF9kZXZpY2UgZmFpbHMgYW5kIGNhbGxzIHZwY2lfcmVtb3ZlX2RldmljZQ0KPj4g
dGhlIGxhdGVyIG5lZWRzIHRvIGNhbmNlbCBhbnkgcGVuZGluZyB3b3JrLg0KPiBJbmRlZWQsIHlv
dSB3aWxsIG5lZWQgdG8gY2hlY2sgdGhhdCB2LT52cGNpLnBkZXYgPT0gcGRldiBiZWZvcmUNCj4g
Y2FuY2VsaW5nIHRoZSBwZW5kaW5nIHdvcmsgdGhvdWdoLCBvciBlbHNlIHlvdSBjb3VsZCBiZSBj
YW5jZWxpbmcNCj4gcGVuZGluZyB3b3JrIGZyb20gYSBkaWZmZXJlbnQgZGV2aWNlLg0KSG93IGFi
b3V0Og0KDQp2b2lkIHZwY2lfY2FuY2VsX3BlbmRpbmcoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQp7
DQogwqDCoMKgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsNCg0KIMKgwqDCoCBpZiAoIHYtPnZw
Y2kubWVtICYmIHYtPnZwY2kucGRldiA9PSBwZGV2KQ0KIMKgwqDCoCB7DQogwqDCoMKgwqDCoMKg
wqAgcmFuZ2VzZXRfZGVzdHJveSh2LT52cGNpLm1lbSk7DQogwqDCoMKgwqDCoMKgwqAgdi0+dnBj
aS5tZW0gPSBOVUxMOw0KIMKgwqDCoCB9DQp9DQoNClRoaXMgd2lsbCBlZmZlY3RpdmVseSBwcmV2
ZW50IHRoZSBwZW5kaW5nIHdvcmsgZnJvbSBydW5uaW5nDQo+DQo+PiBJZiB0aGlzIGlzIGEgbWFw
IG9wZXJhdGlvbiBpdCBzZWVtcyB0byBiZSBzdHJhaWdodGZvcndhcmQ6IGRlc3Ryb3kNCj4+IHRo
ZSByYW5nZSBzZXQgYW5kIGRvIG5vdCBtYXAgYW55dGhpbmcuDQo+Pg0KPj4gSWYgdnBjaV9yZW1v
dmVfZGV2aWNlIGlzIGNhbGxlZCBhbmQgdW5tYXAgb3BlcmF0aW9uIHdhcyBzY2hlZHVsZWQNCj4+
IHRoZW4gaXQgY2FuIGJlIHRoYXQ6DQo+PiAtIGd1ZXN0IGlzIGJlaW5nIGRlc3Ryb3llZCBmb3Ig
YW55IHJlYXNvbiBhbmQgc2tpcHBpbmcgdW5tYXAgaXMgb2sNCj4+ICAgwqAgYXMgYWxsIHRoZSBt
YXBwaW5ncyBmb3IgdGhlIHdob2xlIGRvbWFpbiB3aWxsIGJlIGRlc3Ryb3llZCBhbnl3YXlzDQo+
PiAtIGd1ZXN0IGlzIHN0aWxsIGdvaW5nIHRvIHN0YXkgYWxpdmUgYW5kIHRoZW4gdW5tYXBwaW5n
IG11c3QgYmUgZG9uZQ0KPj4NCj4+IEkgd291bGQgbGlrZSB0byBoZWFyIHlvdXIgdGhvdWdodCB3
aGF0IHdvdWxkIGJlIHRoZSByaWdodCBhcHByb2FjaA0KPj4gdG8gdGFrZSBpbiBvcmRlciB0byBz
b2x2ZSB0aGUgaXNzdWUuDQo+IEZvciB0aGUgaGFyZHdhcmUgZG9tYWluIGl0J3MgbGlrZWx5IGJl
dHRlciB0byBkbyBub3RoaW5nLCBhbmQganVzdCB0cnkNCj4gdG8gY29udGludWUgZXhlY3V0aW9u
LiBUaGUgd29yc2UgdGhhdCBjb3VsZCBoYXBwZW4gaXMgdGhhdCBNTUlPIG1hcHBpbmdzDQo+IGFy
ZSBsZWZ0IGluIHBsYWNlIHdoZW4gdGhlIGRldmljZSBoYXMgYmVlbiBkZWFzc2lnbmVkLg0KPg0K
PiBGb3IgdW5wcml2aWxlZ2VkIGRvbWFpbnMgdGhhdCBnZXQgYSBmYWlsdXJlIGluIHRoZSBtaWRk
bGUgb2YgYSB2UENJDQo+IHt1bn1tYXAgb3BlcmF0aW9uIHdlIG5lZWQgdG8gZGVzdHJveSB0aGVt
LCBhcyB3ZSBkb24ndCBrbm93IGluIHdoaWNoDQo+IHN0YXRlIHRoZSBwMm0gaXMuIFRoaXMgY2Fu
IG9ubHkgaGFwcGVuIGluIHZwY2lfcHJvY2Vzc19wZW5kaW5nIGZvcg0KPiBkb21VcyBJIHRoaW5r
LCBhcyB0aGV5IHdvbid0IGJlIGFsbG93ZWQgdG8gY2FsbCBwY2lfYWRkX2RldmljZS4gUGxlYXNl
DQo+IHNlZSB0aGUgRklYTUUgaW4gdnBjaV9wcm9jZXNzX3BlbmRpbmcgcmVsYXRlZCB0byB0aGlz
IHRvcGljLg0KQWdyZWUNCj4NCj4gUmVnYXJkcywgUm9nZXIuDQo+DQpUaGFuayB5b3UsDQpPbGVr
c2FuZHI=

