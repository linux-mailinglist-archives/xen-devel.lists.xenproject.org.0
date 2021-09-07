Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B9402496
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 09:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180485.327150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNVlW-0001yz-Hu; Tue, 07 Sep 2021 07:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180485.327150; Tue, 07 Sep 2021 07:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNVlW-0001ww-EO; Tue, 07 Sep 2021 07:43:34 +0000
Received: by outflank-mailman (input) for mailman id 180485;
 Tue, 07 Sep 2021 07:43:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNVlU-0001wq-R1
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 07:43:33 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b64b5a2-0faf-11ec-b0d9-12813bfff9fa;
 Tue, 07 Sep 2021 07:43:30 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1877hF5Q015024; 
 Tue, 7 Sep 2021 07:43:26 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0b-0039f301.pphosted.com with ESMTP id 3awxwj0rcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 07:43:26 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB7253.eurprd03.prod.outlook.com (2603:10a6:20b:2e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 07:43:24 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 07:43:24 +0000
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
X-Inumbo-ID: 4b64b5a2-0faf-11ec-b0d9-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuUhm10ZF3UHBEcJP/PqxNGPc81E9ery6yQihapkOwESeMehOhQdYDMMaK3PpUBnMnFGwPD38p9cgKIDnjlblVr79iu8cSmBDvPfcwQWQZbySbW2D/t4NvrDh9UUfA/ojk2Mz35CTGSQ/qIT7GMztwO8alvq8a0miZKdlbtuhBF62RLXUK/M02xj6bUaD4rq+R67xbhNdELJU9EHDXtqNhAj6yGHvcn6p7SbrcdveHM3NjUiOkw192bpeSOylYsbjHNv4G8FheLOwsWJs4JKcKuPiaY1aAxu96O/ExZ4i1nmcsuBsWNJ8iwwB3Emevy8J1GEc+d+1XkNTUXkHHnnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=H05GsjdJnDqyBr0UhP6j4Tyahjtcs2/I/LUt2RtCWRM=;
 b=UDiDSFZJ2FzFCuCb+IdodVoJGV7fxWUsHvOiJ3ULHlmJKTPdNCaG6IYfs7ASb2zufAfxMqerGFWTVIanLiBaSWP1n44c28m/KjDvRNdaZIqRsjZPUBTQxT7e0+dK8livQOBs29d1vHi62WzIF6hFpU0Qe3qYyTACB0MGT38xyVWJcERFlbzqZqQDL/Av9w67jaFtRyX1rPleknjqW5TBhQ64R5FmMEhsWUmHCdcGCM34qeEbSIdUN8QqjqGP7zD0UmhplSCMK2lZubHbIBYDSwUo8TmqlIgNmt5Ip6KSEeXKmZbUetvXtiiKQq+jCEoe+Q+0fujRwTv4GhwEruB2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H05GsjdJnDqyBr0UhP6j4Tyahjtcs2/I/LUt2RtCWRM=;
 b=EdMKpoIjkmB7owIiFFYVf3i+z0xjp4CtJ5cxcOWHrBQJcJJe2+KoA9mgqhHL1nvKb3AnKsjEWhVSEO6ydChFirbSvHILkwMsDzroijKPD1mNfWafSwEKbqSD6cMCt+5RR7klpCxMUxxRRPaBTEEIzf6+vPGDRflVuPnBM/kqmfLO2cRQM25WOy5M41oT4dL0YM9KZg/TgXW1oREVkbiBf5f6uSWOS2UkaShj+Hu2BJutjXE+c+ATLfbxR2/6JHHC5IfuDh2uD+/KVwUXkIRwJGjtM/7IxBNAi8Uo4Xq8Z25+RdGJ+L0X3wrS69lXYsjffP+lh+9LSbcDXF1ShEHtTg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Topic: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Index: AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4A=
Date: Tue, 7 Sep 2021 07:43:24 +0000
Message-ID: <5366265c-d169-041d-f812-1c49260f6499@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
In-Reply-To: <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 855fbb1c-f7c5-4b94-e44a-08d971d32c20
x-ms-traffictypediagnostic: AS8PR03MB7253:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB72531729002997BC33CF3C94E7D39@AS8PR03MB7253.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0gSKp3SZyqf4i9b9Ftv/HqXkJf/TT6ZrvgOFkhmR9Ok/p4yVDT+j5fhUfUds/RZfS4n1FBtRaEuTTV4/eAs2X9gbCs1reNIFvbKZGZBcTLRJ5BlxSo7aT1+L5KPo/zcEseLbSmB+BnGWaI6AnuxxdTi7vLR64XhalPBqWdBUg2hhQIKKoJ5j3Km3jykXSreyL5EKeT6g4eObrrcKjRZ0vVvjLzooeV5egrw4jt40YvghjuCqT3XKok0O96aM3TrJvKJDd5praZadegWclnbU3aDt/G52rVtBrpHyL7gryJFBR/GtJSAn1e0sfev+UFbIy0RG1PPq0qy98LvBAGbzDP2YkmLlvprhooZCaplVFStzpWiBCFMepg/RPF+XqdwOZuktcERUi34Uv/ASEWDL4NoxeXm+/My/TrjobXL13/w9ZiUUp1CRGtBlJEFBSFzfqOvsckR4gUvFWTFjXhmxFPNQrCZnsbe0103jSPnvKYxFbp2E8SMGDPwtR/u3m2a4eik8VPDgDwh/z+1xSNcQAGBVDyNwAUABV7lGxq/UFzMRLYWqJEvexRkTzLlWuT85bFFhRRPiZEZhpDksZQAegdzKLwTLYaechlQK6AuYEUkNI1kAWaqDosMGsO6skJaf2R1WfSX9bsjiBZ9heDv6rgTUkp+JwB7S3dv1sdhyK6qkgCz4rFrAdlQkx8rp+1VyUwtZBLhPMjFsAeNFoEa/cdd7uceYqICnocP4py9FfZgS5HWIy0kn9AeKl7Q1LvV4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(31686004)(38100700002)(122000001)(31696002)(316002)(4326008)(26005)(71200400001)(86362001)(66446008)(66476007)(66946007)(66556008)(64756008)(5660300002)(8676002)(186003)(8936002)(38070700005)(91956017)(83380400001)(76116006)(36756003)(54906003)(110136005)(6506007)(53546011)(2906002)(6512007)(6486002)(2616005)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RlVXRmorMW9UMzQ5SDh5SGtNVGQxc2huY2tabk1NSTB2aXJEZkdSbXR3NjJk?=
 =?utf-8?B?M0c3QXloSW93Q3ZVVGhBRlc3cFNXS25rczQwbHEvNGxnenFhME03TmIycUVE?=
 =?utf-8?B?bHJNSkNScXNKcm56SnJ1REpsRHpXWkNNNDJEcHJYdHVpdjgzNEoweEhiQ2pF?=
 =?utf-8?B?K2t5Y0ZVN1FNWlR0M1ZvWXNxa0VCUFg1ZFQ4V1hPbUQ2eEdpZmYrNmJZc2Fo?=
 =?utf-8?B?bFRtSFozRzJ5K3g3eEVTTUgwNHU3NU1sYTNlMHBhWFF1aXprbU5VRko3R2ZV?=
 =?utf-8?B?cGRDTDk3RGdmVUszb3pzZGEvS3NrNm1vNnlkdldKR0JGQjRQeEhRc25TVWpx?=
 =?utf-8?B?cGVqWGR1NklmUzVUUXdMeGNBSFRoZXRJRGpXUjhKUkNWbkQyeGN5RUxTblV1?=
 =?utf-8?B?bnVTUXY2dUkxaERycTBwaGZJYXp4SEVOVUlHZy9wWk0xOEZxditrSE5aS2d6?=
 =?utf-8?B?RVRxS1FzK1UxWXkxSFhiaE5aWVNURGZFbDRIb09DQmVGMHJsZno4Zmw2aVR2?=
 =?utf-8?B?dWZZNVlXTnBkUE5qNnRNcEFPWHQ2R3YzclZWT0EreXhnZmtpWUd6c04yL085?=
 =?utf-8?B?bzM4RUlDcm1lZE9DMmlIWGJFOGdoaUhXWWMxNFE4aWxJQnArRXJYOWk3b05M?=
 =?utf-8?B?Y2lRUTNlYkJacmFqRE43bXJoaXIxSEphcE9BeU1iK01IRnlsdThNaTBIeXdV?=
 =?utf-8?B?aGZpSHlRVnNFYktlV3E4ZERFSFZpeWFDOWN1eE5ESHhnZkhFVkVyTk1ZVk5o?=
 =?utf-8?B?SDZxMGFPeFE1a0JMVFZRRjZCNkRlNkxzWkU4Q3ZvdUcvYlRhQU9FMlZZWkZo?=
 =?utf-8?B?ZHptMTFuRHRnK1YwMkVVQlYvNTZIWjdzMk1nR1pKQUVydFgrTFh1REFXMkVn?=
 =?utf-8?B?VGx3SWxsQUtTWTlRNlJIdDNZdVIvVEVGTjBtNHhqUEN0Z3Y3ZUxzRVI0eFlo?=
 =?utf-8?B?VlFNKzRaUTZlL0crQWZLME5iQStDdEd5M1EvU2NZMHlvTHQwZkNXSE5odWor?=
 =?utf-8?B?dExmM09GZUVTY0ZWcTMzc2tyN2JoSm1jbzI2em54alJOVzRtZmNIRFlLZitD?=
 =?utf-8?B?UDVYMlJqVU9NU2lRc0FDMWU5ZkNqVDhaQjRSMmlkNkluZHliL29nZU10WGth?=
 =?utf-8?B?bDZBQzZieGhERmpTeUtBUUJuT2EyOW9sMWVNeStWTDR3cFNQeGVYTE1JaWw3?=
 =?utf-8?B?d21NSmdIbS9wbFU1TGcvWS9kdCt3S1FZSk91c0lkbzk3TFNvU1lVOTM5bFZ4?=
 =?utf-8?B?NXBXODQ2RWh1Z3ZhMWtFOWQ1K3dNM2JFUkJMMk9GcFRteWs4WERlNW1lc25C?=
 =?utf-8?B?TVlRQlJSdjVMSmhHWVl6K05UeUc4d1BIbnB4eGVodDdJU0VJQkViY1ZFUHNL?=
 =?utf-8?B?MGxFZnQvZ3dMcjZ6V2NYT1VCdHNpOXdaMjZ3ODlueUcvalpHUElwWlUwSEJ6?=
 =?utf-8?B?NStOcGltQ1pKTzcwNjNVTEFNdWc2RDhVaU5TWEJycm9rTWE0UFM2TXhQRFZM?=
 =?utf-8?B?eGt3S3U0RzZVb2QrV0JsazRXWG8zeitBa1JjdHAzK1NUVGxqZzZMcFYvNmZy?=
 =?utf-8?B?MUJpaTdxcDNTd016TFhSb212eDNnY2h4QVNnK2xDNnNRTUdtMEEzV3NOcTFk?=
 =?utf-8?B?ck91R25xM1NPWDJVM0VrS1VpYUJ4SnEyR2NMZTVhRjBvREx2Zi9IOTczdFRX?=
 =?utf-8?B?Y09PWDFUOEphODROTEYyYVhhaDBUR3g0bVpibWlrQkdjOTlsOXhSK1Bic3Nu?=
 =?utf-8?Q?lWLyuD2YC5/FHXevnxaItcQsJm6Ik1g5iT+nZ4M?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A930BBE9B4863B47A2FFB397577D1C62@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855fbb1c-f7c5-4b94-e44a-08d971d32c20
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 07:43:24.1350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kP4aR03bofpX5KhR0/sT1U4h/5/gUw9XaTG3NwTKInipxfNjda43jPU/zSuPIHNz3kJFZZ/R5AWroRU2NqTkzh3BOw2WFi375LYUisZHA23uLplUxC7mPt9/p/z6ho9V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7253
X-Proofpoint-ORIG-GUID: ws8YyR2UnlOfJ03RvriM9lie45fON0yU
X-Proofpoint-GUID: ws8YyR2UnlOfJ03RvriM9lie45fON0yU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=782 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109070051

DQpPbiAwNi4wOS4yMSAxNzo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjA5LjIwMjEg
MTI6MDgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gLS0tIGEveGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4g
QEAgLTgxMSw2ICs4MTEsMTYgQEAgaW50IHZwY2lfYmFyX2FkZF9oYW5kbGVycyhjb25zdCBzdHJ1
Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgICAgICBncHJpbnRr
KFhFTkxPR19FUlIsDQo+PiAgICAgICAgICAgICAgICIlcHA6IGZhaWxlZCB0byBhZGQgQkFSIGhh
bmRsZXJzIGZvciBkb20lZFxuIiwgJnBkZXYtPnNiZGYsDQo+PiAgICAgICAgICAgICAgIGQtPmRv
bWFpbl9pZCk7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIFJlc2V0IHRoZSBjb21tYW5k
IHJlZ2lzdGVyOiBpdCBpcyBwb3NzaWJsZSB0aGF0IHdoZW4gcGFzc2luZw0KPj4gKyAgICAgKiB0
aHJvdWdoIGEgUENJIGRldmljZSBpdHMgbWVtb3J5IGRlY29kaW5nIGJpdHMgaW4gdGhlIGNvbW1h
bmQNCj4+ICsgICAgICogcmVnaXN0ZXIgYXJlIGFscmVhZHkgc2V0LiBUaHVzLCBhIGd1ZXN0IE9T
IG1heSBub3Qgd3JpdGUgdG8gdGhlDQo+PiArICAgICAqIGNvbW1hbmQgcmVnaXN0ZXIgdG8gdXBk
YXRlIG1lbW9yeSBkZWNvZGluZywgc28gZ3Vlc3QgbWFwcGluZ3MNCj4+ICsgICAgICogKGd1ZXN0
J3MgdmlldyBvZiB0aGUgQkFScykgYXJlIGxlZnQgbm90IHVwZGF0ZWQuDQo+PiArICAgICAqLw0K
Pj4gKyAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNiZGYsIFBDSV9DT01NQU5ELCAwKTsNCj4g
Q2FuIHlvdSByZWFsbHkgYmxpbmRseSB3cml0ZSAwIGhlcmU/IFdoYXQgYWJvdXQgYml0cyB0aGF0
IGhhdmUgdG8gYmUNCj4gdW5kZXIgaG9zdCBjb250cm9sLCBlLmcuIElOVFhfRElTQUJMRT8gSSBj
YW4gc2VlIHRoYXQgeW91IG1heSB3YW50IHRvDQo+IGhhbmQgb2ZmIHdpdGggSS9PIGFuZCBtZW1v
cnkgZGVjb2Rpbmcgb2ZmIGFuZCBidXMgbWFzdGVyaW5nIGRpc2FibGVkLA0KPiBidXQgZm9yIGV2
ZXJ5IG90aGVyIGJpdCAoaW5jbHVkaW5nIHJlc2VydmVkIG9uZXMpIEknZCBleHBlY3Qgc2VwYXJh
dGUNCj4ganVzdGlmaWNhdGlvbiAoaW4gdGhlIGNvbW1pdCBtZXNzYWdlKS4NCkFjY29yZGluZyB0
byAiUENJIExPQ0FMIEJVUyBTUEVDSUZJQ0FUSU9OLCBSRVYuIDMuMCIgSSBoYXZlIGF0IGhhbmQs
DQpzZWN0aW9uICI2LjIuMiBEZXZpY2UgQ29udHJvbCIgc2F5cyB0aGF0IHRoZSByZXNldCBzdGF0
ZSBvZiB0aGUgY29tbWFuZA0KcmVnaXN0ZXIgaXMgdHlwaWNhbGx5IDAsIHNvIHRoaXMgaXMgd2h5
IEkgY2hvc2UgdG8gd3JpdGUgMCBoZXJlLCBlLmcuDQptYWtlIHRoZSBjb21tYW5kIHJlZ2lzdGVy
IGFzIGlmIGl0IGlzIGFmdGVyIHRoZSByZXNldC4NCg0KV2l0aCByZXNwZWN0IHRvIGhvc3QgY29u
dHJvbDogd2UgY3VycmVudGx5IGRvIG5vdCByZWFsbHkgZW11bGF0ZSBjb21tYW5kDQpyZWdpc3Rl
ciB3aGljaCBwcm9iYWJseSB3YXMgb2sgZm9yIHg4NiBQVkggRG9tMCBhbmQgdGhpcyBtaWdodCBu
b3QgYmUgdGhlDQpjYXNlIG5vdyBhcyB3ZSBhZGQgRG9tVSdzLiBUaGF0IGJlaW5nIHNhaWQ6IGlu
IG15IGltcGxlbWVudGF0aW9uIGd1ZXN0IGNhbg0KYWx0ZXIgY29tbWFuZCByZWdpc3RlciBhcyBp
dCB3YW50cyB3aXRob3V0IHJlc3RyaWN0aW9ucy4NCklmIHdlIHNlZSBpdCBkb2VzIG5lZWQgcHJv
cGVyIGVtdWxhdGlvbiB0aGVuIHdlIHdvdWxkIG5lZWQgYWRkaW5nIHRoYXQgYXMNCndlbGwgKGlz
IG5vdCBwYXJ0IG9mIHRoaXMgc2VyaWVzIHRob3VnaCkuDQoNCk1lYW53aGlsZSwgSSBhZ3JlZSB0
aGF0IHdlIGNhbiBvbmx5IHJlc2V0IElPIHNwYWNlLCBtZW1vcnkgc3BhY2UgYW5kIGJ1cw0KbWFz
dGVyIGJpdHMgYW5kIGxlYXZlIHRoZSByZXN0IHVudG91Y2hlZC4gQnV0IGFnYWluLCB3aXRob3V0
IHByb3BlciBjb21tYW5kDQpyZWdpc3RlciBlbXVsYXRpb24gZ3Vlc3RzIGNhbiBzdGlsbCBzZXQg
d2hhdCB0aGV5IHdhbnQuDQoNCg0KUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgb3BpbmlvbiBvbiBo
b3cgd2UgY2FuIHByb2NlZWQuDQoNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5k
cg0K

