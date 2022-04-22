Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672BE50BAF5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 17:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311047.528036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhulR-00040G-EK; Fri, 22 Apr 2022 15:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311047.528036; Fri, 22 Apr 2022 15:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhulR-0003wH-BF; Fri, 22 Apr 2022 15:00:05 +0000
Received: by outflank-mailman (input) for mailman id 311047;
 Fri, 22 Apr 2022 15:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+xj=VA=citrix.com=prvs=1042e1a12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhulQ-0003j4-0w
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 15:00:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e24cc44c-c24c-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 17:00:02 +0200 (CEST)
Received: from mail-dm6nam08lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 11:00:00 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN2PR03MB2400.namprd03.prod.outlook.com (2603:10b6:804:d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 14:59:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 14:59:57 +0000
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
X-Inumbo-ID: e24cc44c-c24c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650639602;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gMv2Mf3HbKb0S1kBCFIVNZS23nc51ueQKQ+r1qjJMw8=;
  b=MlQd5RCakW4rbgJWMv6OzlP8JzOeO0/UAQDzmB4bGVZdGSO51RKNUfqT
   YNLFTg7JXo0zIM0bgGfaYipbjDTXFsqGjw/yRyX5rhhT0aeo9aYclEGW3
   6FAaN9tZnga55lTHr0hiL2oAm6L369DY9Bp/u9wiVtmnNi7lyLbKzPakp
   o=;
X-IronPort-RemoteIP: 104.47.73.40
X-IronPort-MID: 69710555
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WHXPuq0FL5EarR4dz/bD5dBwkn2cJEfYwER7XKvMYLTBsI5bpzNSz
 GEaCDrQa/3fNmr0Kdoiboi0oBsCuMXXzYRnTVZppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIy24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1q7riRFQIwOZbJkd4jQysBQj9iMYZvreqvzXiX6aR/zmXgWl60n7BCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+YBfmSjTNb9G5YasRmNPDSf
 ccGLxFoawzNeUZnMVYLEpMu2uyvgxETdhUG+Q3M/fdqvgA/yiR+6+bcAvuLVefVSJV6hhy/j
 U/E70rmV0Ry2Nu3jGDtHmiXru3AhyTgQ6oJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHiWzWorXjCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Z8hMcOscY3QXkm0
 wGPltaxVTh36uXJETSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa3871KbnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:nCTXiqGfrM4vX1hBpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="69710555"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7CifjANm3gQTEBerVtj5BRhS3h6+YMHzK/uSiBx1gdggFnEmyF3dcdVqLc8P/xqtqxKVjzWOR2iERtyOFTZi5TUCyPjBxoN+Fe2WmnS6AwNkUZ3BNCgHrQP55hSqfFNpxthviXS5VLW6eY1kvGCPKV4S6UkFAfd/HMZ6CpC9m7IGcdk5grd5sn//rCjVEzsTjzlCyuwfJQVtAcC+439Hevwn9VMYJGmbPOdyz8XsBroLseg6P/CV0sTON5/QS1NwcQRGWBqmbE9KmueU+4EfH684+adIgyfH5JuCpJXOEDi/pjTmjzqJdmFrHkbzHn01Z3R8m5NJ10m2XKRKnFo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMv2Mf3HbKb0S1kBCFIVNZS23nc51ueQKQ+r1qjJMw8=;
 b=HmjgcXfhh52aIf+lD0RLiLn8456uCMGvJAQ3kVVKYjMbXMVwRp+hhrcV2DtRpPMGWDsgLwIkTmx6JjsUz3OAjBlzQm9CMhkCamoY8WW8wIJkyNDVAb+XahxKD3r39KCF9yc/Br7ZsLos7e1qzzR8zk0VyvEHOwdmwQVZNjorTWX9yO1hgITkwCV+17bVzqYgMCBphJsCkPCiGIIlOWV4teL4eXCnlfUkcas+v20g4HIWSa4RXnXe1t2Zbk65k7RcrqkBHLj1bCB+/xHKcRxc0yv2mRoEq84YqXSyMcmXViU5RJqAOtptpztE3JGALuxE9a6hUbpVT1C3wCD5FNaXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMv2Mf3HbKb0S1kBCFIVNZS23nc51ueQKQ+r1qjJMw8=;
 b=X7FVe76pXW/bWtH0i2UgVm6bmMgWYaQT2KIbDthopfSIU/uSHUNMRo1Zpah9aTiqLSM4aDhAlsVo55LIUb5UJmwOD+hdCNIu/bpU6JdEmVHd7iVdOfcdSs7ndLKhru5RXnPAUXwd7E+Cdw88b3qM6vRAKgVYSAGloxejt91n9iE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 4/4] tools/libs/light: don't set errno to a negative value
