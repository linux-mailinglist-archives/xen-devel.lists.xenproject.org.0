Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF863EC53
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 10:22:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450396.707634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0flY-0000LK-BH; Thu, 01 Dec 2022 09:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450396.707634; Thu, 01 Dec 2022 09:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0flY-0000IG-7I; Thu, 01 Dec 2022 09:22:00 +0000
Received: by outflank-mailman (input) for mailman id 450396;
 Thu, 01 Dec 2022 09:21:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pMaK=37=citrix.com=prvs=3274cb7b8=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0flW-0000I8-Lg
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 09:21:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 985d509c-7159-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 10:21:56 +0100 (CET)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 04:21:51 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 09:21:46 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 09:21:46 +0000
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
X-Inumbo-ID: 985d509c-7159-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669886516;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Wx9YRRqR8NDFoWKn6VBaGrKqmGimLUWd5KB2t2RPG4g=;
  b=RVIpfmwog1dcOogxHVdTl30FY1s2U/QUsVHmjvIIn3hmi1tIGKIkNBdn
   iUGEu6uGAVk2M5c5ktBqVB0pO78boqKxiM2YLJgc8PU04B3VYKJRcLVCv
   nZSSFZH3sUcBRKHg8YFzThNOZHArHVFAEGQHh7Nz2oB+IKFPQyJ3lTMyB
   I=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 86433351
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:21i0LaOo07IH4drvrR1qlsFynXyQoLVcMsEvi/4bfWQNrUp31zEBz
 2QaCmqAPvbeZWWjftolbo6woBlX75eDy4JnQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5gVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0usnGnFkx
 aZbEywmUAyDo/m22u2cVfY506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujeJpOBy+OGF3N79d9CURMMTgkGCo
 WHu9GXlGBAKcteYzFJp91r82LOUxnimAer+EpXk/NhpkEGD2FAsKzQHcwq3o+uV01GXDoc3x
 0s8v3BGQbIJ3E62StjwWTWorXjCuQQTM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht9/gGzFHqrCeTnOZsLCOoluaJiw9PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 Fi3QDMWgrwSiYsB0fW99FWe2Ta0/MGWFEgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvJ5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:fIBLIKzMSNnO2nDM+GHKKrPwFr1zdoMgy1knxilNoHtuHvBw9v
 rAoB1/73TJYVkqNk3I9ergBEDjewK+yXcF2+ks1N6ZNWGN1VdAR7sSj7cKrQeQfBHWx6pw0r
 phbrg7KPCYNykdsS8i2njcLz/3+qjizJyV
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86433351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGrFrR8nqIVXsqezozOZX8P3Q/mdf6W6wOU/2h0Ltq7RwwRxx5I2N6/lOKk4jJ/xR3s+QF4M6RSFojECTI9BC74YubTuacUs6ygTy4N7T40qpZQvUf58NjPVc4As6Tv0n86scR/SCVpzvx3IDDCSnqIBJKsc4G6J0MTzjtbPHdTvvBe4FiFmVr+v4TLtMlJEwMfDH0dlrQTezEFHqHSKME17K6MPSU9ZCPGandF1fhjDt90zNkpeeuLkR2bpDCiC7rs4L6P+R+VNvmQ6xDBojsk8nJ2GFoeUGZN3YP5HnnHq1GjmGLWX+JyjXQ1zcskywVxMxY2ir5pcDw7zYly06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wx9YRRqR8NDFoWKn6VBaGrKqmGimLUWd5KB2t2RPG4g=;
 b=EcLPGWpCEU+M55eLkpWH3vPjch1aDuAUUA5c5BJzaWLwiTMd22DwOzXA470/l128M4cY86AWJjukTaiB0+Vzl7w3AeC3xX9tskfdf6Lt91dGSHxfXtuMD/P9qY0rFufUvC4Bi9QMWWH1zqc6YMwerFNmUHdFzGcopUyuGiNCmKLNcKJRpHRP99kCoTb6Z8W/JXfK3fTIZecfGBhwbiI7YCjQ9AjO3YPxVy+NDtttG3S3//8arLSjVC1+9KfoORPhvfnndlijQVb+FxUaykigMo1TRv/0DLvMSkwnn4cANE9DlhyF1NRFAa52vY0RB073MxT+LjZs94/VVuuxolK0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wx9YRRqR8NDFoWKn6VBaGrKqmGimLUWd5KB2t2RPG4g=;
 b=d1GOJj+InQoecSwVKLZNxlwuf2mgBP0YdOCL6CS2qh9sagHJJkq73Q7dfa4bwKCYHOPBpWc0w6lQ5n8NkswNfEoJ+ZgxXJRULkKyMEV2PLgZPTFddppuYLofX2ud8ku8X0q+fUMIoscG5VMXzIhjyDPSUvNZoWUG+Xsar5zSw7s=
