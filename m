Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBEC4A482A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 14:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263093.455663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEWly-0004Yw-5D; Mon, 31 Jan 2022 13:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263093.455663; Mon, 31 Jan 2022 13:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEWly-0004Vw-1q; Mon, 31 Jan 2022 13:31:10 +0000
Received: by outflank-mailman (input) for mailman id 263093;
 Mon, 31 Jan 2022 13:31:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEWlw-0004Vq-Jz
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 13:31:08 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0936e09a-829a-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 14:31:04 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VD1BE1026450;
 Mon, 31 Jan 2022 13:30:59 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dxdbygv28-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:30:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB3749.eurprd03.prod.outlook.com (2603:10a6:209:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 13:30:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 13:30:55 +0000
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
X-Inumbo-ID: 0936e09a-829a-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g45nrikckX7lX2Ey//vqzSi3hz5F6zGwJAwSkXHZ1X9wwVOg1O8dsVoU89WpPqdaq2HfjmF9uh3cpmsp6S10k0SbuWT94eB2iMlBh25DUK34Cl15Ep8LezFDFYFLK2Dsu+eOXQscqGN2Ve0P3qehpVTfkaXWXdSuRJ6TeUdk7imYSCiFffihqfssMYOq2pg7blwuUn1MtrDaLp45b3yd+sF4qsHjmff8ukbEcht4U3iizcJkU/E8RceLc/1vT8EK93rIC/EgVPHxE/xr8Fy0dfxISLL2+n7uZNnrBTTX+sztBN/5GkLsL8HZXmhZNQ0Z6feP2uZqhMxue3TJesUfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1TjH7lN/Tt5ocAalX20eM1hGIagS6iYx7hqGF8bsW4=;
 b=ByJNUNfQ9vG1GpLAqB0H0XpEUirbEmPk8qIg/FsXyXLI3XMnDrKfWaUWh6KvZdHXUO7DzAY832LHHTGDZsanuxEOoyDAqTg52p4Pcx+bgnOj2gQMg/sbGI947OT50a2uUWbhGWUX3v7MM8XWFpJWqaCjMFE4A0enZH0E3ab+1yIw+Zg6q/utSWX/R4r4ME9KOCU/kfbbJ/PXRppLLRN8VZ9tcbMvo493sV40kfKT6sbYAdEsvFHikdJKTutnJ3Jh9ETGAs0I8xFTk5iBiaB0qUylU2GYZd0pLQ0f+SlVRO4uQDmNyBSoEKHHp1kvWN4eX6WRJ0/yd0RgHKq0f4Pw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1TjH7lN/Tt5ocAalX20eM1hGIagS6iYx7hqGF8bsW4=;
 b=gpbgn9Rtj3qeqq2ajKfoUeixrnOn6ip2Cf7JXj1J0Nt77+v/GDlMgnhTGLIapxKusbB1MAGQbzZBScr6Fl+phbMSgN7zDjWYzpoK97TVrqOKlCSN57tcEjuykTA9Z5KNhWXBsQTeH0GXrUDPe1hT6gqlIegaynNd5KTwmkzIzdbXYoRzocPcJVrOpod89EtOVrIDJGiTw8IYMl8WIzBPPGGVSjx7ep3O1ManRjilLaxSLkTmfXjBz8o7Z7JWh3SZTtuWhUU+BKPrYIvukDa4FnNqF/9p8C6do8HFbgjhcyq/KmY3ozbZDfnXWgl7vC14/IjxLSZ8QpAu1WS5vx2VfQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB2tWgCAAA7+AIAACECAgAADxgCAAARsgIAAHxiA
Date: Mon, 31 Jan 2022 13:30:55 +0000
Message-ID: <0b20be9a-61e6-d286-b379-92c29ee9a804@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <YffDmW4JGk+iDIVF@Air-de-Roger>
 <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
 <36fe9000-87a8-eefd-9baf-331bf4bbf1ad@suse.com>
In-Reply-To: <36fe9000-87a8-eefd-9baf-331bf4bbf1ad@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0d5c151-e417-429d-b69e-08d9e4bde8fb
x-ms-traffictypediagnostic: AM6PR03MB3749:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB3749CF292399DFB319AE2C83E7259@AM6PR03MB3749.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 I6acu3vdmUz9CX4SAVWsOSzpRy+1TtKg5lJ/75/0/7xEy8/0zah590tApdZYgE2kjEp3M55Pdzq+JqWBgRO4zQRA+dDeRN86dW//ysMmVa4StUZJmBojLPL2nntUvaIY/YFbazIXGhkdB6pNu28Ed1jqN0r/d4N+rRVkmwjzt43vlTNi4chNt/sgbKF7z69Ew2TsbJGZWx79IuNolqzzEHq979heAaVjccY7cpPPaj9VzSFBdh4ZB3AUrm9sNYqWO0Fdr2YeZbcC6kTO1gmue8wMLnOTG6TML7VHUIUqKdno9VhN8YBaDZilvr8TISkuX7VTlSXLoRETLBvcx5iL+A1wiUnW5JYBDY8PkGLVAsz+B0GG+W8X19zUFVzAgM1FGb6n/6by5VhSMQLt/1wzxDm8JzQRZSDk1rHXktqirbaJdPVUizNvEmW6HrT7Gdn19gzVGOb99biPuTp6yG0a5jwJFFsXAKZpmxme2eVnwUp1yo2DKptScPrHg3yCclJw5KiHM2LEoJFGgyH/xsip7K7EOsa+19YJbdX/9olv6THHjc+blcw+RiUJiWHMTBmJg2G/8yn4YVeEfaQH/1druSjcnB5F8JyydECkLoow6IpGrm8uCuBUGwyOPQI4H+5aZNGh7WGlWk2jNE/tvMhkNSdZSF4DkdgU576W+kplfFrSgDkQtpWQPKoty2ryxSmUHqT0vJbwlRrUkpggPaT0QHpo2NKV9VPUBfYTyvE4u5g+XsW3oimKTLEGP7v5oR1x
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(31696002)(7416002)(110136005)(54906003)(6486002)(6512007)(6506007)(316002)(71200400001)(38100700002)(2616005)(508600001)(186003)(26005)(76116006)(66446008)(53546011)(107886003)(38070700005)(2906002)(91956017)(64756008)(86362001)(83380400001)(66946007)(66556008)(66476007)(122000001)(4326008)(31686004)(8936002)(8676002)(5660300002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?anJrOFRsSVI0SzZKQUFuRnVqc3JvSk4vbjJnaTUxNVg5RGJOR1pVZWNYOFQ2?=
 =?utf-8?B?a2dJVmpFMjBsUzRjMnRQejdlcGNhbFRMSjlDTVp1U0FrTzRBaVorZmxlTTYy?=
 =?utf-8?B?QnpuZG52c2pPK2twcXlxZXowbXZtT1BLRDlUbWFGRW5rcTE5Y0tTa1dHMnE5?=
 =?utf-8?B?NG1WVGtlcXZxR1R5RmJzTktOR0NLbUhMdFUxNXJwZkVvQXFHcnlDQndNVjhE?=
 =?utf-8?B?SUpMblVMSVRhOTAyYlhrOG5xVDNYU25qQ0picEZ6cS91ckN2c29CWGg1U0Zj?=
 =?utf-8?B?b2FGOUxjMFM2bVRJSUo2eWhSenhCTytCd3FLWCtiTFNjdmxXcXJHLytWc1Bv?=
 =?utf-8?B?UmczRDFKU2tEZm1tRGNKa0lWaDc5aXZwSS9ad3NsYUNsSmQ4R1NVdkdUL3FH?=
 =?utf-8?B?OWJ6bG9HYVphMFNIMGJlSWpzMmlFQVBoVWtyalA1UURPM2gxOVE1WHZSWlJF?=
 =?utf-8?B?Vnp1QnJFU1BZTnJoMGtpS0hSNGVDNzhEN09VQTVEL0grLyszUy9pVXd5a2Yz?=
 =?utf-8?B?NVVYZFRoaDgzT0NNd1J5SExBQWJoOHVycE5QZW15QUcwWlM0UFZxU1JrdjIy?=
 =?utf-8?B?Tm9IcG9CQ0VlZEpJVUtuRURqaS9OY1c0WStRemFvRXFLZnRvejdnSUI1T041?=
 =?utf-8?B?dkpyblY1U0E2MFI5ZkJmR0dkN0JqaHFTWjVmb1dqVklaci83aXk1QlE0dms5?=
 =?utf-8?B?NUZlM2J4MXcyajRnME93UURTRFZGWENuVGFiZFNHd20zUkFLbHM0ZXB0eCt0?=
 =?utf-8?B?UU55clV0ZzNjc2FlWEhRbHMvNlc0U1FPWHFmMGU3NHY3YytZYnRBbFJCaTdQ?=
 =?utf-8?B?RE12My9VdHY3MTFwMXlZMWM4SzhZZ0lIdjNNQm1vNVVYTThCME1namhXOFdG?=
 =?utf-8?B?MU1qMkg5RnMxU0lRZzhWNWFERmUxWVcxcjlUbnJ5MkhCeTNEL3UvRE1LelJD?=
 =?utf-8?B?K2J4UFdVWkJUY0lhbnd5anBXbVY2RENGOFBWUFdjOHpBTzJpQS9LK3JlckpB?=
 =?utf-8?B?SVlQMzlSQWU1NFhrUXBpczQvTXNHb2VXVkRKZ2dyRk5hNjJSZkhkejBwYXp2?=
 =?utf-8?B?UWJGRmRtcWJGYVBNWGxXRUk0QjFGVGNydVkvaElud3NiSVEyM0M5R0oyOGFZ?=
 =?utf-8?B?Q21xb0Iwb1FCVTNvN2VMVkJPYWFjdG0yazV0YVQ3MkFtZ0VvU2p0UlgvOWdL?=
 =?utf-8?B?bmppUjBCS0tSaFBZOXFlTUVTRGJuVWt1TGhacGhpNndMWEdCdEtIbURnVjhr?=
 =?utf-8?B?UFBPWi90bUFSZTVwVWZmU3I3NVR6NDk4WVE1ZnNZOHJMR0NrallSQ3dkclBX?=
 =?utf-8?B?c0FsVytPSVY3RU9aUlArZjBiV2V2OGNySkk4K2xuY0dFdTlEUlUzMGVNZnRw?=
 =?utf-8?B?RDJJMFh6UEwwL0lZMkNpamd1L2J5aE5McFFZQUNGNmg4dVd2NUhxQ1NYa3pl?=
 =?utf-8?B?QURvSittS3dkbXVnYzJaMElmZzJ0U3RaMHBzdXRIQUpNVzAzRXhqNlhYRGZV?=
 =?utf-8?B?dytqbGF4dXVsajFJaXg1ZEFvMGgvbGZaZDUvcTliUEM3TnRPTUdDSzFGZ3k3?=
 =?utf-8?B?YTYwYjFqRHl1UERVMjROQ1JUNVo1Um9GcGc5aXcyOVN3T1kwRmVBalNZd1hM?=
 =?utf-8?B?TDFINlUybWxUU21nYmFMckE0RjM5WmhyZXRZc2o2bGZUYnBWbzRoZzB2cCtQ?=
 =?utf-8?B?OFRHTVNwak1wVWZmTkxRV0JkZVdDSlFkQTlhbE1oa0IrZm42NnArcEtCMUhZ?=
 =?utf-8?B?MGhiRjIrSnVkZ1ZxdHRQcklIL1FDUmNzWUR5YlptRXg0TkphNGhwcmpoU2pN?=
 =?utf-8?B?RnR3U2czR1FzcWRuNUxBSktUYVVpM1p4N2k1QWxkeFQ4ajNkcG4ySmJXSC91?=
 =?utf-8?B?WlJaRW9XbVgvUTEyTmxiRjIxQTFtOHJYdWZwVDdjWkxUanJON0tXSStIcEJv?=
 =?utf-8?B?ekZuamJxYjR1QmVXUGdrUHlQazh4MGZtNVZPdENqSWh0RlBYTTlzOGplTEw4?=
 =?utf-8?B?RnNmZWt6YjgzZ0RqNTZCRjlnb2Q1aFBKdkxHMTJCcGNsSGZ3dXJFRC9zS3Js?=
 =?utf-8?B?RzVaTWpnYm9hY2hjMlloTTlINkRFbHRXUklmQks0bmVVeEpMbUs0WUkrbE5I?=
 =?utf-8?B?WlhidDFWTnk2ZDdxSnBLUjd3OThWNkRmSDBiUTdOejJvNEx1T2dsa2NVMjV0?=
 =?utf-8?B?dTlJZlNiSGxneGNFVmpCeVF5dTJnM2VNRGx1RzZGUys0OUNCVGVXekkxOTdT?=
 =?utf-8?B?eGgxWjhKdFh1dVJ6ZDg0M1B1SVh4SStwTzluRC9jRm5WRk55UWk3MDhmUFAx?=
 =?utf-8?B?SGw3SlZOME5maXp5N3hHVitjd3dieTJ4bFp4NUc1Vm5uMjAyV2VVdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E04D00E75F6DB449A2CDF4B10C1FA90B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d5c151-e417-429d-b69e-08d9e4bde8fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 13:30:55.7304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sVwjzZzJwKs9k1xlN4w5FIl/SUlCAHIArGUG7RG/0iU5LjG4rXSc+XHKuL4E38M9KWFyXHKQM6rW8HvQVBqZV5QcxCiOOsMlYzRn6RosA7Lc/wiccj5SWywJyy2i93Ot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3749
X-Proofpoint-GUID: kZbuJDqbHlGh5drQyfhH43XI6DOC9XVb
X-Proofpoint-ORIG-GUID: kZbuJDqbHlGh5drQyfhH43XI6DOC9XVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_05,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310090

DQoNCk9uIDMxLjAxLjIyIDEzOjM5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzEuMDEuMjAy
MiAxMjoyMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAzMS4wMS4yMiAx
MzoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBSaWdodCAoc2VlIG15IHByZXZpb3Vz
IHJlcGx5IHRvIHRoaXMgY29tbWVudCkuIEkgdGhpbmsgaXQgd291bGQgYmUNCj4+PiBlYXNpZXIg
KGFuZCBjbGVhbmVyKSBpZiB5b3Ugc3dpdGNoZWQgdGhlIGRlZmF1bHQgYmVoYXZpb3IgcmVnYXJk
aW5nDQo+Pj4gdW5oYW5kbGVkIHJlZ2lzdGVyIGFjY2VzcyBmb3IgZG9tVXMgYXQgdGhlIHN0YXJ0
IG9mIHRoZSBzZXJpZXMgKGRyb3ANCj4+PiB3cml0ZXMsIHJlYWRzIHJldHVybnMgfjApLCBhbmQg
dGhlbiB5b3Ugd29uJ3QgbmVlZCB0byBhZGQgYWxsIHRob3NlDQo+Pj4gZHVtbXkgaGFuZGxlciB0
byBkcm9wIHdyaXRlcyBhbmQgcmV0dXJuIH4wIGZvciByZWFkcy4NCj4+Pg0KPj4+IEl0J3MgZ29p
bmcgdG8gYmUgbW9yZSB3b3JrIGluaXRpYWxseSBhcyB5b3Ugd291bGQgbmVlZCB0byBzdXBwb3J0
DQo+Pj4gcGFzc3Rocm91Z2ggb2YgbW9yZSByZWdpc3RlcnMsIGJ1dCBpdCdzIHRoZSByaWdodCBh
cHByb2FjaCB0aGF0IHdlDQo+Pj4gbmVlZCBpbXBsZW1lbnRhdGlvbiB3aXNlLg0KPj4gV2hpbGUg
SSBhZ3JlZSBpbiBnZW5lcmFsLCB0aGlzIGVmZmVjdGl2ZWx5IG1lYW5zIHRoYXQgSSdsbCBuZWVk
IHRvIHByb3ZpZGUNCj4+IGhhbmRsaW5nIGZvciBhbGwgUENJZSByZWdpc3RlcnMgYW5kIGNhcGFi
aWxpdGllcyBmcm9tIHRoZSB2ZXJ5IHN0YXJ0Lg0KPj4gT3RoZXJ3aXNlIG5vIGd1ZXN0IGJlIGFi
bGUgdG8gcHJvcGVybHkgaW5pdGlhbGl6ZSBhIFBDSSBkZXZpY2Ugd2l0aG91dCB0aGF0Lg0KPj4g
T2YgY291cnNlLCB3ZSBtYXkgd2FudCBzdGFydGluZyBmcm9tIHN0dWJzIGluc3RlYWQgb2YgcHJv
cGVyIGVtdWxhdGlvbiwNCj4+IHdoaWNoIHdpbGwgZGlyZWN0IHRoZSBhY2Nlc3MgdG8gcmVhbCBI
VyBhbmQgbGF0ZXIgb24gd2UgYWRkIHByb3BlciBlbXVsYXRpb24uDQo+PiBCdXQsIGFnYWluLCB0
aGlzIGlzIGdvaW5nIHRvIGJlIGEgcmF0aGVyIGJpZyBwaWVjZSBvZiBjb2RlIHdoZXJlIHdlIG5l
ZWQNCj4+IHRvIGV4cGxpY2l0bHkgaGFuZGxlIGV2ZXJ5IHBvc3NpYmxlIGNhcGFiaWxpdHkuDQo+
IFNpbmNlIHRoZSB0d28gc3ViLXRocmVhZHMgYXJlIG5vdyBhYm91dCBleGFjdGx5IHRoZSBzYW1l
IHRvcGljLCBJJ20NCj4gYW5zd2VyaW5nIGhlcmUgaW5zdGVhZCBvZiB0aGVyZS4NCj4NCj4gTm8s
IHlvdSBhcmUgbm90IGdvaW5nIHRvIG5lZWQgdG8gZW11bGF0ZSBhbGwgcG9zc2libGUgY2FwYWJp
bGl0aWVzLg0KPiBXZSAob3IgcmVhbGx5IHFlbXUpIGRvbid0IGRvIHRoaXMgb24geDg2IGVpdGhl
ci4gQ2VydGFpbiBjYXBhYmlsaXRpZXMNCj4gbWF5IGJlIGEgbXVzdCwgYnV0IG5vdCBldmVyeXRo
aW5nLiBUaGVyZSBhcmUgYWxzbyBkZXZpY2Ugc3BlY2lmaWMNCj4gcmVnaXN0ZXJzIG5vdCBjb3Zl
cmVkIGJ5IGFueSBjYXBhYmlsaXR5IHN0cnVjdHVyZXMgLSB3aGF0IHRvIGRvIHdpdGgNCj4gdGhv
c2UgaXMgZXZlbiBtb3JlIG9mIGEgcXVlc3Rpb24uDQo+DQo+IEZ1cnRoZXJtb3JlIGZvciBzb21l
IG9mIHRoZSBmaWVsZHMganVzdGlmaWNhdGlvbiB3aHkgYWNjZXNzIHRvIHRoZQ0KPiByYXcgaGFy
ZHdhcmUgdmFsdWUgaXMgZmluZSBpcyBnb2luZyB0byBiZSBlYXN5OiByL28gZmllbGRzIGxpa2UN
Cj4gdmVuZG9yIGFuZCBkZXZpY2UgSUQsIGZvciBleGFtcGxlLiBCdXQgZXZlcnkgYml0IHlvdSBh
bGxvdyBkaXJlY3QNCj4gYWNjZXNzIHRvIG5lZWRzIHRvIGNvbWUgd2l0aCBqdXN0aWZpY2F0aW9u
Lg0KPg0KPj4gQXQgdGhlIG1vbWVudCB3ZSBhcmUgbm90IGdvaW5nIHRvIGNsYWltIHRoYXQgdlBD
SSBwcm92aWRlcyBhbGwgbWVhbnMgdG8NCj4+IHBhc3MgdGhyb3VnaCBhIFBDSSBkZXZpY2Ugc2Fm
ZWx5IHdpdGggdGhpcyByZXNwZWN0IGFuZCB0aGlzIGlzIHdoeSB0aGUgZmVhdHVyZQ0KPj4gaXRz
ZWxmIHdvbid0IGV2ZW4gYmUgYSB0ZWNoIHByZXZpZXcgeWV0LiBGb3IgdGhhdCByZWFzb24gSSB0
aGluayB3ZSBjYW4gc3RpbGwNCj4+IGhhdmUgaW1wbGVtZW50ZWQgb25seSBjcnVjaWFsIHNldCBv
ZiBoYW5kbGVycyBhbmQgc3RpbGwgYWxsb3cgdGhlIHJlc3QgdG8NCj4+IGJlIHJlYWQvd3JpdGUg
ZGlyZWN0bHkgd2l0aG91dCBlbXVsYXRpb24uDQo+IEkgdGhpbmsgeW91IG5lZWQgdG8gc2VwYXJh
dGUgd2hhdCB5b3UgbmVlZCBmb3IgZGV2ZWxvcG1lbnQgZnJvbSB3aGF0DQo+IGdvZXMgdXBzdHJl
YW06IEZvciBkZXYgcHVycG9zZXMgeW91IGNhbiB2ZXJ5IHdlbGwgaW52ZXJ0IHRoZSBwb2xpY3kN
Cj4gZnJvbSB3aGl0ZS0gdG8gYmxhY2stbGlzdGluZy4gQnV0IGlmIHdlIGFjY2VwdGVkIHRoZSBs
YXR0ZXIgaW50byB0aGUNCj4gbWFpbiB0cmVlLCB0aGUgcmlzayB3b3VsZCBiZSB0aGVyZSB0aGF0
IHNvbWV0aGluZyBnZXRzIG1pc3NlZCBhdCB0aGUNCj4gdGltZSB3aGVyZSB0aGUgcGVybWlzc2lv
biBtb2RlbCBnZXRzIGNoYW5nZWQgYXJvdW5kLg0KPg0KPiBZb3UgY291bGQgZXZlbiBoYXZlIGEg
bm9uLWRlZmF1bHQgbW9kZSBvcGVyYXRpbmcgdGhlIHdheSB5b3Ugd2FudCBpdA0KPiAoYWxvbmcg
dGhlIGxpbmVzIG9mIHBjaWJhY2sncyBwZXJtaXNzaXZlIG1vZGUpLCBhbGxvd2luZyB5b3UgdG8g
Z2V0DQo+IGF3YXkgd2l0aG91dCBuZWVkaW5nIHRvIGNhcnJ5IHByaXZhdGUgcGF0Y2hlcy4gVGhp
bmdzIG1heSBhbHNvDQo+IGluaXRpYWxseSBvbmx5IHdvcmsgaW4gdGhhdCBtb2RlLiBCdXQgdGhl
IGRlZmF1bHQgc2hvdWxkIGJlIGEgbW9kZQ0KPiB3aGljaCBpcyBzZWN1cmUgKGFuZCB3aGljaCBw
ZXJoYXBzIGluaXRpYWxseSBvZmZlcnMgb25seSB2ZXJ5IGxpbWl0ZWQNCj4gZnVuY3Rpb25hbGl0
eSkuDQpPaywgc28gdG8gbWFrZSBpdCBjbGVhcjoNCjEuIFdlIGRvIG5vdCBhbGxvdyB1bmhhbmRs
ZWQgYWNjZXNzIGZvciBndWVzdHM6IGZvciB0aGF0IEkgd2lsbCBjcmVhdGUgYQ0KZGVkaWNhdGVk
IHBhdGNoIHdoaWNoIHdpbGwgaW1wbGVtZW50IHN1Y2ggcmVzdHJpY3Rpb25zLiBTb21ldGhpbmcg
bGlrZQ0KdGhlIGJlbG93IChmb3IgYm90aCB2UENJIHJlYWQgYW5kIHdyaXRlKToNCg0KZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMN
CmluZGV4IGM1ZTY3NDkxYzI0Zi4uOWVmMmExYjVhZjU4IDEwMDY0NA0KLS0tIGEveGVuL2RyaXZl
cnMvdnBjaS92cGNpLmMNCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQpAQCAtMzQ3LDYg
KzM0Nyw3IEBAIHVpbnQzMl90IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGlu
dCByZWcsIHVuc2lnbmVkIGludCBzaXplKQ0KIMKgwqDCoMKgIGNvbnN0IHN0cnVjdCB2cGNpX3Jl
Z2lzdGVyICpyOw0KIMKgwqDCoMKgIHVuc2lnbmVkIGludCBkYXRhX29mZnNldCA9IDA7DQogwqDC
oMKgwqAgdWludDMyX3QgZGF0YSA9IH4odWludDMyX3QpMDsNCivCoMKgwqAgYm9vbCBoYW5kbGVk
ID0gZmFsc2U7DQoNCiDCoMKgwqDCoCBpZiAoICFzaXplICkNCiDCoMKgwqDCoCB7DQpAQCAtNDA1
LDYgKzQwNiw4IEBAIHVpbnQzMl90IHZwY2lfcmVhZChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVk
IGludCByZWcsIHVuc2lnbmVkIGludCBzaXplKQ0KIMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBjbXAg
PiAwICkNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQoNCivCoMKgwqDCoMKg
wqDCoCBoYW5kbGVkID0gdHJ1ZTsgLyogRm91bmQgdGhlIGhhbmRsZXIgZm9yIHRoaXMgYWNjZXNz
LiAqLw0KKw0KIMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBlbXUub2Zmc2V0IDwgci0+b2Zmc2V0ICkN
CiDCoMKgwqDCoMKgwqDCoMKgIHsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSGVhZGlu
ZyBnYXAsIHJlYWQgcGFydGlhbCBjb250ZW50IGZyb20gaGFyZHdhcmUuICovDQpAQCAtNDMyLDYg
KzQzNSwxMCBAQCB1aW50MzJfdCB2cGNpX3JlYWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBp
bnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSkNCiDCoMKgwqDCoCB9DQogwqDCoMKgwqAgc3Bpbl91
bmxvY2soJnBkZXYtPnZwY2lfbG9jayk7DQoNCivCoMKgwqAgLyogQWxsIHVuaGFuZGxlZCBndWVz
dCByZXF1ZXN0cyByZXR1cm4gYWxsIDEncy4gKi8NCivCoMKgwqAgaWYgKCAhaXNfaGFyZHdhcmVf
ZG9tYWluKGQpICYmICFoYW5kbGVkICkNCivCoMKgwqDCoMKgwqDCoCByZXR1cm4gfih1aW50MzJf
dCkwOw0KKw0KIMKgwqDCoMKgIGlmICggZGF0YV9vZmZzZXQgPCBzaXplICkNCiDCoMKgwqDCoCB7
DQogwqDCoMKgwqDCoMKgwqDCoCAvKiBUYWlsaW5nIGdhcCwgcmVhZCB0aGUgcmVtYWluaW5nLiAq
Lw0KDQpAUm9nZXI6IGRvZXMgdGhlIGFib3ZlIHdvcmsgZm9yIHlvdT8NCg0KMi4gRm9yIHRoZSB0
aW1lIGJlaW5nLCB3aGlsZSBvbmx5IGEgcmVkdWNlZCBzZXQgb2YgcmVnaXN0ZXJzIGlzIGVtdWxh
dGVkLA0KZXZlcnlvbmUgd2hvIHdhbnRzIHRvIHRlc3QgdlBDSSBmb3IgZ3Vlc3RzIHNob3VsZCBl
aXRoZXIgY3JlYXRlIHRoZWlyIG93bg0KcGF0Y2ggd2l0aCB0aG9zZSBoYW5kbGVycyBpbXBsZW1l
bnRlZCBvciBvdmVyY29tZSB0aGF0IGluIGFueSBvdGhlcg0Kc3VpdGFibGUgd2F5LCBlLmcuIHdp
dGggYSBoYWNrIHRoYXQgcmVtb3ZlcyBIVyByZWdpc3RlciBhY2Nlc3MgcHJvdGVjdGlvbg0Kb3Ig
YnkgYW55IG90aGVyIG1lYW5zLg0KDQo+DQo+PiBBbm90aGVyIHF1ZXN0aW9uIGlzIHdoYXQgbmVl
ZHMgdG8gYmUgZG9uZSBmb3IgdmVuZG9yIHNwZWNpZmljIGNhcGFiaWxpdGllcz8NCj4+IEhvdyB0
aGVzZSBhcmUgZ29pbmcgdG8gYmUgZW11bGF0ZWQ/DQo+IEJ5IHZlbmRvciBzcGVjaWZpYyBjb2Rl
LCBJJ20gYWZyYWlkLiBBc3N1bWluZyB0aGVzZSBjYXBhYmlsaXRpZXMNCj4gcmVhbGx5IG5lZWQg
ZXhwb3NpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLg0KSSBoYXZlIGEgZmVlbGluZyB0aGlzIGlzIG5v
dCBnb2luZyB0byBoYXBwZW4uLi4NCj4NCj4gSmFuDQo+DQoNClRoYW5rIHlvdSwNCk9sZWtzYW5k
cg==

