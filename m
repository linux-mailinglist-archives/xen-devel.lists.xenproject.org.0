Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF604AC18F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267083.460795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5HW-0000rF-3l; Mon, 07 Feb 2022 14:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267083.460795; Mon, 07 Feb 2022 14:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5HV-0000pJ-Ua; Mon, 07 Feb 2022 14:46:17 +0000
Received: by outflank-mailman (input) for mailman id 267083;
 Mon, 07 Feb 2022 14:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH5HT-0000eB-QT
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:46:16 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b28ac2fe-8824-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 15:46:14 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EctJR012284;
 Mon, 7 Feb 2022 14:46:09 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e35c781ad-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 14:46:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5937.eurprd03.prod.outlook.com (2603:10a6:208:165::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 14:46:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 14:46:05 +0000
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
X-Inumbo-ID: b28ac2fe-8824-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM8VymYne46Br8804nQtNPSMXIvmt3+J8YAvyWp6jIvmuqtkHn4ElJElKRMV/M19jbkNN1mcw2Wc4V6GVGIpuF5jXLetLv5ZzS461Ky/stbOr5l8xxBDXG9I355ohiL0B+9jqvna5wj9IlZ9YMt8Hj0VwdNE/3vmQ3V9709LnJAj7W03D7YFrgOVCHG2mQlul2RipJN7+5mmSyfKftsx6enEK6RrLGJItGXB8C1SbxSw6tX6cvlYR8/5SsmnaLKX6VHb3IOH44OyKCTnbDA01iS61edfy3MggWnRlbF6O/ZaFWJ7sPJbX4TGMfUiQbVzmzFMyMwR1ffSb1rXSjxjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cI7EtVoLc7NMaLqwoj262WZ2K+x4EFdMuX2iEHjjzw=;
 b=CTeWXlQ1r8Om6Qqcl/BZcbfigC00SxvJgevXdo502VFN2ncUTzLjOebQF8YntWr8ftfwZm8Dn8yKhehMvIPFizbzdPDhr8wusbOgPiipx68Z3b+MOsOUkoGH+NJt4MsH+B4vIygRojoLnRk5KCPSmMGqUzi8b+F8DZECWOlQKWPLBTnPrDs6kyGCPAMEauBxIUED5VZ6FblsEUWy6DFB0oTDcKk3esyKJXUuqcBYwddrTfxnQLfQ3c1WsOyQV3fXRDjnl8p7NIot9ni7L8FkAFdymrhUjx7cHjutVMuR7Uamdd1stX6oH1OD/IQ9XL5ZeOF7y3RDVOEAnAdOeq2kvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cI7EtVoLc7NMaLqwoj262WZ2K+x4EFdMuX2iEHjjzw=;
 b=lnRVKMljf8Cle1HW/zAJ7VwQAUDokRi/d7kDjq+40nlrSrqqUVw2Dio/ZSKKp9ugoxMrjZuU3cb2IzlKCLEtzqkPa7wfBbDdoPiSxA4gehkViREllIvbwf+vdPNe+h92R6FaEhIPP75h+VV5xlbMzfAG/spYpycCvTLver8YYujqcPSKpuqJRQlIGUxvfXOXa/o8eHRUw5+QKFWf4F8Wk5xBPHhWpCtr1SACeysqWWLudSdvB4+9l+Y4RfNEqPBktlPYevQ17/75PubOjea2ucyVqcSLRe/yobIbR9tfCL5jDvjIvBmBYOm+k2QYnnZv0PagLOtC3NABN0wJlLNyfw==
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: 
 AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgAgAAT4YCAAAOjAIAAAPCAgAAXGICAAAPHAIAABC8A
Date: Mon, 7 Feb 2022 14:46:05 +0000
Message-ID: <6b4ea90d-cc9c-edf7-e579-a84d72431d7a@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
In-Reply-To: <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1633ce61-3491-4440-26bc-08d9ea4891af
x-ms-traffictypediagnostic: AM0PR03MB5937:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5937B65955CB52AEB692704AE72C9@AM0PR03MB5937.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9XQ3pYRRDTawHliea1zqo7Hvv2SgSH9uVXUngtRKfW0n0HJ+wRs/CQBG6UiLtszfWxe/LhESNhXefahIkjL4dUqh7eG3GzfmncGPDknBDZ9zcK3EvTD/noxrACeiLuwk6LJbTBTHPuRfPsq06buB1az/S1ZjKxJ7W2tzTKlE6KIlJp7+gCdXj3DFbnJ5tVM+z/qkwWVAxBAL+k86ndru+3hQCHwwYo6ZNP1PQl+XH6MX7EPBgj3/lrgcbc5JUc//MwSvfvRisNU8vpKSVXWV/cKoGAfv7im+KwDTNi2o/3B9gJ8dvd7XZynmHl9/EIBtHhrucZV01Plu0+ii+h8botVhnr2P63W1jxSfpjv/SSBziaC5AJVD/EdMIbTdoLUcI4HgKLEhKQKJS3SnXMStBoQaH1BS9Yuv8bOznDHXZvBIOBf3Dn+EtrP8mZsN4Rl5hK43ZFpYTTwZlqmMEKoq1Y9PhC5i/1Q3vWNN6ymoTcUrfb9oTeaCvA8rBH3aqEl2+fp8Z12Sm26zmKQP760QHvNHCEg+nWuw6yPM5N4IHnsbT7r97dCXoW9+DyPBkNm9y8dDFxeFRGA7XoTDyOXS9OyEj4934li17nPhKvP+BbAeje/1gq+vTMiCbaJImDysxa2Xj8CTOz2GEGYDfx19K/SDsGjaNgBpYrt40r5jJA9SJUlVWfx1CnqxY6Optcn1Chie8ZEDa3F8yT2h9SkE/fR378TA6FrwBvM3lxGMeY+t/nUAfXMevtr4NtiABjBC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(2616005)(31686004)(86362001)(6486002)(26005)(186003)(38100700002)(7416002)(6512007)(508600001)(31696002)(5660300002)(71200400001)(66556008)(55236004)(36756003)(53546011)(316002)(54906003)(6916009)(91956017)(66446008)(66946007)(8676002)(64756008)(76116006)(4326008)(8936002)(66476007)(38070700005)(122000001)(83380400001)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K1BQT3N4aENyTDNCY2RPajI0UGh0a0VtMFRicDVSNERreHdrZnBkT1dzTW92?=
 =?utf-8?B?TEJ1Q0lzZjA5aEQwWk5yR2s4aFUrOWEwYVhpbGdDREV3YVh4eG8ralJzYXho?=
 =?utf-8?B?OUtJdzZhV2pDTjlkVGVWMHdHUS95MXVRQVRqdG9QeHpvRWwwU0NnRUlIajBV?=
 =?utf-8?B?YWRxTGdqVGRIT3UwZVZiTWVjZ2IvNVdUME1qYTkvWVBRN0hiNzc0UjJyRzlE?=
 =?utf-8?B?cG9YY0dib2s3WWZ3WWx5OTNMRkJpMHhOZys3MHo1d1dYdU5pUzBVaXRnY1lW?=
 =?utf-8?B?ZVUxY0RLTmtRZjR6d1NyUHovdTl3bEtiVUJ5ZjZTbzJuZjVwNzQrMlplalMw?=
 =?utf-8?B?NFBDc1FHTGNadFl2UzBLbmtCTmdPTTBnUTdCQ0ZsbnBvMXdDSWxVSkFFaVk0?=
 =?utf-8?B?b05aK3dKQXMvV1FvWFBPb3o0WkJPb3JxK1VWUEpDZjdJRTdiZ0ltZS9icjhM?=
 =?utf-8?B?T294cmtheEJDS2VESHNIL0RvOWlKMXRwM3BKaFBsUDRKVkduNW1iWFU1cWlz?=
 =?utf-8?B?bHh3Q0FOQWZvbjJPR2R0dVhsVlZXNlUyQW1zRVVCWHZIdEt6aXhuL1NVczE2?=
 =?utf-8?B?R3pOclZmandaK3hJZ29reDRkU1luYnZyTDNqNjgrRDVtYXdITHZ5MFRZS2Z0?=
 =?utf-8?B?d1ZZZWtUTUI2R0JVakRKMHJZOXMyVEh6d1l2cWNkMHpaejJweWZUTW5ZVWVp?=
 =?utf-8?B?dllocVcxK2U1bXNHODZOTnhWWjkwMHBvZm04emY3MlBRbE93bDQvaFB4bk1s?=
 =?utf-8?B?UU1zOVh4U0VZR3I0dzVKU2tIZVprcWRuSnM2TEVhcVp3TTZkaHpIL2g2V1JE?=
 =?utf-8?B?TU04dXhxSjd3ZzRoYjlEYTlGWElYelpDc3UvcTY2TGx1aUlyMGRUZjhwZHBN?=
 =?utf-8?B?UU1BSkNuQlpKU0ZlWTluVzZyS2JmNHl6Ykd1eCtkMllRY2xMTHZKK0NybWZl?=
 =?utf-8?B?WlluQ0F3anAzZmdJUHNaRWVpWW9XRk5jSE5Uait3dHFLSFdHb214U0NBRk05?=
 =?utf-8?B?V0xQSHVGWVZWYjl0WTdmQUNpelJXREJ3bjVtQUZiZVBzR0ZhZjE1NU56MUM4?=
 =?utf-8?B?dmExNmhvUkhYZlJoQ0NJeHYzSnlFZ2cxcmNzVy9jTGNENFZBQUpXU01HOGtD?=
 =?utf-8?B?NG5KMGh0RTJSZ3JCYjBvNEZMcXFudStiYUluaDNkdmFRYm1oZ3VNRjUzdFRl?=
 =?utf-8?B?OUgwVStWWDJBbEMxK3lYUFI5b3pOMDNmS2NjVmhHeUJMdHlxeU42a25Bcytz?=
 =?utf-8?B?cTQ0c1Q0WUFRN245WlQ1QkJPb2NNZXFTbzB6TVhDSEhEWXZNZkJrWFFkb2l5?=
 =?utf-8?B?TDF5Mm9laW92UWZGaEFUYm15K2ZlSXJzSHl0TFBjY2xrUmpCOE5zV3VZc1pZ?=
 =?utf-8?B?ejd1YUVpR05zK2hLanovbEk0ckRpZDdtSVJmOER4Vyt3UTZxZjJ5bS83M1Bn?=
 =?utf-8?B?UDc1UWprSjE0dmR1dVdrZXFQYkJJeHc4WGdGcGJuU0tPS0VDazBLUmRCbTZ1?=
 =?utf-8?B?Q3Zjc1o1dFpjQXZ4aTgxZzZLMmwxTm9sWHdhdzRDTGpnekdsZkhOQXlZN29I?=
 =?utf-8?B?aVh2azZmUGNINFBSb3R1akxNanEyOEMzWXJzRFVpVUd2c1p6cFFEMHZsNDk5?=
 =?utf-8?B?N1RNeEpQQ1BQWWhIRElSSzY5RW14UlJ5eEVpSjFMS1F3R1NRbVJTTlkrVTgy?=
 =?utf-8?B?YWQrMDJudDZvMWM1U2h4TmFZdFlQS0NoL2JVOUhSQ05sVldGR2dzdUhtdmxX?=
 =?utf-8?B?Q3hZZ3huUDFHbStMYVY0UVFJcWk5M3B5MFp5d2orOW9hVjIvME1adzhpTGJs?=
 =?utf-8?B?amwvWWdGZXFRQmFnZTBKTFpLbFk2RHVKTUN4Z1lyTVZNZmIxUkFMcXRURjRj?=
 =?utf-8?B?QTJSU21oenk4QnMxSUxGZEg3cEtBaE5iYUJTTnc1V2tNeEVQWGFKekg3bDJi?=
 =?utf-8?B?SlBVZk95VUtXaHByblZGMXVWTDl6Skg1ZTFjV1NWNFA2NURjb3kvMHVZSG9E?=
 =?utf-8?B?VCtDQ3lRakhJSUlLclI5UHBzNUVNZHlsWjZoL2lIa1JLQXZCUWFseE0vOUZz?=
 =?utf-8?B?ZjhMZjhKeTFrREFCQVVMYnh0ZEViNStWWXZZQTNrd2RxNG9DWVlpcVQ0Nndu?=
 =?utf-8?B?UTFmTHN0MHEvQ3JRUEg4TG9wVzVVWW5aZGhKczEvY3Q3akJNaFlyYlpyZmdI?=
 =?utf-8?B?Nzc0ZTBGQ3EwYWZNaEpmZzQzUXJnUHRLUUp3VjNEUmtHZTRqdk93dlRuTmNn?=
 =?utf-8?B?RWRHUHMrampOUjNNdldQaEZpNHFUUG1iaFRrSmY5MkYwQTc1YWxuSFJWVVlP?=
 =?utf-8?B?b3lMVnB1b0JmcmVtbTFjbGRGQnV1S3VHY1U3V0VjQm9kVm9mU1pSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37926AC802958B4996B7A893B6D88722@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1633ce61-3491-4440-26bc-08d9ea4891af
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:46:05.1418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /NEyDnTZk4P4Eizu81BNV0B10sMsIgofOZ5Rt7lvFHWI53mmWL1a8g2RVl694Elo57ggbQP8b8o1TfI4HEFhnBoiuhwvCq/cYin/Eq9HG+bmJznIzo1bZTpcErPAqaQ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5937
X-Proofpoint-GUID: iYJn7jT5lu3nfbJGuNQlUK8YhJxiz00S
X-Proofpoint-ORIG-GUID: iYJn7jT5lu3nfbJGuNQlUK8YhJxiz00S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070094

DQoNCk9uIDA3LjAyLjIyIDE2OjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNToxNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDcuMDIu
MjIgMTQ6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjAyLjIwMjIgMTM6NTEsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wMi4yMiAxNDozOCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wMi4yMDIyIDEyOjI3LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwNy4wMi4yMiAwOToyOSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMTU6MzcsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMDQuMDIuMjIgMTY6MzAsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOg0KPj4+Pj4+Pj4+PiBSZXNldCB0aGUgY29tbWFuZCByZWdpc3RlciB3aGVuIGFzc2ln
bmluZyBhIFBDSSBkZXZpY2UgdG8gYSBndWVzdDoNCj4+Pj4+Pj4+Pj4gYWNjb3JkaW5nIHRvIHRo
ZSBQQ0kgc3BlYyB0aGUgUENJX0NPTU1BTkQgcmVnaXN0ZXIgaXMgdHlwaWNhbGx5IGFsbCAwJ3MN
Cj4+Pj4+Pj4+Pj4gYWZ0ZXIgcmVzZXQuDQo+Pj4+Pj4+Pj4gSXQncyBub3QgZW50aXJlbHkgY2xl
YXIgdG8gbWUgd2hldGhlciBzZXR0aW5nIHRoZSBoYXJkd2FyZSByZWdpc3RlciB0bw0KPj4+Pj4+
Pj4+IHplcm8gaXMgb2theS4gV2hhdCB3YW50cyB0byBiZSB6ZXJvIGlzIHRoZSB2YWx1ZSB0aGUg
Z3Vlc3Qgb2JzZXJ2ZXMNCj4+Pj4+Pj4+PiBpbml0aWFsbHkuDQo+Pj4+Pj4+PiAidGhlIFBDSSBz
cGVjIHNheXMgdGhlIFBDSV9DT01NQU5EIHJlZ2lzdGVyIGlzIHR5cGljYWxseSBhbGwgMCdzIGFm
dGVyIHJlc2V0LiINCj4+Pj4+Pj4+IFdoeSB3b3VsZG4ndCBpdCBiZSBvaz8gV2hhdCBpcyB0aGUg
ZXhhY3QgY29uY2VybiBoZXJlPw0KPj4+Pj4+PiBUaGUgY29uY2VybiBpcyAtIGFzIHZvaWNlZCBp
cyBzaW1pbGFyIHdheXMgYmVmb3JlLCBwZXJoYXBzIGluIG90aGVyDQo+Pj4+Pj4+IGNvbnRleHRz
IC0gdGhhdCB5b3UgbmVlZCB0byBjb25zaWRlciBiaXQtYnktYml0IHdoZXRoZXIgb3ZlcndyaXRp
bmcNCj4+Pj4+Pj4gd2l0aCAwIHdoYXQgaXMgY3VycmVudGx5IHRoZXJlIGlzIG9rYXkuIFhlbiBh
bmQvb3IgRG9tMCBtYXkgaGF2ZSBwdXQNCj4+Pj4+Pj4gdmFsdWVzIHRoZXJlIHdoaWNoIHRoZXkg
ZXhwZWN0IHRvIHJlbWFpbiB1bmFsdGVyZWQuIEkgZ3Vlc3MNCj4+Pj4+Pj4gUENJX0NPTU1BTkRf
U0VSUiBpcyBhIGdvb2QgZXhhbXBsZTogV2hpbGUgdGhlIGd1ZXN0J3MgdmlldyBvZiB0aGlzDQo+
Pj4+Pj4+IHdpbGwgd2FudCB0byBiZSB6ZXJvIGluaXRpYWxseSwgdGhlIGhvc3QgaGF2aW5nIHNl
dCBpdCB0byAxIG1heSBub3QNCj4+Pj4+Pj4gZWFzaWx5IGJlIG92ZXJ3cml0dGVuIHdpdGggMCwg
b3IgZWxzZSB5b3UnZCBlZmZlY3RpdmVseSBpbXBseSBnaXZpbmcNCj4+Pj4+Pj4gdGhlIGd1ZXN0
IGNvbnRyb2wgb2YgdGhlIGJpdC4NCj4+Pj4+PiBXZSBoYXZlIGFscmVhZHkgZGlzY3Vzc2VkIGlu
IGdyZWF0IGRldGFpbCBQQ0lfQ09NTUFORCBlbXVsYXRpb24gWzFdLg0KPj4+Pj4+IEF0IHRoZSBl
bmQgeW91IHdyb3RlIFsxXToNCj4+Pj4+PiAiV2VsbCwgaW4gb3JkZXIgZm9yIHRoZSB3aG9sZSB0
aGluZyB0byBiZSBzZWN1cml0eSBzdXBwb3J0ZWQgaXQgbmVlZHMgdG8NCj4+Pj4+PiBiZSBleHBs
YWluZWQgZm9yIGV2ZXJ5IGJpdCB3aHkgaXQgaXMgc2FmZSB0byBhbGxvdyB0aGUgZ3Vlc3QgdG8g
ZHJpdmUgaXQuDQo+Pj4+Pj4gVW50aWwgeW91IG1lYW4gdlBDSSB0byByZWFjaCB0aGF0IHN0YXRl
LCBsZWF2aW5nIFRPRE8gbm90ZXMgaW4gdGhlIGNvZGUNCj4+Pj4+PiBmb3IgYW55dGhpbmcgbm90
IGludmVzdGlnYXRlZCBtYXkgaW5kZWVkIGJlIGdvb2QgZW5vdWdoLg0KPj4+Pj4+DQo+Pj4+Pj4g
SmFuIg0KPj4+Pj4+DQo+Pj4+Pj4gU28sIHRoaXMgaXMgd2h5IEkgbGVmdCBhIFRPRE8gaW4gdGhl
IFBDSV9DT01NQU5EIGVtdWxhdGlvbiBmb3Igbm93IGFuZCBvbmx5DQo+Pj4+Pj4gY2FyZSBhYm91
dCBJTlR4IHdoaWNoIGlzIGhvbm9yZWQgd2l0aCB0aGUgY29kZSBpbiB0aGlzIHBhdGNoLg0KPj4+
Pj4gUmlnaHQuIFRoZSBpc3N1ZSBJIHNlZSBpcyB0aGF0IHRoZSBkZXNjcmlwdGlvbiBkb2VzIG5v
dCBoYXZlIGFueQ0KPj4+Pj4gbWVudGlvbiBvZiB0aGlzLCBidXQgaW5zdGVhZCB0YWxrcyBhYm91
dCBzaW1wbHkgd3JpdGluZyB6ZXJvLg0KPj4+PiBIb3cgZG8geW91IHdhbnQgdGhhdCBtZW50aW9u
ZWQ/IEV4dGVuZGVkIGNvbW1pdCBtZXNzYWdlIG9yDQo+Pj4+IGp1c3QgYSBsaW5rIHRvIHRoZSB0
aHJlYWQgWzFdPw0KPj4+IFdoYXQgSSdkIGxpa2UgeW91IHRvIGRlc2NyaWJlIGlzIHdoYXQgdGhl
IGNoYW5nZSBkb2VzIHdpdGhvdXQNCj4+PiBmdW5kYW1lbnRhbGx5IGltcGx5aW5nIGl0J2xsIGVu
ZCB1cCBiZWluZyB6ZXJvIHdoaWNoIGdldHMgd3JpdHRlbg0KPj4+IHRvIHRoZSByZWdpc3Rlci4g
U3RhdGluZyBhcyBhIGNvbmNsdXNpb24gdGhhdCBmb3IgdGhlIHRpbWUgYmVpbmcNCj4+PiB0aGlz
IG1lYW5zIHdyaXRpbmcgemVybyBpcyBjZXJ0YWlubHkgZmluZSAoYW5kIGxpa2VseSBoZWxwZnVs
IGlmDQo+Pj4gbWFkZSBleHBsaWNpdCkuDQo+PiBYZW4gYW5kL29yIERvbTAgbWF5IGhhdmUgcHV0
IHZhbHVlcyBpbiBQQ0lfQ09NTUFORCB3aGljaCB0aGV5IGV4cGVjdA0KPj4gdG8gcmVtYWluIHVu
YWx0ZXJlZC4gUENJX0NPTU1BTkRfU0VSUiBiaXQgaXMgYSBnb29kIGV4YW1wbGU6IHdoaWxlIHRo
ZQ0KPj4gZ3Vlc3QncyB2aWV3IG9mIHRoaXMgd2lsbCB3YW50IHRvIGJlIHplcm8gaW5pdGlhbGx5
LCB0aGUgaG9zdCBoYXZpbmcgc2V0DQo+PiBpdCB0byAxIG1heSBub3QgZWFzaWx5IGJlIG92ZXJ3
cml0dGVuIHdpdGggMCwgb3IgZWxzZSB3ZSdkIGVmZmVjdGl2ZWx5DQo+PiBpbXBseSBnaXZpbmcg
dGhlIGd1ZXN0IGNvbnRyb2wgb2YgdGhlIGJpdC4gVGh1cywgUENJX0NPTU1BTkQgcmVnaXN0ZXIg
bmVlZHMNCj4+IHByb3BlciBlbXVsYXRpb24gaW4gb3JkZXIgdG8gaG9ub3IgaG9zdCdzIHNldHRp
bmdzLg0KPj4NCj4+IFRoZXJlIGFyZSBleGFtcGxlcyBvZiBlbXVsYXRvcnMgWzFdLCBbMl0gd2hp
Y2ggYWxyZWFkeSBkZWFsIHdpdGggUENJX0NPTU1BTkQNCj4+IHJlZ2lzdGVyIGVtdWxhdGlvbiBh
bmQgaXQgc2VlbXMgdGhhdCBhdCBtb3N0IHRoZXkgY2FyZSBhYm91dCB0aGUgb25seSBJTlRYDQo+
PiBiaXQgKGJlc2lkZXMgSU8vbWVtb3J5IGVuYWJsZSBhbmQgYnVzIG11c3RlciB3aGljaCBhcmUg
d3JpdGUgdGhyb3VnaCkuDQo+PiBJdCBjb3VsZCBiZSBiZWNhdXNlIGluIG9yZGVyIHRvIHByb3Bl
cmx5IGVtdWxhdGUgdGhlIFBDSV9DT01NQU5EIHJlZ2lzdGVyDQo+PiB3ZSBuZWVkIHRvIGtub3cg
YWJvdXQgdGhlIHdob2xlIFBDSSB0b3BvbG9neSwgZS5nLiBpZiBhbnkgc2V0dGluZyBpbiBkZXZp
Y2Uncw0KPj4gY29tbWFuZCByZWdpc3RlciBpcyBhbGlnbmVkIHdpdGggdGhlIHVwc3RyZWFtIHBv
cnQgZXRjLg0KPj4gVGhpcyBtYWtlcyBtZSB0aGluayB0aGF0IGJlY2F1c2Ugb2YgdGhpcyBjb21w
bGV4aXR5IG90aGVycyBqdXN0IGlnbm9yZSB0aGF0Lg0KPj4gTmVpdGhlciBJIHRoaW5rIHRoaXMg
Y2FuIGJlIGVhc2lseSBkb25lIGluIFhlbiBjYXNlLg0KPj4NCj4+IEFjY29yZGluZyB0byAiUENJ
IExPQ0FMIEJVUyBTUEVDSUZJQ0FUSU9OLCBSRVYuIDMuMCIsIHNlY3Rpb24gIjYuMi4yDQo+PiBE
ZXZpY2UgQ29udHJvbCIgc2F5cyB0aGF0IHRoZSByZXNldCBzdGF0ZSBvZiB0aGUgY29tbWFuZCBy
ZWdpc3RlciBpcw0KPj4gdHlwaWNhbGx5IDAsIHNvIHJlc2V0IHRoZSBjb21tYW5kIHJlZ2lzdGVy
IHdoZW4gYXNzaWduaW5nIGEgUENJIGRldmljZQ0KPj4gdG8gYSBndWVzdCB0IGFsbCAwJ3MgYW5k
IGZvciBub3cgb25seSBtYWtlIHN1cmUgSU5UeCBiaXQgaXMgc2V0IGFjY29yZGluZw0KPj4gdG8g
aWYgTVNJL01TSS1YIGVuYWJsZWQuDQo+ICIuLi4gaXMgdHlwaWNhbGx5IDAsIHNvIHdoZW4gYXNz
aWduaW5nIGEgUENJIGRldmljZSByZXNldCB0aGUgZ3Vlc3QgdmlldyBvZg0KPiAgIHRoZSBjb21t
YW5kIHJlZ2lzdGVyIHRvIGFsbCAwJ3MuIEZvciBub3cgb3VyIGVtdWxhdGlvbiBvbmx5IG1ha2Vz
IHN1cmUgSU5UeA0KPiAgIGlzIHNldCBhY2NvcmRpbmcgdG8gaG9zdCByZXF1aXJlbWVudHMsIGku
ZS4gZGVwZW5kaW5nIG9uIE1TSS9NU0ktWCBlbmFibGVkDQo+ICAgc3RhdGUuIg0KVGhpcyBzb3Vu
ZHMgZ29vZCwgSSB3aWxsIHVzZSBpdC4gVGhhbmsgeW91DQo+DQo+IE1heWJlPyAoT2J2aW91c2x5
IGEgZnJlc2ggZGV2aWNlIGdpdmVuIHRvIGEgZ3Vlc3Qgd2lsbCBoYXZlIE1TSS9NU0ktWA0KPiBk
aXNhYmxlZCwgc28gSSdtIG5vdCBzdXJlIHRoYXQgYXNwZWN0IHJlYWxseSBuZWVkcyBtZW50aW9u
aW5nLikNCj4NCj4gQnV0OiBXaGF0J3Mgc3RpbGwgbWlzc2luZyBoZXJlIHRoZW4gaXMgdGhlIHNl
cGFyYXRpb24gb2YgZ3Vlc3QgYW5kIGhvc3QNCj4gdmlld3MuIFdoZW4gd2Ugc2V0IElOVHggYmVo
aW5kIHRoZSBndWVzdCdzIGJhY2ssIGl0IHNob3VsZG4ndCBvYnNlcnZlIHRoZQ0KPiBiaXQgc2V0
LiBPciBpcyB0aGlzIG1lYW50IHRvIGJlIGFub3RoZXIgKGJpZykgVE9ETz8NCkJ1dCwgcGF0Y2gg
W1BBVENIIHY2IDA5LzEzXSB2cGNpL2hlYWRlcjogZW11bGF0ZSBQQ0lfQ09NTUFORCByZWdpc3Rl
ciBmb3IgZ3Vlc3RzDQphbHJlYWR5IHRha2VzIGNhcmUgb2YgaXQsIEkgbWVhbiB0aGF0IGl0IHdp
bGwgc2V0L3Jlc2V0IElOVHggZm9yIHRoZSBndWVzdA0KYWNjb3JkaW5nIHRvIE1TSS9NU0ktWC4g
U28sIGlmIHdlIHNxdWFzaCB0aGVzZSB0d28gcGF0Y2hlcyB0aGUgd2hvbGUNCnBpY3R1cmUgd2ls
bCBiZSBzZWVuIGF0IG9uY2UuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

