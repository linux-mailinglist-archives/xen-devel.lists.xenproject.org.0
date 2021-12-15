Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF43947524F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 06:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247187.426200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxNEE-0008VT-CK; Wed, 15 Dec 2021 05:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247187.426200; Wed, 15 Dec 2021 05:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxNEE-0008SH-8j; Wed, 15 Dec 2021 05:53:26 +0000
Received: by outflank-mailman (input) for mailman id 247187;
 Wed, 15 Dec 2021 05:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HFQ=RA=epam.com=prvs=2983c13036=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mxNEB-0008Rs-Nh
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 05:53:24 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e450def-5d6b-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 06:53:21 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BF5h77A032077;
 Wed, 15 Dec 2021 05:53:15 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cyab5r19c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 05:53:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Wed, 15 Dec
 2021 05:53:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 05:53:13 +0000
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
X-Inumbo-ID: 4e450def-5d6b-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuA3jzW/M/+fBqgF5gATie76DkEb+qPMFLPs0TixoMlMgi9ZXdU2Lgw/uwh3NuWrgFfXepppA8Ad2VKdsKCXssnSPOeT7qpiqlw6IkLZ392dhjzzLU4F2NQ2wOCdn8jTjm1TEuF9CXOMuMAovNixFhdngGwgVa1GZRWrWLQBHfhlXy2kvaf5fSSmoFtY6gF7O14uF1Ys+yfk/OTBbr1ZbGwUTFVoQSUAJS0wl4OD/ORGFfKlFWsC+nUw5g/uli12CcGEbPlNgUHPpT2WzGNN9HJbwTEIhGLmh9J5+G1kwKkZnhQ9unpo3Ltu/h5m0fV+v7otZOwJ/QG/o6v7YcDw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFr7vV8MIWoq/5YEpnsbPn1gw4dy2p5x9PZcQyqp4Xs=;
 b=DNhVlFs0Gyl9r2mGGy113q2MNqSwic5FZdHzA/wHvT4NsYsESS28Kc3DQWImIXAY1QxKuZGp4ims1tvWFlQl+9d6MgktEzBxdmzYIRy7WHor8JXWqs2eLg8xgD1untso+vmN6kc7/3VCkAw5WueJ5GiWrB927jooCgF4iXBxsZ7VeUjk3wVAPvIrwS13klhy+RJnLVo4zyxWk4y94p/00LR7B0aZtCaIuSab0ZccRyxFgZCR2OU8idZz7DcRbbhaNzcCj95m2jAc+pD63uaQtJUl03SD/zmTmqwIhXX0TstnuPJTj+QyHoGNZG68+DN/OnSPW1hfYVf7xJGBWFW96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFr7vV8MIWoq/5YEpnsbPn1gw4dy2p5x9PZcQyqp4Xs=;
 b=CCtzr/AmWNlIrDiVu0lcfTkuaQ0VPwRPHWk82GS33Z/hVtLNDylQyjT78hF8wOsW25Xd5rPokx17oBjHrDSDvGV68B5GrbnMJoR7N2b6dpUH6r6lWShI9wwb8DZijrYNtoR1zzCMA6Jshqhx5q8IIHMsXoTD0SZNQ+qdWJe/Lkv9R+xM1BQ95c9Y2ZYkf5seMGgJ05C5E4M+ooegf3ZYFRl+1SKiJyjrjgszdllyDkhCsbJPBu351y+86RisRtAEC4QAtCFlpVCBIkcVQnA2roSqgpeuNfq7PdH0HhTI8VF9hZ9oqjS5v1OtrQ4sFAdFC38+lV/7oBfqdFiBbAUeGA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
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
Subject: Re: [PATCH v5 01/14] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH v5 01/14] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHX4ewDgOC3qPO0fU6q4Y3oEVCq8awzAX6AgAAqwAA=
Date: Wed, 15 Dec 2021 05:53:13 +0000
Message-ID: <16de6c3b-b88c-99ab-d836-9d0cf0d66b1a@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-2-andr2000@gmail.com> <87zgp2wo45.fsf@epam.com>
In-Reply-To: <87zgp2wo45.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e0d565d-e520-44bf-a599-08d9bf8f2eb4
x-ms-traffictypediagnostic: AM9PR03MB6881:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB6881FFF813E729819AAF748AE7769@AM9PR03MB6881.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4h+LlzBpTb9rdD6gw9w+bBPojCRl6LaqiVFVx4HGeGxHxBgAXM8tmR/u5DjnaUpztZVEcpV9+vD9R0Sbm5q2G4q6YnqioHr8A9Yp9pUicMGB/DKIznXSoSa/nGQBWKf9iLAW65DixlPUJBT7J+yPVL7wenKfA+iIFXFK4noBcrZIoveNszvHtBSsn3FSJW1wfj0uTole62to0SCebiDI9ZU5OJwbseO2DqY6llmfJtBXZexzFWgKCOupHdh3naiiijB7tleUcyv6x1kQ7LcHNvTiLvL4BSIqlzrCZMMISmv7SKPI4DuzRYRDT+8xVETS7ZXquU8/gpsNNfMLVhr/wySic93uxoMcG6/CtvCd2p1lT2A9vBrnEYdl8T6dtDnwk9aUZHlRz4ExJt4eAj1/sHmwfwKO4pno8rz45jZNH2wo8MWZk4NADi4qgEr/jCgWuhiZY8hDKfDb/qJYpAW1kSDP8TZbHsDLsty2qTzhpBNxZHrIINeJt2YNMTaOOHeoDOey+zn+pvj/AwIa+dX8vxrk23EWpCCiBxUAerzkMRliUciJ4vfXtT0ci5B6kOV25X/x+l63Bh/g3XYrxNDc+6i95uanWyrjyvBUqa0iHEHiPCKbXv7T9Osf5I+WdxTe1eYr3Bi5U1ovm0XVvKLFUV+TcXaJo2272yu+FlsIVOVLX4WogJI4DeLx7fm0jwcPzD0OY8pAgw+JQcvF66G5rfKI9mlbrVBEVnSS1w482icOXu2S4m1c9CXwb4ZNRVypVrW6UFxRZ/cWXLIui4IosGr0zaNmbAC5979yh9lLGS6qPbEOpUgVmCeiw62nY92XdKsbrN01CZ1VL7CpFYEhfA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(7416002)(6512007)(6506007)(26005)(6862004)(38100700002)(8936002)(2906002)(36756003)(83380400001)(6636002)(966005)(86362001)(55236004)(71200400001)(2616005)(4326008)(54906003)(53546011)(508600001)(66556008)(66446008)(66946007)(107886003)(122000001)(31696002)(37006003)(6486002)(66476007)(316002)(64756008)(76116006)(8676002)(5660300002)(38070700005)(186003)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V1JnZFN4VFFwMDIzMTRNRmVQekg4YzJRRlhNQTlQOEswdlBDb3d1ZGlhbkFK?=
 =?utf-8?B?cmVlZzdLWm5KcCs3TGx6MEsyTU5lUHFGU1EvcjdiYW04MkdEd1g5dDdSa1BV?=
 =?utf-8?B?Lzl0VGV0eCsvd2NNbk9ycVlHbUxxVjhHYUhMZ1U1R3pnd202aEVJeVcwb1Q4?=
 =?utf-8?B?TnlScUk2WDd6MUhiazJqUHhnZzREVnF2VXFxRi8vS0FxSzZqa1o2UXR0MERv?=
 =?utf-8?B?WUFSdVErdkNiVTQyNHFyV1NyY0l5ZkpoWFV5MDBPVDJXTzFEbVc0cG5aM09H?=
 =?utf-8?B?bWM5eGxBQmRoTHUrcDJrSnhvTEJtbEpHRlZxa09EbHJqcWVodXFNTE5jaEpN?=
 =?utf-8?B?R2JqZWpOS21PcHRURUVESTFPa1YrY3l1ckJoN3Q5NFdNSGx1dEo0TGIrdFl4?=
 =?utf-8?B?aUFGQjJMOFVtOFpDMTRXMEhSS21jQVBEcWNGaVpwcXlDK1dNd2ltUVRuWjJq?=
 =?utf-8?B?UHlJVXBIZlNBZmEzN3YyRnFad2ltK0tpZkVMYU54ZW5JbWoreWRMNkkydmdi?=
 =?utf-8?B?TlVqcFJ1TVlQd1NyQmx6QjN1MWU4ZERYd3FyMllNUUhCcVJMeXUvcnltTUhU?=
 =?utf-8?B?WnczNVcrRUxmQ2cxQkpuWUc1dU45eWUvcE9qM2dxcFp4SjJCbUN1ZHl5akdj?=
 =?utf-8?B?alBrNTZSRzZIb2NRTlBrMUhiM1Y1aWNETUs0RGhvVGdPZUNmZytTMitDY0ov?=
 =?utf-8?B?amJ1SVpaZlRyYlZNengwVm1VM3p6N2Rmbkcyd1JOMi91R3hCWHdFZkFRV1ZS?=
 =?utf-8?B?dVhjV1pzSEhOWVBOWXMzYU9wckpBUFBKeEY2alFROUpheFM5UUtVNjk3eFh5?=
 =?utf-8?B?T21CNTZFSjlsSmJsK2VDNFByaTl3aFFDQzl1d3VFc01SV3Q2K3ZSeXIzc1hp?=
 =?utf-8?B?bzJYckZSWEw5dWs2ZVE4MjU5eUtjNURYYlU3QmhwRVJFaitQVW5nODE2Qm45?=
 =?utf-8?B?MjhtYXpBSTNEUDdPdjNCNlZyNkd4K1ZyS0xobkF0cmdKckc1RjdPUzAyblNq?=
 =?utf-8?B?L29CTGdpQ1ZoYUwvbjd5T1ExazQwakZMTUVyZVB3WFlpNFg0UjdBbytYUWlU?=
 =?utf-8?B?Ni80TVhsMnNQRXFweUhaMTZtTzQ2anlJTGxrUmdKRy85UEVieGcrMk1GNmtn?=
 =?utf-8?B?YW9FSkVlaHdTbDh5eThmL2ZqS0RQVGFGNTZVeGdNK3RZTVpxenJBaHQxUlJn?=
 =?utf-8?B?RG9Zd2dDREdoTFlWK3B5WEJaTXNOMkdtMjFGT0twbmRxaE1wYWJYSzMrQ2w3?=
 =?utf-8?B?MWExUmRKVlROaVFGZUhNbzVnQkg5OGp0V0FBUkZUL2lHU243UWN4MHArMTRK?=
 =?utf-8?B?VzJFTVQ0czFUUGc0SEtURU1kemlzQmhKSFVqajZnN3lONFdNRCtsWWNRMTVH?=
 =?utf-8?B?blFNV2xJYXVPZE5PLzhMSEoydmtxNWE0L3hxZkJpeFhvWUZEZmcwVWpCa2g4?=
 =?utf-8?B?Z1cxMGVQUGxEYlIyR3lNU0N0WUNpMGtyRUZkOUE4ZVlvK1ppSVpFenk4bmFL?=
 =?utf-8?B?SFo5aXZ5Wk1rSGttZ1dCQ28rc0xvQWZVQ1JwQ3pubHZIKzBiRHd5RE5yWUxq?=
 =?utf-8?B?UWZBVE80bzl5TUNOYVNIZGVsWUJ3YTUvdThmcFlUbGNHdkk3dlE5c2IyZFBV?=
 =?utf-8?B?WnA1Q0FRY1NkY2xOcjZ3UzFaSFZjOExvUkJMYmlDeUdQY0t3dlp1RDIra05m?=
 =?utf-8?B?WUloN1JLbkRYc3FhTEZlbkhkTUJGb1Z0TTBQaUZrUlozOUZQdURVSEpwWENj?=
 =?utf-8?B?NXlCKzhWZWh5NHg0NzVmYmExOTU5U2RWb000UGsxS3l5ZVY5MzQyYnJWT1B2?=
 =?utf-8?B?aEhIVmNjQnVSenNPZ29BTmI1U3VzM0pDNUNyUDhtT2tVREpKWWVRdytUL1dE?=
 =?utf-8?B?NnZOVHNDTEpFVlc2dW1IUHRmaXNzV09iWHAvUDR4dUoyQ0s4MEwzQVJFMFpD?=
 =?utf-8?B?WEJVWTdmaEw4S2JiTG9FQ1F3QlJFSHMwSWVGWXRaMTB4WVRpd0U4ZUVGNXZm?=
 =?utf-8?B?VFZDdHA4b2o0ZDk1VURuLzVLWkFSSWh3SFlVTlMzb2sxaXJNTEdUcGM5RXdK?=
 =?utf-8?B?cWRBRVFGRXZwTVFCZXpCK3oyOVU4SkR3SXpaVnI2dElHTGlIenFqUTh6dldT?=
 =?utf-8?B?QXRFeThROTI2QklJSGtxZHlXcHpYZjR3dmIyR3Q1dkZ3NWlsVy9QYkt4SlBO?=
 =?utf-8?B?NGhlanNIWFM0dStwRTFld2x3dk0rR0NCVjc5UklVUHFPbExVbGZyOVBxa0Fw?=
 =?utf-8?B?dENCVW40OVRydEFYTkNYZUV1clVlaHVjSmRiZkc5akp2YktLekJZVW5zb1dG?=
 =?utf-8?B?RzJ2b2JjSGxsaEs1OVJIc29WMnBNMHJDOUgxMTNqOVBkTUlDcmdOQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3506ED13D949BA43A1DC3526050FCF1D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0d565d-e520-44bf-a599-08d9bf8f2eb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 05:53:13.3674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6nlJWoSs59Es9oel6YPmEjAVSyfKPCepKY1DsBfJYCh+g7LzNIExAJdC9XrDmnd7qoQeiD3yVUzBLR8O8/XXfJyEM+f6lPrhBhZKECUq/saMNUereefmdZxI3KkX2+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881
