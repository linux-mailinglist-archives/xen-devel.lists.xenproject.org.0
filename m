Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A253ECE7E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 08:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167169.305123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVsx-000876-Ne; Mon, 16 Aug 2021 06:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167169.305123; Mon, 16 Aug 2021 06:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVsx-00084B-Jh; Mon, 16 Aug 2021 06:14:11 +0000
Received: by outflank-mailman (input) for mailman id 167169;
 Mon, 16 Aug 2021 06:14:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eR/w=NH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFVsv-000841-Ml
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 06:14:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29d29c9b-fe59-11eb-a442-12813bfff9fa;
 Mon, 16 Aug 2021 06:14:08 +0000 (UTC)
Received: from AM6P193CA0053.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::30)
 by DB8PR08MB4121.eurprd08.prod.outlook.com (2603:10a6:10:aa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 06:14:05 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::ea) by AM6P193CA0053.outlook.office365.com
 (2603:10a6:209:8e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 06:14:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 06:14:03 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Mon, 16 Aug 2021 06:14:03 +0000
Received: from 3c9255fd1332.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55AF1D03-A290-4ACE-932D-9922C4D0B8C6.1; 
 Mon, 16 Aug 2021 06:13:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c9255fd1332.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Aug 2021 06:13:53 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5581.eurprd08.prod.outlook.com (2603:10a6:800:1a0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 06:13:50 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Mon, 16 Aug 2021
 06:13:50 +0000
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
X-Inumbo-ID: 29d29c9b-fe59-11eb-a442-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWXZxKP2hXXx2vPbd/ZccMAN5SZaEqoQOhRfcZEnLQk=;
 b=35qQYV0dz3yTKB0C7uCqQnrO3N8qRODsJBTNiza4rTmNNC4N+H/9p3gN+E+Gx2eegvIWKTL0GvW2/JreGjeiEGwJQQlwExIPbXHqHqSfIkXArvZPiWKtseD2KUNi7rzD/g6ksLH8nN9G0B+OL3o4bF1ihmkQgU3i61RX+Ot+wuU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMhcZBSWwxqN2JUwOEFfYK0ksVvjemsvy+7G7r6z70HigkMs47q2tMABxmKQhJRsBWYLIS/oL8kZ2g09BRGLkB7H3CMxY6NWHmGULpez4CVDknNugHdbaJujeSxyxSTjWJDJh+fTAjIP8Q8rzrkVCNuaLpbDZ84SywdMEp9kTSpbuB4JEQ7dojez+TYWZ1xcBE8CW40Lb2G52x3kvWgDAS3idt588vq+TqlZrpLVe5oYIO5YPbnCPqukQ3OHx3YOAX1Pf4B54Mdk76Xi0l7e5gmCWE6D/KcpKWWTwb0IgiQqxACQGYS6YCMZYRf4yD4uhCJzwvFv5rUD/C634Pmnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWXZxKP2hXXx2vPbd/ZccMAN5SZaEqoQOhRfcZEnLQk=;
 b=OEprbh+C/MGy/ITntuUCVEOAX20qL+hRd1uzOLlFUw7wET7Qoi/iGU60z2+8B450G63HrFhbHAzNY4Ptj9n4Feu0rVZa7dfmmYF/th3yDuxTF3jnF7etB5WoHf7/TbsEGObi3pJeOV5cpEFUasMAUSBQInq8rhTw5ZkMbORZIFgsdAdc9V38iVym6836fgTki+PQMdz5M33NNlqtryiv4Z0Gdc/TUlyLcbh3j3oLkdWGPZ/SfsCYcn04WSdrWvNhMGDsD8EZTYJwil58r7/8EGMM7tTZecmGQqjmudUqxkKp2oUA41EPLvVEJfqg33BoWSATTQVOqqrVmS6ysq7CrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWXZxKP2hXXx2vPbd/ZccMAN5SZaEqoQOhRfcZEnLQk=;
 b=35qQYV0dz3yTKB0C7uCqQnrO3N8qRODsJBTNiza4rTmNNC4N+H/9p3gN+E+Gx2eegvIWKTL0GvW2/JreGjeiEGwJQQlwExIPbXHqHqSfIkXArvZPiWKtseD2KUNi7rzD/g6ksLH8nN9G0B+OL3o4bF1ihmkQgU3i61RX+Ot+wuU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 06/10] xen/arm: introduce PGC_reserved
Thread-Topic: [PATCH V4 06/10] xen/arm: introduce PGC_reserved
Thread-Index: AQHXg5tYfiHwEiCVZ0Wdq3o73JubLqtxdE+AgARP/xA=
Date: Mon, 16 Aug 2021 06:13:50 +0000
Message-ID:
 <VE1PR08MB5215942EB423D8823B758E33F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-7-penny.zheng@arm.com>
 <cdccfb6b-33d9-b8cc-6efe-3828278f9b4c@xen.org>
In-Reply-To: <cdccfb6b-33d9-b8cc-6efe-3828278f9b4c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D31D02B108113C4FAD29CFC7B61ACEB7.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e5f4f16c-7bc5-4913-f630-08d9607d0c12
x-ms-traffictypediagnostic: VE1PR08MB5581:|DB8PR08MB4121:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4121ED578B52963B398A6BAEF7FD9@DB8PR08MB4121.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hiu4zO0D9SztExV2L/3YK9XOBfkuNK9U1R+yjGS+ParqJMvAe0OKK6EhcUbeJ8soAbzWOc/vemiMNUABgLEyx055d79MG2g7qFmMpPO1fZZT5vd32MxCx1FXG8Pd1uni1Cdh/vV6xoASz0zz2VBU4tJ10uoqex58MF+VjEubDuiGI+5VemvkV1JKLzw07aYRS4UVghTgT6IQ/JgO4yhwkTZWtpq6K6no/WpM2cO6JPBmSesoUTVEc+qGPVNk5tn2ScvX5XGK4ERzTulW55CSAy1QccncvIb1RGj7R4YxhnPyxQox39XE9IPLA57KIVvixUAbYIe0yJTRHaF1TreTroUQzFXqRJRiF+1EPwBRH7j+6tBCRXx+rFzaUsvusX6RnWT8CSgQW4XnHS90uxpFyaq+wYpUjg7GYkWjg0CMdphxOU3HCT23pkJyCtmfWviD6DY+pRUzuFsCS4DQx4U+gXJHdQWswlAsn2Ri8F6IcTHmCwcFjEbhNVmNPvswn9XuM12LmteMg4YnF/x6G0lJ05rPqLNTPhq39ERwdXsXRuQvOl0nGONg+CDC99dXyYdGW22y1yxzicMGl9i8Ok4pMy65S1qYxmhN/MZ4xCc3MhxV6BGBrCk21ar1reWTQCXdAhnSEAHOTk2MFbAM+VP8JAqgOO6CQK7esEjTg8ucrTV1BAT2mk0l4ovbXcMfocBuRQm8zvnxcJ5Zrw4nrsKvcA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39850400004)(55016002)(9686003)(122000001)(4326008)(38100700002)(5660300002)(4744005)(186003)(54906003)(26005)(52536014)(83380400001)(71200400001)(110136005)(76116006)(66946007)(2906002)(66556008)(64756008)(66446008)(38070700005)(6506007)(86362001)(53546011)(66476007)(8936002)(7696005)(8676002)(478600001)(316002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWVKVU9HTVF5bHRHVlNuS1NxYnRoZ3ZhcUtKeWM0U1lVd2thLzNLY200TDdT?=
 =?utf-8?B?S2twdS9CdWNCNjJIZnNQY0MyR2dkRmErdGEvaDcxdGhVcUFPbjRSbmtyVzFV?=
 =?utf-8?B?aUwzUXQ5cDA5Umh5QnpVbUpyNmE0Ym1NbDFmSlZlWmwyKzhleW1xbVNJR1M2?=
 =?utf-8?B?SVV5WGRJQUdnVWs0VDVyalg3b2RXdVpCVFp0VS9aZGZjNWQ0MGlIU2UwVk1T?=
 =?utf-8?B?TXZLeDB6c1UrVXBuVWNlTHBBVzh5cG4vNWg2Wjc1d1VDY0NDci9jdlhTc1dN?=
 =?utf-8?B?SWkrSnh3T2xmS1RLVEliQXhlMXlEWE5zbUExS2g4OXpTb3p6bSt2U1UvVHFX?=
 =?utf-8?B?RWpCNXU4R0pVLzBQdVFBZTVXcldKQWNrUGppVUdtWTUvTEROTGNGczdObEZy?=
 =?utf-8?B?VUpQYmZ1UlpDRHdVQ2dxa3lyay9XaE1xSTFsV1FqZDFhTnlDRnJad0NWQmlM?=
 =?utf-8?B?KzIwYnlIM1crOEpKRFpLeUszSkQzZDZMVE1PY0pJc2tFRkNOVzA2VVdvV1Nz?=
 =?utf-8?B?SWowV05zMTBHM0pxWmZTRno1Q05hNWVVLzhGYTNEK3o5T2tQWFNiVzRmVzd0?=
 =?utf-8?B?aXdIeEFoL0h0QVBBTjB1ZE52UXhUQ0g0T2pDRjB3eS9lZU1iWHAvd01PWU1R?=
 =?utf-8?B?T3g3dUtKSnpxYVF5V21pTTFrWDhpT1E1NWdiYjZnQWYrNXBzSS8xMTArRnJl?=
 =?utf-8?B?eFNuYTZDUlp4SkgyU3ZFalA4VW1SR0FRRGVCK2NWSmVCTmNwMW14SlRVdTY0?=
 =?utf-8?B?VE9PTm1DRjYycG9aUHVNdFIwT0NSaWg1RGt3cHp6Q2pwL0lvTjJ6RFdBTzNQ?=
 =?utf-8?B?ZjFYQlFrdVZGM2pmL1ZPME4rdFVHQ0tKZkFTbnV1TGdLb25vTkRJbXNzcHpW?=
 =?utf-8?B?MVp1T25WNGEyNFVvVUNZNit5Mm1WVzAwT3lhTGxaOUxXRVlVU1p4Y0FYcUJC?=
 =?utf-8?B?YzJNTVBqUTZXV1pXelFCWlc5TThSVXdHeTJ2U3Z5dEdXR00yVHA5ZEk4Nzg1?=
 =?utf-8?B?RTBMT3FyalgycUlBSXg3WXpQeG9lMFFSWU5aS1JNUHB3M1BsdG9ZcFU1c21S?=
 =?utf-8?B?elI2ZHV3SHRLeFNGc21xTFI5MHhxVDdLNEp0Y1lBOWZQbkN6a1JBdjB0YWR5?=
 =?utf-8?B?REtBZmJMMEVsR0VFc3huTHhFelUvWkl2elJpakE5RzBVR1BzYk9ZSndlbnoz?=
 =?utf-8?B?MjVDUVJ3b1ZwcEI1NGZHaXd1My9CK1d1N05lOUJiQ1B6RGRJeDRqU09USjdr?=
 =?utf-8?B?N2JVUjlhUGlHYks1Y0ZSWGd5YUdGSnA3eDB6dVh6QkpSOWtmeTd3ZjgrVGpZ?=
 =?utf-8?B?MmM0S2JpcXJmUmk4cndMRWFqRkhFVXQzVnEyckplVUxMNGl4eU1HT3FBMXQ5?=
 =?utf-8?B?aEhtTmR1cGlUbG04VDJmTVR6aWNJZUl3T0Z6T3N3N2NwR21QQzJXeng1Znps?=
 =?utf-8?B?NFZ0OHYrZjR3cS9UZ3hSckxubFVzdVk1bHoxUzBFMlpFWEloMU5FcFpCR21M?=
 =?utf-8?B?N2x3OWUwdlY3TjNSUFhubE44Z01GWWEvMDRwazlRMVBWajNGOUo1MXVJd05t?=
 =?utf-8?B?QVlsaUF3cUwvd1oxNWFJY3hGUG80QmhoK0N6QmtkalczNHoyQ1ZQZXdKc3lp?=
 =?utf-8?B?RXYzQVMwMGFVdHRmc2ZZRE5ISUV3cktPR0NJekcwTENCVVJxKzJiWXJUNzVm?=
 =?utf-8?B?Ty9FMGpFMndqdE5TSit3SlN4VkxiNFRHajdZdUFJbXRGTHNtTk14Q1ZVZkh5?=
 =?utf-8?Q?P8Qe4uZpWPnrbhAscff3jU/RRlMwdjOArv/Unln?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5581
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2fbe8de0-9004-477b-8504-08d9607d0444
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wtWoXnt1Pk4OXRn6DCKzxVFg1ncBP8BWFW19Ku/iqoOIfBLxuZZVR4uu2qGdgIp64LNhSdJWVHHsUekFyOcR/SG6x+NFNDNq2tJEuaYuP82FcbHGM5ctnEhQ00Z8knuu5ctsmxFxp58q9CzF4nIjZ0hXf4k6M/b72pQst/A8Ty9WmzXTzKNZEJbMPFQM6ePNzo2qjZDB+O8i1GZ7zzatXmTOyZHyzDMg5pL2CDkFM/udzmC6SuNtqiz/MVsr4l9BZo+Gg5pUHGoT1/fbMUJ5Xcl6JM4MsBp5aYVuVTpoDabH9XtLP4kz6ibDUx1I3MjsJb5ue179R71qChn+aBb4KHfFUmI7uXCFte3KFa7zpD5lr33VQgYTCm4Kt/GZ1eMc52FbMHUIXAgr6vjDZXnvs/yCPk9hfcphIbBDPVRGVLtxaFK/zjZ4yU/oM0bRoEZcOGU2nZh2SWANC9zLrnC6qTiG64i/wy5T8usCntEaRP/MtzOs7URySFOajWcxp/8OiOwWwiGRTnZog2JCvywcGCqOS7P+RWPoTjhDkN6cAH3konGF+7Hi9N1dkzceF202LM+oL8b2WNlrErCsHt7djGiWhegzME50qxQj9LnzhvDnNnMDVag6REfcZBwrCKut6WAYklwooWgC0/l8ct6U3+mAVSP7MSqXn2aun3kyxhEbal71BOp/nGDwOmYfFV4VR0GIg1kdwLoJTEwcPjHqZg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39830400003)(36840700001)(46966006)(81166007)(356005)(8936002)(86362001)(26005)(2906002)(70206006)(70586007)(5660300002)(36860700001)(336012)(47076005)(55016002)(4744005)(9686003)(110136005)(186003)(33656002)(8676002)(7696005)(82310400003)(54906003)(4326008)(6506007)(83380400001)(508600001)(52536014)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 06:14:03.8794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f4f16c-7bc5-4913-f630-08d9607d0c12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4121

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMTMsIDIwMjEg
ODoyMiBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+
IDxXZWkuQ2hlbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjQgMDYvMTBdIHhlbi9hcm06IGludHJvZHVjZSBQR0NfcmVzZXJ2ZWQNCj4gDQo+IEhpIFBl
bm55LA0KPiANCj4gT24gMjgvMDcvMjAyMSAxMToyNywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IHBhZ2UgZmxhZyBQR0NfcmVzZXJ2ZWQgaW4gb3Jk
ZXIgdG8NCj4gPiBkaWZmZXJlbnRpYXRlIHBhZ2VzIG9mIHN0YXRpYyBtZW1vcnkgZnJvbSB0aG9z
ZSBhbGxvY2F0ZWQgZnJvbSBoZWFwLg0KPiA+DQo+ID4gTWFyayBwYWdlcyBvZiBzdGF0aWMgbWVt
b3J5IFBHQ19yZXNlcnZlZCB3aGVuIGluaXRpYWxpemluZyB0aGVtLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+IA0KPiBJIHRoaW5r
IHRoaXMgd2FudCB0byBiZSBmb2xkZWQgaW4gcGF0Y2ggIzcuDQo+IA0KDQpPay4gV2lsbCBkby4N
Cg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KDQpDaGVlcnMsDQoNCi0tDQpQZW5ueSBaaGVuZw0KDQo+
IEp1bGllbiBHcmFsbA0K