From: Edwin Torok <edvin.torok@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Thread-Topic: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Thread-Index: AQHZBOHhQzYCKXctsk6F2XwSospvV65YwCGAgAACuQA=
Date: Thu, 1 Dec 2022 09:21:45 +0000
Message-ID: <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
In-Reply-To: <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_
x-ms-office365-filtering-correlation-id: a813f9ae-e79f-41de-6fd7-08dad37d77c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ESgu/xQazLiwF6pzZXRS8SDta5njvCGwyAoWE4mAgbRLDE2oN66O34CcXTM1bZ7C1/eODRLeDjt91JCXN+oTJcShNI0j57Kgo28hbUTwslQUiej2TBqt0UHnpg3H2ZQEWUDDpI5HiaUewbYJaM2l64bLQem4JxA+v/5y1OOghE1o/TA1aT+ZqHbCpx5qdeEtGXlAvMjwOPu4klmY+1EQD3hEnqmxvUcmz2QBKyL/HdVG2KCfEl8bRHhliG4Z4YsnK7b4trqxOoJc4E1wws2Q++tzvjdqix7Y8852BQH92ImthyG7Rze3gh1kqgjydJEJ55zCQzAzHkfKfpdzd0At+agEzE+GdG6ujgOjd0csBk+DctmYfrRCAb9B1ZpBkZRpwgCow44dWW0y3VijIl+LDC3MDo/Px4Cc0Fy2LjQzAYlcr8BTQSDvF0ePa0aT8Dsy0Y6boHViI0CCr0UoDlMTUcx+Iv0tcVAtcbKIYHLuLfYZMC380juaniaXhL7lLtBaCC0yODgN1jzqj2UWoUEwB071UOFA6JPBTCWss9JMYPstXcawvIw4rpR0UC5wKV5enOrHGYXeQKi3y/PWFGBI7cgDSKS4LOfeiPFGGdXURFn1kfEXzCXVj5h1tyzprqFRlCikipCImctPnKHIAAWFnPjo4aG/JUbr8qoVF1+tg6KXbjNkuYu3z0BE/CjhRRnnuYzzTxo9C3SEMr3p+02CzR5ngxBaWJZ5FAUUglRKzeYQVmPdx5kgN2yUWIYEpVqPXZvtmHvT7ePdprAZPBodlg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199015)(8676002)(66556008)(41300700001)(4326008)(66446008)(36756003)(66476007)(66946007)(64756008)(91956017)(86362001)(38100700002)(33656002)(76116006)(82960400001)(2906002)(2616005)(6512007)(6486002)(478600001)(83380400001)(66574015)(6916009)(71200400001)(8936002)(26005)(53546011)(316002)(6506007)(38070700005)(54906003)(5660300002)(186003)(122000001)(142923001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eER6cXN6TWJmT3d6dVRqRk9KZU5yOFh6YzB5aTRTN1poR3F2YVFPK3JQRVhn?=
 =?utf-8?B?Y0RUeXc1VWNFallKV3hHTUR3Z2c3SVp2TzUxYWlhZVVKaEZvY1F1eFBZQjhp?=
 =?utf-8?B?R3pjV2VZczM5OTV1MG9YTTM5dWR0VHIzT2FRYnBZeEMyYTVRVnQrUWNHR2tU?=
 =?utf-8?B?Vnl4NXFCb2hSRlpjb255cUJYQ0hmRDZiZ3pLQm42bzFpZFRRc0podmY5eWEy?=
 =?utf-8?B?V0d0cTg5c1BIZVBMYkFCVGlDZ21UT1FFdlliSUdtdTJJQlZDWVBQakJ0S3ly?=
 =?utf-8?B?RkR6Y285SzJyMmFMODVvTVFrNjc1aG9QeFBHcUFGMDJjWFdwaWZ4cXlzY1BK?=
 =?utf-8?B?dnZrUTM5TG9PM3VPVUI1ZmhKZEtzMWV1aUkrUWZBM2RSRFlsN0VqMTFMckNX?=
 =?utf-8?B?R05jdFBDSm1uZys3S01xQVpobUJlQitaNnZHc0tIWFBjUktwdXlGRHpBWWZC?=
 =?utf-8?B?dXdwTmthemoyUW9hR0h6dFNtRTE1T0hrSnhJWVVxRGVMVVN1bWIycnMxSW5E?=
 =?utf-8?B?b3NmTW8zL2J0T0RMcXFQZmNEem9HUU9wQ05Gd0J3cFBQRk1XZmpkaEZYZURx?=
 =?utf-8?B?d1ptbmJYTlE0N2JsMEpYY0hoNU5vSmlhT3c0MkNiRE5CNEVxWFJOT1ZNcWhT?=
 =?utf-8?B?YjROOU5aYnVCTytxL2oycmk0TGcwY01rRzJ2Y3oyQStjazQrZjZOeWpNVWFq?=
 =?utf-8?B?UEhHRmFPY1drdTJXYXFMbHJ2Y2ZEM3hJQituVXVpZThqRk90NzdXcmdPK0xW?=
 =?utf-8?B?RkVLQXlGRkN4UDIxaXR6Zk5mN0plSUlScFN1VDZHWjdiZFRIRkZhczE3M0JR?=
 =?utf-8?B?QS9aZDYvVDhqaGFyQ3VEYUVwbURUbmtiOU8vVk45VUxyYzZJcGp5cEhvOFQz?=
 =?utf-8?B?dUY4Ui9pUHk2UWhneGdiZW1IQXJrQkFYTW9nUGR3aHJlU1c5ZGVtNHhkaWZq?=
 =?utf-8?B?cmZqc0NNRG1YRjlCeWRHV29oYmpGSmZ5aVJiYTF4RVU1bkhIV28vUHVLVDh1?=
 =?utf-8?B?TGpWZlBmaTJ0Y0dFc2ZScW1ZTjdsSTFxZ0RuWElUU3E2ajhEQjMyVTk5SkhB?=
 =?utf-8?B?bW1IeThOaU9XZ3dmMUU1d1ZJY0QyTWhPWnhoYThqcDZ5SGVEOGE3ZHhLWUtL?=
 =?utf-8?B?NFZ2Rms3QU9aUitFdi9zUVV6anFaWTNENWNhalJmbDhkMjc1RGRhYnl5Z1cz?=
 =?utf-8?B?VVpLYmd2SkRLNjRSZkk1TStkYVd1b3hxQ014T003NnhqVlpUa21oK3A4MXNw?=
 =?utf-8?B?NitWNmxHRkltNjRMOVZVRkZRbnZwTjRJcjIzNTlnV29TbnFMY0p4VDduRDI3?=
 =?utf-8?B?MFFpNE43RE5yb3ExaUdoWmh3SDVQVUR0aS8zL1Q3aCt1QnBQVGorMXpkempV?=
 =?utf-8?B?L0RXcVh5a29ZNEVSTm9EWVlDNkh1amNabUlBeElSYlVHSm1Bd3RoeDBjbWtv?=
 =?utf-8?B?Ny9WSXdmL0Zwc3I2aUxxdUMzZ3hBbUplUG42N0ZwcmhkWTBDMEZXN1FWMXNO?=
 =?utf-8?B?VE05ZytPZG1pSFkyMnF3R0lndTVUTFVOVmkzLzRYZW82WkF6amo5NTlWK29H?=
 =?utf-8?B?ZmdZcTJ1UmdmUVdyUDR3aHZ1RWJ1elY5KzNETXJmQXpuVkVvY0pZaFdrdElq?=
 =?utf-8?B?RXRUMHhRZ1A4ZHVVWnJLK1F5YllmZ281NDlna3lCb2dEZVQzY3NKandZbUlR?=
 =?utf-8?B?SVlRTWxIZ3l2OXhTWFVxWDI2M2Q2Y0kwbDZpZ2YvTitNV09GS3Y3K1A2OGtG?=
 =?utf-8?B?bkpNK0JLZktQSE9SdEpUOEhia3JSZ1FTSmljdFhuVzk4QUdza0ZPMy9WeEFn?=
 =?utf-8?B?NE54bGVoaDlZYlBnQVA4bllaZlc2WURONGdLeVJRaStTNWxHK3VsQUVQS1cw?=
 =?utf-8?B?bS9JT3kraUNGamhBYkhGMmpQckFpWTdWSmY1ZWhNMEhySVduaGorM0RJL2VV?=
 =?utf-8?B?cDFRNVZ5a1lUN0dYT3p5dTBkWEFKYWZHcWpLSElObkF1akRRSmFxWnB0T1J1?=
 =?utf-8?B?SmNWbll1WDYwMEd1TTRmNUhUOWw3T1VoZW5OSTdUMWQrRTIwTWxmVm9jNStH?=
 =?utf-8?B?QVdsNTg2Q2p4K0w2eFBFSS9KS25kbG16NGxpTlZVcHFvK21SN2J6emVzb1A3?=
 =?utf-8?B?RERJTUR0STc3TW40M2xXeUNTZStRdUhOM0NreU1kWmpVMzFGSFJBWExBb0xt?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24EB16CD18195F4AB8C85776FC39C54D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v1bkTwgt2+qgtwB9XWyKLcXn2AkB+6/lShI5up9rNh1ETscnyZ2eCHp8rUUiIeqPQyMwgOuhupvzhMXRkIwdscQprzUogiPnw7T5KG/c2HH3XlQ0Yp/9hm2DZZ6GDDQK7RE7T4MzTZFDw8AvPOeaSeuc/THQya4PPQcjheDwHqLEXvuYe8gDcTvnDB4W2JDCzZYaW7kewNaeYw5dkey1dd9fPpZXQ3TWfu0XUBdDgmMOpCokYawisd8myHyUOzRLkffXBe/atS24ojiQfOs8Hlq6CE2RPMdEO0FX3kQguWEn9KGWVpTsxEzV6vMxS2LN9uejx6fparTFIripWZBI1UruAzpec1P4sha5DkbP2imDoGbzjoVa5nXjyRAQ+hwq8P8yG4oVqCUsLS5ZCi+Xf31biNUWIqxmKNeNXLpnWurUBgBQIUSKpYmXdJyKlahefVbJjV+IKKXdgWhYJTaH5QcO5JXhEuDzQZ8i3lxEyc5wdwb9SsUkBi4diebf7Vhx8G1jrFogbycTbJPXL9tyfUEvjRSCn5B8dEAORpVXOeKuxWcG5X9v245TVWW9Dt3/ypa2isYUDgLF1VNX18+RH8kDVp3kTKpaA6pkM54Tt4l4Gv348BzUJEpwN0YUibHyYzVIc2M+twnAkWKQC47P1mMoR6UF1GGm+rZeuPG7LmfbxhXryh6jffJI2bhnAq3B9Ts33GjM9f8YHnz3TjpBjip/88Cj/ZQda3o3wCnUqCDMpyamCJdwDxWWLLbXGUIRTACeE76ueJNrGdOv0xw7uhJgPajB/OzIsDedHutv+Tt5d5DIqTl6fTWzX9khcWZ+N42B3gNf9UZew1P20v9ogrzHConY5QkPJYwIIV5fqk707M60yNDd1O4xLR0URWFu
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a813f9ae-e79f-41de-6fd7-08dad37d77c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 09:21:46.0187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYme9QD/sMZ34YqcYOFO/S8ubCr3ZP2KiZ9rLwRYKoUPHkLAy2OY2H5DKknoO8Al8im5HEp6xFxL0UbnxsttaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5888

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMDk6MTEsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gSGkgRWR3aW4sDQo+IA0KPiBUaGUgdGl0bGUgc2hvdWxkIGhhdmUg
Ik9DYW1sIiB0byBjbGFyaWZ5IHRoYXQgLmNsYW5nLWZvcm1hdCBpcyBub3QgYWRkZWQgYXQgdGhl
IHJvb3QgbGV2ZWwuDQo+IA0KDQpTdXJlLCBJJ2xsIHVwZGF0ZSB0aGF0IHdoZW4gSSByZXNlbmQu
DQoNCj4gT24gMzAvMTEvMjAyMiAxNzozMiwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4+IEFkZCBh
IC5jbGFuZy1mb3JtYXQgY29uZmlndXJhdGlvbiB0aGF0IHRyaWVzIHRvIG1hdGNoIENPRElOR19T
VFlMRSB3aGVyZQ0KPj4gcG9zc2libGUuDQo+PiBJIHdhcyBub3QgYWJsZSB0byBleHByZXNzIHRo
ZSBzcGVjaWFsIGNhc2luZyBvZiBicmFjZXMgYWZ0ZXIgJ2RvJw0KPj4gdGhvdWdoLCB0aGlzIGNh
biBvbmx5IGJlIGNvbnRyb2xsZWQgZ2VuZXJhbGx5IGZvciBhbGwgY29udHJvbA0KPj4gc3RhdGVt
ZW50cy4NCj4+IEl0IGlzIGltcGVyZmVjdCwgYnV0IHNob3VsZCBiZSBiZXR0ZXIgdGhhbiB0aGUg
ZXhpc3RpbmcgYmluZGluZ3MsIHdoaWNoDQo+PiBkbyBub3QgZm9sbG93IFhlbiBjb2Rpbmcgc3R5
bGUuDQo+IA0KPiBSaWdodCwgZnJvbSBwcmV2aW91cyBkaXNjdXNzaW9uLCBJIHdhcyB1bmRlciB0
aGUgaW1wcmVzc2lvbiB0aGF0IGl0IHJlcXVpcmVzIHNvbWUgd29yayB0byB3cml0ZSBhIGNsYW5n
LWZvcm1hdCBmaWxlIGZvciBYZW4uDQo+IA0KPiBJIGFtIGhvcGVmdWwgdGhhdCBzb21lIGRheSB3
ZSB3aWxsIGhhdmUgYSBwcm9wZXIgb25lLiBJbiBmYWN0LCB3ZSBoYXZlIGJlZW4gZGlzY3Vzc2lu
ZyBhYm91dCB0aGlzIGFzIHBhcnQgb2YgTUlTUkEgKCsgU3RlZmFubykuDQo+IA0KPj4gQWRkIHRo
aXMgdG8gdG9vbHMvb2NhbWwgZmlyc3QgYmVjYXVzZToNCj4+ICogdGhlcmUgYXJlIHJlbGF0aXZl
bHkgZmV3IEMgZmlsZXMgaGVyZSwgYW5kIGl0IGlzIGEgZ29vZCBwbGFjZSB0byBzdGFydCB3aXRo
DQo+PiAqIGl0J2QgYmUgdXNlZnVsIHRvIG1ha2UgdGhlc2UgZm9sbG93IFhlbidzIENPRElOR19T
VFlMRQ0KPj4gKHdoaWNoIHRoZXkgY3VycmVudGx5IGRvIG5vdCBiZWNhdXNlIHRoZXkgdXNlIHRh
YnMgZm9yIGV4YW1wbGUpDQo+PiAqIHRoZXkgY2hhbmdlIHJlbGF0aXZlbHkgaW5mcmVxdWVudGx5
LCBzbyBzaG91bGRuJ3QgY2F1c2UgaXNzdWVzIHdpdGgNCj4+ICAgYmFja3BvcnRpbmcgc2VjdXJp
dHkgZml4ZXMgKGNvdWxkIGVpdGhlciBiYWNrcG9ydCB0aGUgcmVpbmRlbnRhdGlvbg0KPj4gICBw
YXRjaCB0b28sIG9yIHVzZSBnaXQgY2hlcnJ5LXBpY2sgd2l0aCBgLVhpZ25vcmUtc3BhY2UtY2hh
bmdlYCkNCj4+IE9uY2UgdGhpcyBpcyB1c2VkIGl0J2xsIG5lZWQgaW5zZXJ0aW5nIHNvbWUgJyNp
bmNsdWRlIDxzdGRpbnQuaD4nLCBvdGhlcndpc2UgeHNfd2lyZS5oDQo+PiBmYWlscyB0byBjb21w
aWxlIGR1ZSB0byB0aGUgbWlzc2luZyB1aW50MzJfdCBkZWZpbmUuDQo+IA0KPiBBdCBmaXJzdCBJ
IHdhcyBhIGJpdCBjb25jZXJuZWQgd2l0aCB0aGlzIHBhcmFncmFwaCBiZWNhdXNlIGEgY29kaW5n
IHN0eWxlIHNob3VsZCBub3QgaW1wYWN0IGNvbXBpbGF0aW9uLiBCdXQgSSBndWVzcyB0aGF0J3Mg
YmVjYXVzZSB0aGUgZm9ybWF0IHdpbGwgY29udmVydCB1MzIgdG8gdWludDMyX3QuIElzIHRoYXQg
Y29ycmVjdD8NCj4gDQo+IElmIHNvLCBJIHdvdWxkIGV4cGFuZCB0aGUgcGFyYWdyYXBoIHRvIGV4
cGxpY2l0IHNheSB0aGF0LCBwZXIgdGhlIGNvZGluZyBzdHllbCwgdTMyIHdpbGwgYmUgY29udmVy
dGVkIHRvIHVpbnQzMl90Lg0KDQoNCmNsYW5nLWZvcm1hdCByZWFycmFuZ2VzIHRoZSBvcmRlciBv
ZiAnI2luY2x1ZGUnIGluIEMgZmlsZXMsIGl0IHNob3VsZG4ndCBjb252ZXJ0IHR5cGVzLg0KQnV0
IHJlYXJyYW5naW5nIChzb3J0aW5nKSBpbmNsdWRlcyBjYW4gc29tZXRpbWVzIHJldmVhbCBidWdz
IHdoZXJlIHRoZSBjb2RlIG9ubHkgaGFwcGVuZWQgdG8gY29tcGlsZSBiZWNhdXNlIHRoZSBpbmNs
dWRlcyB3ZXJlIGRvbmUgaW4gYSBjZXJ0YWluIG9yZGVyDQooZS5nLiB3ZSBpbmNsdWRlZCBzb21l
dGhpbmcgdGhhdCBpbmNsdWRlZCBzdGRpbnQuaCwgdGhlcmVmb3JlIHRoZSBuZXh0IGluY2x1ZGUg
bGluZSB3b3JrZWQsIGJ1dCBpZiB5b3Ugc3dhcCB0aGUgaW5jbHVkZSBvcmRlciB0aGF0IG5vIGxv
bmdlciB3b3JrcyksIGkuZS46DQoNCiNpbmNsdWRlICJjLmgiDQojaW5jbHVkZSAiYi5oIg0KDQp2
cw0KDQovKiBwb3N0IGZvcm1hdHRpbmcgKi8NCiNpbmNsdWRlICJiLmgiDQojaW5jbHVkZSAiYy5o
Ig0KDQpXaGVyZSBjLmggaW5jbHVkZXMgYS5oLCBhbmQgYi5oIGRlcGVuZHMgb24gZGVjbGFyYXRp
b25zIGZyb20gYS5oLCB0aGVuIHByaW9yIHRvIHJlZm9ybWF0IHRoZSBjb2RlIGNvbXBpbGVzLCBh
bmQgYWZ0ZXJ3YXJkcyBpdCBkb2Vzbid0Lg0KDQpXaGljaCBjYW4gYmUgZml4ZWQgYnkgYWRkaW5n
IHRoaXMgdG8gdGhlIEMgZmlsZSAoYW5kIHRoZW4gcmVnYXJkbGVzcyBvZiBpbmNsdWRlIG9yZGVy
IG9mIHRoZSBvdGhlciAyIGl0IGNvbXBpbGVzKToNCiNpbmNsdWRlIDxhLmg+DQoNCk9yIGJ5IGZp
eGluZyBiLmggdG8gaW5jbHVkZSBhLmggaXRzZWxmIGl0IGl0IGRlcGVuZHMgb24gaXQuDQoNCg0K
UGVyaGFwcyB0aGlzJ2QgYmV0dGVyIGJlIGZpeGVkIGluIHhzX3dpcmUuaCBpdHNlbGYgdG8gaW5j
bHVkZSBhbGwgaXRzIGRlcGVuZGVuY2llcywgYnV0IHRoYXQgaXMgYSBwdWJsaWNseSBpbnN0YWxs
ZWQgaGVhZGVyLCBhbmQgdGhlcmUgbWlnaHQgYmUgYSByZWFzb24gd2h5IGl0IGRvZXNuJ3QgaW5j
bHVkZSBzdGRpbnQuaC4NCihuZWl0aGVyIHUzMiwgbm9yIHVpbnQzMl90IGlzIHN0YW5kYXJkIEMs
IGJvdGggcmVxdWlyZSBhIGhlYWRlciB0byBiZSBpbmNsdWRlZCBmb3IgdGhlbSB0byBiZSBhdmFp
bGFibGUpDQoNCkJlc3QgcmVnYXJkcywNCi0tRWR3aW4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0t
IA0KPiBKdWxpZW4gR3JhbGwNCg0K