X-Proofpoint-ORIG-GUID: mes7xqtz0spX51wpGwgaMKI-0F_bVl-t
X-Proofpoint-GUID: mes7xqtz0spX51wpGwgaMKI-0F_bVl-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_05,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150034

SGksIFZvbG9keW15ciENCg0KT24gMTUuMTIuMjEgMDU6MjAsIFZvbG9keW15ciBCYWJjaHVrIHdy
b3RlOg0KPiBIaSBPbGVrc2FuZHIsDQo+DQo+IFNvcnJ5IGZvciBqdW1waW5nIGluIGFtaWQgdjUs
IGJ1dC4uLg0KPg0KPiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8YW5kcjIwMDBAZ21haWwuY29t
PiB3cml0ZXM6DQo+DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVGhlcmUgYXJlIHJhbmdlIHNldHMgd2hp
Y2ggc2hvdWxkIG5vdCBiZSBwcmludGVkLCBzbyBpbnRyb2R1Y2UgYSBmbGFnDQo+PiB3aGljaCBh
bGxvd3MgbWFya2luZyB0aG9zZSBhcyBzdWNoLiBJbXBsZW1lbnQgcmVsZXZhbnQgbG9naWMgdG8g
c2tpcA0KPj4gc3VjaCBlbnRyaWVzIHdoaWxlIHByaW50aW5nLg0KPj4NCj4+IFdoaWxlIGF0IGl0
IGFsc28gc2ltcGxpZnkgdGhlIGRlZmluaXRpb24gb2YgdGhlIGZsYWdzIGJ5IGRpcmVjdGx5DQo+
PiBkZWZpbmluZyB0aG9zZSB3aXRob3V0IGhlbHBlcnMuDQo+Pg0KPj4gU3VnZ2VzdGVkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gLS0tDQo+PiBTaW5jZSB2MToNCj4+IC0gdXBkYXRlIEJVR19PTiB3aXRoIG5ldyBmbGFnDQo+
PiAtIHNpbXBsaWZ5IHRoZSBkZWZpbml0aW9uIG9mIHRoZSBmbGFncw0KPj4gLS0tDQo+PiAgIHhl
bi9jb21tb24vcmFuZ2VzZXQuYyAgICAgIHwgNSArKysrLQ0KPj4gICB4ZW4vaW5jbHVkZS94ZW4v
cmFuZ2VzZXQuaCB8IDcgKysrKy0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9yYW5n
ZXNldC5jIGIveGVuL2NvbW1vbi9yYW5nZXNldC5jDQo+PiBpbmRleCA4ODViNmIxNWMyMjkuLmVh
MjdkNjUxNzIzYiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vcmFuZ2VzZXQuYw0KPj4gKysr
IGIveGVuL2NvbW1vbi9yYW5nZXNldC5jDQo+PiBAQCAtNDMzLDcgKzQzMyw3IEBAIHN0cnVjdCBy
YW5nZXNldCAqcmFuZ2VzZXRfbmV3KA0KPj4gICAgICAgSU5JVF9MSVNUX0hFQUQoJnItPnJhbmdl
X2xpc3QpOw0KPj4gICAgICAgci0+bnJfcmFuZ2VzID0gLTE7DQo+PiAgIA0KPj4gLSAgICBCVUdf
T04oZmxhZ3MgJiB+UkFOR0VTRVRGX3ByZXR0eXByaW50X2hleCk7DQo+PiArICAgIEJVR19PTihm
bGFncyAmIH4oUkFOR0VTRVRGX3ByZXR0eXByaW50X2hleCB8IFJBTkdFU0VURl9ub19wcmludCkp
Ow0KPj4gICAgICAgci0+ZmxhZ3MgPSBmbGFnczsNCj4+ICAgDQo+PiAgICAgICBzYWZlX3N0cmNw
eShyLT5uYW1lLCBuYW1lID86ICIobm8gbmFtZSkiKTsNCj4+IEBAIC01NzUsNiArNTc1LDkgQEAg
dm9pZCByYW5nZXNldF9kb21haW5fcHJpbnRrKA0KPj4gICANCj4+ICAgICAgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkgKCByLCAmZC0+cmFuZ2VzZXRzLCByYW5nZXNldF9saXN0ICkNCj4+ICAgICAgIHsN
Cj4+ICsgICAgICAgIGlmICggci0+ZmxhZ3MgJiBSQU5HRVNFVEZfbm9fcHJpbnQgKQ0KPj4gKyAg
ICAgICAgICAgIGNvbnRpbnVlOw0KPj4gKw0KPj4gICAgICAgICAgIHByaW50aygiICAgICIpOw0K
Pj4gICAgICAgICAgIHJhbmdlc2V0X3ByaW50ayhyKTsNCj4+ICAgICAgICAgICBwcmludGsoIlxu
Iik7DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3Jhbmdlc2V0LmggYi94ZW4vaW5j
bHVkZS94ZW4vcmFuZ2VzZXQuaA0KPj4gaW5kZXggMTM1ZjMzZjYwNjZmLi4wNDVmY2FmYTgzNjgg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcmFuZ2VzZXQuaA0KPj4gKysrIGIveGVu
L2luY2x1ZGUveGVuL3Jhbmdlc2V0LmgNCj4+IEBAIC00OCw5ICs0OCwxMCBAQCB2b2lkIHJhbmdl
c2V0X2xpbWl0KA0KPj4gICAgICAgc3RydWN0IHJhbmdlc2V0ICpyLCB1bnNpZ25lZCBpbnQgbGlt
aXQpOw0KPj4gICANCj4+ICAgLyogRmxhZ3MgZm9yIHBhc3NpbmcgdG8gcmFuZ2VzZXRfbmV3KCku
ICovDQo+PiAtIC8qIFByZXR0eS1wcmludCByYW5nZSBsaW1pdHMgaW4gaGV4YWRlY2ltYWwuICov
DQo+PiAtI2RlZmluZSBfUkFOR0VTRVRGX3ByZXR0eXByaW50X2hleCAwDQo+PiAtI2RlZmluZSBS
QU5HRVNFVEZfcHJldHR5cHJpbnRfaGV4ICAoMVUgPDwgX1JBTkdFU0VURl9wcmV0dHlwcmludF9o
ZXgpDQo+PiArLyogUHJldHR5LXByaW50IHJhbmdlIGxpbWl0cyBpbiBoZXhhZGVjaW1hbC4gKi8N
Cj4+ICsjZGVmaW5lIFJBTkdFU0VURl9wcmV0dHlwcmludF9oZXggICAoMVUgPDwgMCkNCj4gSWYg
eW91IGFscmVhZHkgdG91Y2hpbmcgYWxsIHRoZSBmbGFncywgd2h5IG5vdCB0byB1c2UgQklUKCk/
DQpJdCB3YXMgZGlzY3Vzc2VkIHByZXZpb3VzbHkgWzFdIGFuZCB3ZSBkZWNpZGVkIG5vdCB0byB1
c2UgdGhlIEJJVCBtYWNybw0KDQpUaGFuayB5b3UsDQpPbGVrc2FuZHINCj4NCj4+ICsvKiBEbyBu
b3QgcHJpbnQgZW50cmllcyBtYXJrZWQgd2l0aCB0aGlzIGZsYWcuICovDQo+PiArI2RlZmluZSBS
QU5HRVNFVEZfbm9fcHJpbnQgICAgICAgICAgKDFVIDw8IDEpDQo+PiAgIA0KPj4gICBib29sX3Qg
X19tdXN0X2NoZWNrIHJhbmdlc2V0X2lzX2VtcHR5KA0KPj4gICAgICAgY29uc3Qgc3RydWN0IHJh
bmdlc2V0ICpyKTsNCj4NClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
eGVuLWRldmVsL3BhdGNoLzIwMjExMTIyMDkyODI1LjI1MDIzMDYtMS1hbmRyMjAwMEBnbWFpbC5j
b20v