Thread-Topic: [PATCH 4/4] tools/libs/light: don't set errno to a negative
 value
Thread-Index: AQHYVIin9iN+mLKty0OtvWT3B8JHOKz8CCWAgAAA2gCAAAEygA==
Date: Fri, 22 Apr 2022 14:59:57 +0000
Message-ID: <e7a1c235-1746-e3df-f3d5-77edb899b8a2@citrix.com>
References: <20220420073119.16974-1-jgross@suse.com>
 <20220420073119.16974-5-jgross@suse.com>
 <f2d73d68-b313-0f5b-7a42-ad6bef7f5620@citrix.com>
 <f70f7746-2e9d-3418-d198-aa42cb58c9ad@suse.com>
In-Reply-To: <f70f7746-2e9d-3418-d198-aa42cb58c9ad@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b706ecb-a3ba-4dca-e195-08da2470c44f
x-ms-traffictypediagnostic: SN2PR03MB2400:EE_
x-microsoft-antispam-prvs:
 <SN2PR03MB2400E620EE56D258DA3FC971BAF79@SN2PR03MB2400.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oiASaU57zK9sqr7aqNiUC7xWVlNqslNyZhx56X+TKUieREieBVhqlDFnaoq5L3XXyjZethig2Mp2D/29fhYxyQ0PPGSaOC/bhcnTNob+5LSjPm63B74okJQSaj6Lpawr8fkJEddBgLwWLFPl73PIU64YQ3SBCit24xnqgI0V1A1hZ3DtDd8apIiMcvgZ41IZQKiHRMxrHB/3wELCMcg5lHhwV2KJ7QqatWxOlGk2AbT4qraE4SXOc9rum8LCWJ2T+Fxlr7S6N+3k3ING3RRfI8VZY86U3LT+c/i8iDkwfl5Ho0y5RC4O/DVIs6v9mPzQCwgKThc7CR3iz8M6zeJpDOu31O8M2sYpfL1yxbuUYLbBvXA5T+XqqhUDuKFbG0Pm92w5w84YwaIOmrFgPE+V0a05Cz+2osL9A4RMpEyrIB1MLM6S9PEGg3D1uwprUHbKUbuJg8JYuRBKr/8TTgKl397KfhedOfuwkh53mZbe3MMNieXwGvatP60JmCSqN3owp6HFLAvA6B1Uk85aqkPwoYZ1KJIsGMxRYsqJRwawgM+1XC7P9rUdvB5vz6zKeHtX4DAeN6jK9OgyZyTazprnyUvGQQXp1/1BLqQ2yMMrIrm6DrrozF3YeR57ROX7qNONz1KwaHP80+k6THPmqmNGjkHA5EHJ+XRD5n59fv9rStfh8YtXXPbH4ddN83Jcwg/R5iX+PTQwV6AO5WQHQOfkXsdSwBE29ErCY7i+3nTqOAnFGyFDEC0spuX8NF/DoIKH0dD3u4U9MMDobZaDQqdlBA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(2616005)(86362001)(508600001)(6486002)(4744005)(38100700002)(6512007)(91956017)(66946007)(66556008)(4326008)(38070700005)(26005)(8676002)(66476007)(76116006)(66446008)(64756008)(71200400001)(82960400001)(8936002)(36756003)(31696002)(122000001)(316002)(6506007)(31686004)(186003)(54906003)(110136005)(2906002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnlYZjZnWjlHdUZCVTVqd2RjTWJXZWpYQVRndW03RWdmN1dZaHNyTEFXM0R2?=
 =?utf-8?B?S1dxbTRlTWNjQVlQcWc2bG5QSWNVMlNjcndLZlJQSGxUcncwb3BZb0xNSTM4?=
 =?utf-8?B?TVJaelBOY3hUaXdjWWROSXVWdyt6VnNzenUzN2I2REZIM0dDQncwcmRseU94?=
 =?utf-8?B?VWNSQmdnZ0VLb0RmWnVIUFhmcjVXSDdDamV2NHg1bHhqTlJWOHZISkxwSkhS?=
 =?utf-8?B?OVlOMVNVWFJOSjJPYkdpMk9zTXVpRC81eGpGM0RXeXVmVVJjeFpnUU1qVTh0?=
 =?utf-8?B?angzKzg0ZW0rbmhZSXdrd2h3Q1c0dWNrb05DajZ6aDN0ZGU2QVZqVkJOVm1v?=
 =?utf-8?B?RThWZ0ltb0RUOEFHczZnWTNwRTZZYmxROHcyT2dWajhMU2FqRnhhWnMybk4z?=
 =?utf-8?B?YUt6ZkVtVlBoa3c3SlQ5QUJpLyt2ZHhweWE0ak5WYkt3M0RDUk9jd2ZydUVi?=
 =?utf-8?B?NC83bVBSU2k0WkdMQXg4ZW5neHVuV2MvUjFWdDVuOXgrK1VtMWxRVis3c3Iz?=
 =?utf-8?B?bVRjc0xoZ2l6a1AyVEhUbFdYMmt2RjBGUm13S2trVUlBdDFoWU9VNlY5dHZ4?=
 =?utf-8?B?R0ZHTGdqK2VBeXc4blZuNXlmdXdBZ1pQemU4U2R0cUY2SzFzV0d1L3NCclE0?=
 =?utf-8?B?N29JVHRIZGtWbitKVmxTTllBcXk1Y0NzdmthNUFVTlBlNTdCRHNCZ2UrMTFm?=
 =?utf-8?B?eFlkRCs0RllnRzFKZmhqMEpCYlJMa08ya2FwdGRkOHhTdDdWdnFFaXU4b1Fy?=
 =?utf-8?B?QXJiRkpOeHNiRFdTSktYdGQ1Ukk3Y1A0U2pjUVlXS1crQngwcnVpMk9kN1c1?=
 =?utf-8?B?NkJBazZ3QUNCUDJQZHhXVFc0ak9CNUJQM0FXcDQ1cnBaV1M2bWVhZTh4WW96?=
 =?utf-8?B?ekhXU1ZHK0w3YjRQNXdxMWw5UTRNNTg0UVp1ajVvU3RPRXdZUGc1eEw2bm1T?=
 =?utf-8?B?MG5HcmVOMmUvZklMWFNhQVFCaytLZmpaNFZHcFVSdTRySXJaN0RFNzRvYUJv?=
 =?utf-8?B?R0xxaldoclFkS05TOTh1NmlQd1NVdXFzZXBsRDJlZFFrd093OGg4U1RDaU9z?=
 =?utf-8?B?VWhGT1I4UGpSQ0xIVGtPNVNlNHU1dTljRFhjSWE1SCtBVFhON2xVd3czTS9O?=
 =?utf-8?B?VmFoa0NLS1B6dVFjWEtMSFlxWjFKNGdHa01YRmxBb1ZaQ1Y2bUxhUjR6VTdm?=
 =?utf-8?B?bXc5MWRjVVFMN3BNaEtxRHlXa1J0TVhsUjVTOVJROGJtS0NZSmdGOUlBdUpt?=
 =?utf-8?B?aHU4ZitSNHR1V0c5b1hjOW11b1BmeGI1dFEvUHdhYVNVTE1hdTBKcFczS1NV?=
 =?utf-8?B?Wi9UbmVwUFlFYnhKR0xLQlh3d0Qvc1Q1K1U1SkhwQjhnRmpaQ2U0ODh3VnQy?=
 =?utf-8?B?NlpkK3IvdVVwYW1xS1lKU25YN2YzQTgxZkQvbWs3SFlpWmdYOVIxTGluQlRz?=
 =?utf-8?B?WWN1MzJKWG92M2NodXlkdnZtNjNIU0V0WVBFSUQrd2hJcVMreFp2K0FQaUp5?=
 =?utf-8?B?eUdxbEk1QkNmT1FEQXNCRmdnVWdGU0xaVEdUQWpCU05sc0ZSajlKY1krS2VC?=
 =?utf-8?B?NEk3WGN5SkRzaXpQcUlVeG84YUNRRkpYc2lnQVBFenlJZG9UUldMQlBFWDVx?=
 =?utf-8?B?R0JNNTFBNkMwWTlUaVlzaGp2NlBCelRpSERiM0xWY1FjejFWampJQWJDZC9l?=
 =?utf-8?B?OGV0TTF0NHBKVzJRcWsxN21sUldJMndnN0V3QkYzNUc5Y0tTMGRCYkVNZzlE?=
 =?utf-8?B?d1JrNEtPRUZ5TFJnMW9tbjF1SmF5Q1dHWkFlcWxmVnpsUkFKVkNTNG04dkph?=
 =?utf-8?B?UXpkcnVkQnhXZlBXcnhZT01OcytlOEV6ZGpJSG9WeEd2ZUlJMUFFN3hLZmx3?=
 =?utf-8?B?VmxIb0dHMGdSUzFtS0pmVzlEVTFKYlN4MEFsNis2TnBlZVlJMGtHS3hTY1Uv?=
 =?utf-8?B?bzc2Y0tPcnp0TlhmQzFaL1lnTTRpUUVFVWNpcHpxNVJ4QVQvNmNYMGtHdE9p?=
 =?utf-8?B?azg0dHJNdFZOeHk2dzAvQlROdW9KZThPdE9SSCtLZ0R3R3A5TDN0Z2k5UUNN?=
 =?utf-8?B?NEh1MGV0ZDQ2dGdkSEszd2RmSGQ5bDk4M013L3VVR0dLeStFelo3VE9hcEtV?=
 =?utf-8?B?SHVScGo5TVdWTVFTY2ZwWklxc09aZjVhckxYUlRjTjJYNEErTkZJUTBSSkRV?=
 =?utf-8?B?cXArYy9jYlhKUFJzWVFna2JVYTlNTFlPK3pYclM1R0RzVDRBTkN4cEVqOHBI?=
 =?utf-8?B?Z0VjSFZ0dXJlaDdzdVdXbG1JM1UwWWNzZFhXMnZaZHBOdlVPRzQxcDk5Mmtk?=
 =?utf-8?B?bVRiZFNJZ2NzRzB0NkFwNHpGVG9wMWxUQWVXKzZFTTBFMUI0MVhMNkJsSTB2?=
 =?utf-8?Q?Xz2wQ8KAFscMntaY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A56305DE46B4FA41B93712FEEBF87A9F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b706ecb-a3ba-4dca-e195-08da2470c44f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 14:59:57.4384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dsllur06aGFnC6r77B1ux4DfSWepgjblpSNDv3dPu+sihqRuQJ+8LgnyNgFfF8rlTSyWpwNfSDKDUpChTk248C9+iVbXW6yN8kk/fXBlqhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2400

T24gMjIvMDQvMjAyMiAxNTo1NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjIuMDQuMjIg
MTY6NTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMC8wNC8yMDIyIDA4OjMxLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOg0KPj4+IFNldHRpbmcgZXJybm8gdG8gYSBuZWdhdGl2ZSB2YWx1ZSBt
YWtlcyBubyBzZW5zZS4NCj4+DQo+PiBGaXhlczogZTc4ZThiOWJiNjQ5Yg0KPj4NCj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pg0KPj4gQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+DQo+IERvIHlv
dSB3YW50IG1lIHRvIHNlbmQgdGhlIHBhdGNoZXMgd2l0aCB0aGUgRml4ZXMgdGFncyBhZGRlZD8N
Cj4NCj4gVEJIIEkgZGlkbid0IGJvdGhlciB0byBkbyB0aGUgcmVzZWFyY2ggZm9yIHRob3NlLCBh
cyB0aGUgd3JvbmcgdmFsdWVzDQo+IGRvbid0IHNlZW0gdG8gY2F1c2UgYW55IGhhcm0gdG9kYXku
IEkganVzdCBzdHVtYmxlZCBvdmVyIHRoZSBpc3N1ZXMNCj4gYW5kIHRob3VnaHQgaXQgd291bGQg
YmUgYSBnb29kIGlkZWEgdG8gZml4IHRob3NlLg0KDQpHaXZlbiB0aGF0IHRoZXJlJ3Mgbm90aGlu
ZyBlbHNlIHRvIGFkanVzdCwgSSB3YXMgdGhpbmtpbmcgb2YganVzdCBmaXhpbmcNCnRoZW0gb24g
Y29tbWl0Lg0KDQpCdXQgd2Ugc2hvdWxkIGJhY2twb3J0IHRoZXNlIHRvIGFsbCBhcHByb3ByaWF0
ZSByZWxlYXNlcyAoY2MgSmFuKS4NCg0KfkFuZHJldw0K

