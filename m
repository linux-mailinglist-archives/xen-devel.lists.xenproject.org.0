Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478483EE855
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 10:22:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167643.306027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFuM2-00046G-89; Tue, 17 Aug 2021 08:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167643.306027; Tue, 17 Aug 2021 08:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFuM2-000442-4P; Tue, 17 Aug 2021 08:21:50 +0000
Received: by outflank-mailman (input) for mailman id 167643;
 Tue, 17 Aug 2021 08:21:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5rO=NI=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFuM1-00043w-4b
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 08:21:49 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29bd3900-ff34-11eb-a493-12813bfff9fa;
 Tue, 17 Aug 2021 08:21:47 +0000 (UTC)
Received: from AM5PR0502CA0013.eurprd05.prod.outlook.com
 (2603:10a6:203:91::23) by PR2PR08MB4890.eurprd08.prod.outlook.com
 (2603:10a6:101:23::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 08:21:45 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::4f) by AM5PR0502CA0013.outlook.office365.com
 (2603:10a6:203:91::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Tue, 17 Aug 2021 08:21:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 08:21:44 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Tue, 17 Aug 2021 08:21:44 +0000
Received: from 96bffa5f08a0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B9263BB3-40C2-41A3-AB8C-5E6216CFEF4C.1; 
 Tue, 17 Aug 2021 08:21:33 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96bffa5f08a0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Aug 2021 08:21:33 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB5536.eurprd08.prod.outlook.com (2603:10a6:803:13b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 08:21:32 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Tue, 17 Aug 2021
 08:21:31 +0000
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
X-Inumbo-ID: 29bd3900-ff34-11eb-a493-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duWNqs6RTphBQ4DpuxBq3P6UZXfWX+DXM3D2UvuT5nw=;
 b=Vz1//NDpfhdNYXo+pHWtag92bdvclW/hkXDMwFBf6YXnbvQgApU+698hLiR3drJN0f8leouR4h+mVHKkXOSK4U2miMlNlxAqNR//OuZ2D26mvWWMcuT11cK3zSKzRRKuIfHQCUKP57nw4WeOjcQ/lZBgRfUxYZq2Ay7fvHDxM3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=II/luHBa3t5kZBq5aQvVDV1/XsFi65wu6QuPQHizOyQnxK/5hFx7MTSAInLJgbSDpLGJvj4B0BIjauTACZseVYri2BZLLsbaCaNJWgsa3Plv+Vu6n+lPSd+sqC6kG17yX/pJTqwZndhCeAWKE4FkacU9F2uGatnqeRJ2Cf1+KfJODfZf8rsD/M9Pc/e3WcVT4Xcl74XuvdfGG1CNtQtuL6AivLAngOWX8bSu6fO7i2uW0N3xhX02ofkET9cUoS4Zf2MbTMIMZ9+5Ii2d+uk6Yzo0AKcLrF2E0VxyHJKI1ek/xQ6/gYg7xGlnXfhbLc3cNaDhqxCecjKc+nxiPoa5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duWNqs6RTphBQ4DpuxBq3P6UZXfWX+DXM3D2UvuT5nw=;
 b=OjJnF40s9CtZt8oOmosM0o3N6aoQGB82p78S0eUeyFcVJNpcJHJ3kCWyAwLOqAt3kUBK/Xw4H/CHTkr5aadumSdfXzGcoPdHiYmPNQu7hLry86FT59mabCn86d5gTYc2A66phNdbDbOsG5/TnKsVpsVCu3u6qx4uNGjDnYPk1uyYktcyyuGddk2biiH6Dl74PA/cMw+PWsV60G7OZ2UvCecD4ADde8drtGKlXD3w1H9qi3ZigAPsIPQTuw6fQftYfbBl8P/zURD1F34zZ+y9uUuhcbkRoJes2q1UjwlNLZxS26JHwS0D6wGH3SoBnTlk0BYuKWqy99qNBXYWaoNfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duWNqs6RTphBQ4DpuxBq3P6UZXfWX+DXM3D2UvuT5nw=;
 b=Vz1//NDpfhdNYXo+pHWtag92bdvclW/hkXDMwFBf6YXnbvQgApU+698hLiR3drJN0f8leouR4h+mVHKkXOSK4U2miMlNlxAqNR//OuZ2D26mvWWMcuT11cK3zSKzRRKuIfHQCUKP57nw4WeOjcQ/lZBgRfUxYZq2Ay7fvHDxM3c=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 07/10] xen: re-define assign_pages and introduce
 assign_page
Thread-Topic: [PATCH V4 07/10] xen: re-define assign_pages and introduce
 assign_page
Thread-Index: AQHXg5tavbNXsOQZkUa7uXOYmQkhQatxdeUAgAYDrUA=
Date: Tue, 17 Aug 2021 08:21:31 +0000
Message-ID:
 <VE1PR08MB5215DCF997C8408A42D6F212F7FE9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-8-penny.zheng@arm.com>
 <58be6daa-d8d1-1907-c549-585f56075a99@xen.org>
In-Reply-To: <58be6daa-d8d1-1907-c549-585f56075a99@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 69FE78AFC9A9C941A14C70D3BE4AEFAE.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3f4d82b7-fb85-4d00-df82-08d961580cc1
x-ms-traffictypediagnostic: VI1PR08MB5536:|PR2PR08MB4890:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB48906CA19D14BD4BFB1F73F9F7FE9@PR2PR08MB4890.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ymLeJO+r5LRUSjPGiHLrr4yGs272hEIrMQP+cYXkdsdrIULmpfTuic8cSnNr04bO2fTT+9HvFZPZ7w57WKWNt07mayyr3a3HxgCOrfCP/IAxgEgx+zWUUwO8mfuYIwJSi3zMAV4/1iAiGH0ytOZPeHLFR6cMU55suI7kLQWSHVmaO0tiSgG3Cn3h5EwccnwEHMYG+pY5NpeXUcjHkwCcxNoSAhHg3KmT8PzHNrzM92m/8hXO+0zFN8aY70bQP6jgtYE6D1MW44McF27CqWyP1EDwqvx9ElboKJ7VRSBnq/OCnZKIN1sm2PChR3mzdGun0ipf30+V6XzA6ihhCkXenGhP97sAx2yioiaJcWzAGpxXR3KoBb8EeRMbfONw1INGvXDeridYtNsaZLUO3sh/AQ6c+Tc6nxitFTcPnqtgIn6k690v8aJs1cxrAlTE9zhgmgxwQCAXvhxJNaIWKH8Qhf+QtMDyco8Fjc1HC+JIJOtStdxEe6QC/h6vfTG47kd7Fn12Q8CyGi4r+vJlh5PIwMigLlZVSXYp4emwBxgbLYkAfeCIwkpiWa8CyGsL2aU82OiWsN9FZaYEe/0/X0au4UKJHvMMNCquJdjEhCLsNh226t1WlURc6QZfvUJU8uMbczpIHQ0/2UP/kalYQ/QF4uGyAAOzNO6kVelsoelUe6SoqP0BDnCTcIlS5L4e3BVBsjM0eMjLr50QjzYmYzPRLw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(26005)(186003)(53546011)(5660300002)(6506007)(55016002)(9686003)(508600001)(71200400001)(76116006)(64756008)(66446008)(4326008)(33656002)(66556008)(66476007)(122000001)(83380400001)(52536014)(110136005)(7696005)(54906003)(8676002)(66946007)(38070700005)(38100700002)(2906002)(316002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzNGNUg3b0wzajl2QkNRUnhENzd2R21uUWVKTWsyRnZFNmxzQjU0NkgxNVlF?=
 =?utf-8?B?Zmd1eUNrS2xNM3RhOHZ5dTRlKzJ5OWVHV29MZ1hLTS92Q1Y2OEtBUkJrZGFv?=
 =?utf-8?B?bCtpdEkrdmlYSkEvV0toZkFXS0pQKzRQOGhBYml3WTI1V2hkMS9FZzE0bHlX?=
 =?utf-8?B?bVl5WCsycDBjb1gyQ2IvZnI0dkxQQTM5di9PbllNN3gyQVBwSGRmT2taT05E?=
 =?utf-8?B?K2swdmNWNXpTU1lId1RYZ0d4Tm1MM050VlBmL2lpT1VYbWZJSmI1Umg5dGtm?=
 =?utf-8?B?ak5ONXhKVzZaMXlJTVc1Z0tsVURLSytVYlRBN3dFMzRsa3ZQM2tHdStqcFgz?=
 =?utf-8?B?WVpiRWRJRmdaN3M3ckx2QlFxZ2N2TWxWc0RaWXRUaGtSeXJybGphSWZKZTVL?=
 =?utf-8?B?NGkvbDlhSkRlK3ZTTGVjSkx6NzR1VVJwSjk4YklMT0RKNmloaXFzVjR1Tmpj?=
 =?utf-8?B?dFM5Y1VSSlVEa29vQnh5eXVHVnErVHlUWXVTSUdKK1ZFT2tySEtTWDNBbGdN?=
 =?utf-8?B?bmR4YnBqVXRnRDNpZWxuMmo0Q3lobzE4ejZmeUEvMjFMSXd4dkluWTdWei96?=
 =?utf-8?B?c2U0VWRvc2lVRUtoTFMzQjh4THo3a05WRGdWbE5kM0h3WjU2Nzl4Mkp1c0xi?=
 =?utf-8?B?WTJzRThJZ3pKeHFDUTlENW9PMHRMODhISUM4K3JxZTlQQ3BiOENCdEVOL1Qr?=
 =?utf-8?B?QnFHZnRWekYzd2ZEV3dBaHJMT3BYZnhIUzhWY0pEbm1mellOYmtxRmtkS0dh?=
 =?utf-8?B?ait1V3JyczhPbEZTUW54eTg3R1lhTWEyU2dQK3Fpa0NYR1JpTjZ2MU0yNStv?=
 =?utf-8?B?V3lLcWl4eHhMdFJBc1pxZUppbnpubHoyMFlzUTR6KzdQYjlNajh4enlYL2Jh?=
 =?utf-8?B?a2o3aG43VkxvRkxCVC9RdjFsRUVrZTlGaGJGMEo4L2k2K2JQaXZNVVBpRHdr?=
 =?utf-8?B?QkZBd2doQklBY2dyR3M0ZWtHZWlLQzF0OFR5WmFxTG94UlhuSXFOaUhSeVQ0?=
 =?utf-8?B?cGhNWUJvNFFJdkt6Q1JyMUltcytKaFIwY3A0QkFsU3NEcVZING5CbGFKT3lL?=
 =?utf-8?B?UnVSQTZtd2hxYTk0dUwzZC9HUlNYb1JJN2lLdktwQ1JSL2syazJQaktlMkoy?=
 =?utf-8?B?VENVaU43OE9CM1c2OXJualViNnIyVHdsNzFoVE0xVHdKSGJONGplVm01NE1u?=
 =?utf-8?B?TjhnZ0FjVVljS1g3T0FsRVkzTUszaFgzazZoa2c5dVFzM3dac1crMFQzSUNS?=
 =?utf-8?B?ZkFNZ2paQlhWV0RTWDUwSTQwQVgxRytGY1NCTlM4Zy9EUWRzWjNDekRvMmJ0?=
 =?utf-8?B?YithUUtuQ0hMeTQ4RTBzSHU3dndtWDhJVUNRMzJYYkJFUlhEVU0yOCtJNm4x?=
 =?utf-8?B?a0xJb2ZJakFROGdFTDJNRnJKd1kwQW5idnRSWXNBT1hqS3ZPcC9Rb1h4QkVu?=
 =?utf-8?B?S0xYZFpEbDZEU1BDUWdNSUZHM0lhdDNER2VsbGQrQ3NvaHdaWGVzdk94bTUz?=
 =?utf-8?B?QVFuaXA2U0xYVC9KbVVoR0RDSzBETlNMd29yWlFyUFRIOFhzU3JpMURpN1F5?=
 =?utf-8?B?dDUzNU5qalZrVDBHTXlIYWUzeFV0VDBpbWphekdBaUpJcW5kN1k5Vm41bG5W?=
 =?utf-8?B?U0lJMGhQSHVLZThJNDI5ZGlzaEg4RnVESlZhclVva0tra2xhZDVVRGZRM28y?=
 =?utf-8?B?L01kMWhJZHlTeS9mMUVWWjUrUmxtZmFMS2xBZjZVbFBpZzZrWitZNFVDbFlV?=
 =?utf-8?Q?+/nO+QrjMduOPNt+Xduep7lnsHKnOHhgitgyNAD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5536
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b13a9373-1703-49fd-7a5c-08d9615804e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XUFAPNzNbHr3Yr9vhG4SZoso9C6P2Pa0gpzWrO0iCuFYo4tbFHdJNi2UXrzYidvxbaPOd8OmQojWCOhj/7B6f392vOVOFVqX6uZ4kbo7QGuUn9Nx2Xnx4WhAxGMU1oF9VO4J5CT7FvF0jBFTw5NppYQg+BOIBIkfvHmAtFi/93l3lXdZ34uVmE3KKmk9FDfh382f8Or6wsphX+GnOekjXfS7tw3cVCbynWzvrWu5hsu8r45cZo5mvdYmmosMJIEfZzGJEepFYqaHyT42rlhrCus2IxZ5uMcfowQfsZYFAYISp37bw75mm0jDNKOjBpRwaXQpSlN1mBRCfKKpw2cRjndz0pQqcVk+XFgT5Hbyvk6od6YdQ6sIyYMPVd89P09HFwaCjCFHv5ke2Cp/fvqqTDvqbJMCZCKYqvp2TU4Mxjqb2pqs/dur4yDHP7dBZnPf+SbZIRIZpkADvfo5ssN5qDEl6TBbHvA99Ln5zmzP9aTJnOKegE56NWuFJM60eDS84FmPsKnTDcZuLvmJnftqCz/OYmv1K0pv9Y7LnF7d4uEvK9SU2HYLm5dvYQfYESfX9zqVfdvs1k55ahQdB2EuBDARxCIK2CMLpiL2vo9alXvTzXhNk3ESoIjm5TDfDyepZjdTOTqWc2McoeLL+Sos+JyWPplCQiI8GfKLxmRvHRfXGB9Q52/qTht7Aw4JDYBool9ta4tRSPQiO1wQiHI9OQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(70586007)(9686003)(33656002)(55016002)(5660300002)(316002)(52536014)(336012)(508600001)(81166007)(186003)(86362001)(8936002)(54906003)(110136005)(47076005)(83380400001)(8676002)(26005)(356005)(82310400003)(4326008)(53546011)(36860700001)(2906002)(7696005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 08:21:44.7914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4d82b7-fb85-4d00-df82-08d961580cc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4890

SGkgSnVsaWFuIGFuZCBKYW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAx
MywgMjAyMSA4OjI3IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9y
Zw0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2Vp
IENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBWNCAwNy8xMF0geGVuOiByZS1kZWZpbmUgYXNzaWduX3BhZ2VzIGFuZCBpbnRy
b2R1Y2UNCj4gYXNzaWduX3BhZ2UNCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMjgvMDcvMjAy
MSAxMToyNywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gSW4gb3JkZXIgdG8gZGVhbCB3aXRoIHRo
ZSB0cm91YmxlIG9mIGNvdW50LXRvLW9yZGVyIGNvbnZlcnNpb24gd2hlbg0KPiA+IHBhZ2UgbnVt
YmVyIGlzIG5vdCBpbiBhIHBvd2VyLW9mLXR3bywgdGhpcyBjb21taXQgcmUtZGVmaW5lDQo+ID4g
YXNzaWduX3BhZ2VzIGZvciBuciBwYWdlcyBhbmQgYXNzaWduX3BhZ2UgZm9yIG9yaWdpbmFsIHBh
Z2Ugd2l0aCBhIHNpbmdsZQ0KPiBvcmRlci4NCj4gPg0KPiA+IEJhY2twb3J0aW5nIGNvbmZ1c2lv
biBjb3VsZCBiZSBoZWxwZWQgYnkgYWx0ZXJpbmcgdGhlIG9yZGVyIG9mDQo+ID4gYXNzaWduX3Bh
Z2UgcGFyYW1ldGVycywgc3VjaCB0aGF0IHRoZSBjb21waWxlciB3b3VsZCBwb2ludCBvdXQgdGhh
dA0KPiA+IGFkanVzdG1lbnRzIGF0IGNhbGwgc2l0ZXMgYXJlIG5lZWRlZC4NCj4gDQo+IExvb2tp
bmcgYXQgdGhlIGNvZGUsIHlvdSBkb24ndCBhbHRlciB0aGUgb3JkZXIgb2YgYXNzaWduX3BhZ2Uo
KSBwYXJhbWV0ZXJzLiBTbw0KPiBkaWQgeW91IG1lYW4gdG8gcmVmZXIgdG8gImFzc2lnbl9wYWdl
cygpIj8NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhl
bmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiB2NCBjaGFuZ2U6DQo+ID4gLSBpbiBhbGwgY2FzZXMg
d2hlcmUgb3JkZXItMCBwYWdlcyBnZXQgcGFzc2VkLCBwcmVmZXIgdXNpbmcNCj4gPiBhc3NpZ25f
cGFnZXMgdG8gcGFzcyBsaXRlcmFsIDENCj4gPiAtIHJlY29uc3RydWN0IHRoZSBvcmRlciBvZiBh
c3NpZ25fcGFnZXMgcGFyYW1ldGVycw0KPiA+IC0gcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwYXJl
bnRoZXNlcw0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyB8ICAy
ICstDQo+ID4gICB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgIHwgIDIgKy0NCj4gPiAgIHhl
bi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgfCAgNCArKy0tDQo+ID4gICB4ZW4vY29tbW9uL3Bh
Z2VfYWxsb2MuYyAgICAgIHwgMjMgKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gPiAgIHhlbi9p
bmNsdWRlL3hlbi9tbS5oICAgICAgICAgfCAgNiArKysrKysNCj4gPiAgIDUgZmlsZXMgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYw0KPiA+IGIveGVuL2FyY2gveDg2L3B2L2Rv
bTBfYnVpbGQuYyBpbmRleCBhZjQ3NjE1YjIyLi45MTQyZjM1OWRhIDEwMDY0NA0KPiA+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvcHYv
ZG9tMF9idWlsZC5jDQo+ID4gQEAgLTU1Niw3ICs1NTYsNyBAQCBpbnQgX19pbml0IGRvbTBfY29u
c3RydWN0X3B2KHN0cnVjdCBkb21haW4gKmQsDQo+ID4gICAgICAgICAgIGVsc2UNCj4gPiAgICAg
ICAgICAgew0KPiA+ICAgICAgICAgICAgICAgd2hpbGUgKCBjb3VudC0tICkNCj4gPiAtICAgICAg
ICAgICAgICAgIGlmICggYXNzaWduX3BhZ2VzKGQsIG1mbl90b19wYWdlKF9tZm4obWZuKyspKSwg
MCwgMCkgKQ0KPiA+ICsgICAgICAgICAgICAgICAgaWYgKCBhc3NpZ25fcGFnZXMobWZuX3RvX3Bh
Z2UoX21mbihtZm4rKykpLCAxLCBkLCAwKQ0KPiA+ICsgKQ0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBCVUcoKTsNCj4gPiAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgICBpbml0cmQtPm1vZF9l
bmQgPSAwOw0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94ZW4v
Y29tbW9uL2dyYW50X3RhYmxlLmMgaW5kZXgNCj4gPiBmYWI3N2FiOWNjLi4xZjZiODliZmY0IDEw
MDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYw0KPiA+ICsrKyBiL3hlbi9j
b21tb24vZ3JhbnRfdGFibGUuYw0KPiA+IEBAIC0yMzQyLDcgKzIzNDIsNyBAQCBnbnR0YWJfdHJh
bnNmZXIoDQo+ID4gICAgICAgICAgICAqIGlzIHJlc3BlY3RlZCBhbmQgc3BlY3VsYXRpdmUgZXhl
Y3V0aW9uIGlzIGJsb2NrZWQgYWNjb3JkaW5nbHkNCj4gPiAgICAgICAgICAgICovDQo+ID4gICAg
ICAgICAgIGlmICggdW5saWtlbHkoIWV2YWx1YXRlX25vc3BlYyhva2F5KSkgfHwNCj4gPiAtICAg
ICAgICAgICAgdW5saWtlbHkoYXNzaWduX3BhZ2VzKGUsIHBhZ2UsIDAsIE1FTUZfbm9fcmVmY291
bnQpKSApDQo+ID4gKyAgICAgICAgICAgIHVubGlrZWx5KGFzc2lnbl9wYWdlcyhwYWdlLCAxLCBl
LCBNRU1GX25vX3JlZmNvdW50KSkgKQ0KPiA+ICAgICAgICAgICB7DQo+ID4gICAgICAgICAgICAg
ICBib29sIGRyb3BfZG9tX3JlZjsNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL21l
bW9yeS5jIGIveGVuL2NvbW1vbi9tZW1vcnkuYyBpbmRleA0KPiA+IGUwN2JkOWE1ZWEuLjA4M2Ux
NGI4NGYgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9tZW1vcnkuYw0KPiA+ICsrKyBiL3hl
bi9jb21tb24vbWVtb3J5LmMNCj4gPiBAQCAtNzI4LDcgKzcyOCw3IEBAIHN0YXRpYyBsb25nDQo+
IG1lbW9yeV9leGNoYW5nZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9tZW1vcnlfZXhjaGFu
Z2VfdCkNCj4gYXJnKQ0KPiA+ICAgICAgICAgICAvKiBBc3NpZ24gZWFjaCBvdXRwdXQgcGFnZSB0
byB0aGUgZG9tYWluLiAqLw0KPiA+ICAgICAgICAgICBmb3IgKCBqID0gMDsgKHBhZ2UgPSBwYWdl
X2xpc3RfcmVtb3ZlX2hlYWQoJm91dF9jaHVua19saXN0KSk7ICsraiApDQo+ID4gICAgICAgICAg
IHsNCj4gPiAtICAgICAgICAgICAgaWYgKCBhc3NpZ25fcGFnZXMoZCwgcGFnZSwgZXhjaC5vdXQu
ZXh0ZW50X29yZGVyLA0KPiA+ICsgICAgICAgICAgICBpZiAoIGFzc2lnbl9wYWdlKGQsIHBhZ2Us
IGV4Y2gub3V0LmV4dGVudF9vcmRlciwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIE1FTUZfbm9fcmVmY291bnQpICkNCj4gPiAgICAgICAgICAgICAgIHsNCj4gPiAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIGRlY19jb3VudDsgQEAgLTc5Nyw3ICs3OTcsNyBAQCBz
dGF0aWMNCj4gPiBsb25nDQo+IG1lbW9yeV9leGNoYW5nZShYRU5fR1VFU1RfSEFORExFX1BBUkFN
KHhlbl9tZW1vcnlfZXhjaGFuZ2VfdCkNCj4gYXJnKQ0KPiA+ICAgICAgICAqIGNsZWFyZWQgUEdD
X2FsbG9jYXRlZC4NCj4gPiAgICAgICAgKi8NCj4gPiAgICAgICB3aGlsZSAoIChwYWdlID0gcGFn
ZV9saXN0X3JlbW92ZV9oZWFkKCZpbl9jaHVua19saXN0KSkgKQ0KPiA+IC0gICAgICAgIGlmICgg
YXNzaWduX3BhZ2VzKGQsIHBhZ2UsIDAsIE1FTUZfbm9fcmVmY291bnQpICkNCj4gPiArICAgICAg
ICBpZiAoIGFzc2lnbl9wYWdlcyhwYWdlLCAxLCBkLCBNRU1GX25vX3JlZmNvdW50KSApDQo+ID4g
ICAgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgIEJVR19PTighZC0+aXNfZHlpbmcpOw0KPiA+
ICAgICAgICAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UocGFnZSk7IGRpZmYgLS1naXQNCj4gPiBh
L3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgaW5kZXgN
Cj4gPiBmNTFlNDA2NDAxLi5lMjc5YzZmNzEzIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPiBAQCAt
MjI4Miw5ICsyMjgyLDkgQEAgdm9pZCBpbml0X2RvbWhlYXBfcGFnZXMocGFkZHJfdCBwcywgcGFk
ZHJfdCBwZSkNCj4gPg0KPiA+DQo+ID4gICBpbnQgYXNzaWduX3BhZ2VzKA0KPiA+IC0gICAgc3Ry
dWN0IGRvbWFpbiAqZCwNCj4gPiAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZywNCj4gPiAtICAg
IHVuc2lnbmVkIGludCBvcmRlciwNCj4gPiArICAgIHVuc2lnbmVkIGxvbmcgbnIsDQo+ID4gKyAg
ICBzdHJ1Y3QgZG9tYWluICpkLA0KPiA+ICAgICAgIHVuc2lnbmVkIGludCBtZW1mbGFncykNCj4g
PiAgIHsNCj4gPiAgICAgICBpbnQgcmMgPSAwOw0KPiA+IEBAIC0yMzA0LDcgKzIzMDQsNyBAQCBp
bnQgYXNzaWduX3BhZ2VzKA0KPiA+ICAgICAgIHsNCj4gPiAgICAgICAgICAgdW5zaWduZWQgaW50
IGV4dHJhX3BhZ2VzID0gMDsNCj4gPg0KPiA+IC0gICAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDF1
bCA8PCBvcmRlcik7IGkrKyApDQo+ID4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBucjsgaSsr
ICkNCj4gPiAgICAgICAgICAgew0KPiA+ICAgICAgICAgICAgICAgQVNTRVJUKCEocGdbaV0uY291
bnRfaW5mbyAmIH5QR0NfZXh0cmEpKTsNCj4gPiAgICAgICAgICAgICAgIGlmICggcGdbaV0uY291
bnRfaW5mbyAmIFBHQ19leHRyYSApIEBAIC0yMzEzLDE4ICsyMzEzLDE4DQo+ID4gQEAgaW50IGFz
c2lnbl9wYWdlcygNCj4gPg0KPiA+ICAgICAgICAgICBBU1NFUlQoIWV4dHJhX3BhZ2VzIHx8DQo+
ID4gICAgICAgICAgICAgICAgICAoKG1lbWZsYWdzICYgTUVNRl9ub19yZWZjb3VudCkgJiYNCj4g
PiAtICAgICAgICAgICAgICAgIGV4dHJhX3BhZ2VzID09IDF1IDw8IG9yZGVyKSk7DQo+ID4gKyAg
ICAgICAgICAgICAgICBleHRyYV9wYWdlcyA9PSBucikpOw0KPiA+ICAgICAgIH0NCj4gPiAgICNl
bmRpZg0KPiA+DQo+ID4gICAgICAgaWYgKCBwZ1swXS5jb3VudF9pbmZvICYgUEdDX2V4dHJhICkN
Cj4gPiAgICAgICB7DQo+ID4gLSAgICAgICAgZC0+ZXh0cmFfcGFnZXMgKz0gMXUgPDwgb3JkZXI7
DQo+ID4gKyAgICAgICAgZC0+ZXh0cmFfcGFnZXMgKz0gbnI7DQo+ID4gICAgICAgICAgIG1lbWZs
YWdzICY9IH5NRU1GX25vX3JlZmNvdW50Ow0KPiA+ICAgICAgIH0NCj4gPiAgICAgICBlbHNlIGlm
ICggIShtZW1mbGFncyAmIE1FTUZfbm9fcmVmY291bnQpICkNCj4gPiAgICAgICB7DQo+ID4gLSAg
ICAgICAgdW5zaWduZWQgaW50IHRvdF9wYWdlcyA9IGRvbWFpbl90b3RfcGFnZXMoZCkgKyAoMSA8
PCBvcmRlcik7DQo+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IHRvdF9wYWdlcyA9IGRvbWFpbl90
b3RfcGFnZXMoZCkgKyBucjsNCj4gPg0KPiA+ICAgICAgICAgICBpZiAoIHVubGlrZWx5KHRvdF9w
YWdlcyA+IGQtPm1heF9wYWdlcykgKQ0KPiA+ICAgICAgICAgICB7DQo+ID4gQEAgLTIzMzYsMTAg
KzIzMzYsMTAgQEAgaW50IGFzc2lnbl9wYWdlcygNCj4gPiAgICAgICB9DQo+ID4NCj4gPiAgICAg
ICBpZiAoICEobWVtZmxhZ3MgJiBNRU1GX25vX3JlZmNvdW50KSAmJg0KPiA+IC0gICAgICAgICB1
bmxpa2VseShkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAxIDw8IG9yZGVyKSA9PSAoMSA8PCBv
cmRlcikpICkNCj4gPiArICAgICAgICAgdW5saWtlbHkoZG9tYWluX2FkanVzdF90b3RfcGFnZXMo
ZCwgbnIpID09IG5yKSApDQo+ID4gICAgICAgICAgIGdldF9rbm93bmFsaXZlX2RvbWFpbihkKTsN
Cj4gPg0KPiA+IC0gICAgZm9yICggaSA9IDA7IGkgPCAoMSA8PCBvcmRlcik7IGkrKyApDQo+ID4g
KyAgICBmb3IgKCBpID0gMDsgaSA8IG5yOyBpKysgKQ0KPiA+ICAgICAgIHsNCj4gPiAgICAgICAg
ICAgQVNTRVJUKHBhZ2VfZ2V0X293bmVyKCZwZ1tpXSkgPT0gTlVMTCk7DQo+ID4gICAgICAgICAg
IHBhZ2Vfc2V0X293bmVyKCZwZ1tpXSwgZCk7DQo+ID4gQEAgLTIzNTQsNiArMjM1NCwxMSBAQCBp
bnQgYXNzaWduX3BhZ2VzKA0KPiA+ICAgICAgIHJldHVybiByYzsNCj4gPiAgIH0NCj4gPg0KPiA+
ICtpbnQgYXNzaWduX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBhZ2VfaW5mbyAqcGcs
IHVuc2lnbmVkIGludCBvcmRlciwNCj4gPiArICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBt
ZW1mbGFncykgew0KPiA+ICsgICAgcmV0dXJuIGFzc2lnbl9wYWdlcyhwZywgMVVMIDw8IG9yZGVy
LCBkLCBtZW1mbGFncyk7IH0NCj4gPg0KPiA+ICAgc3RydWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9t
aGVhcF9wYWdlcygNCj4gPiAgICAgICBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgb3Jk
ZXIsIHVuc2lnbmVkIGludCBtZW1mbGFncykgQEANCj4gPiAtMjM5Niw3ICsyNDAxLDcgQEAgc3Ry
dWN0IHBhZ2VfaW5mbyAqYWxsb2NfZG9taGVhcF9wYWdlcygNCj4gPiAgICAgICAgICAgICAgICAg
ICBwZ1tpXS5jb3VudF9pbmZvID0gUEdDX2V4dHJhOw0KPiA+ICAgICAgICAgICAgICAgfQ0KPiA+
ICAgICAgICAgICB9DQo+ID4gLSAgICAgICAgaWYgKCBhc3NpZ25fcGFnZXMoZCwgcGcsIG9yZGVy
LCBtZW1mbGFncykgKQ0KPiA+ICsgICAgICAgIGlmICggYXNzaWduX3BhZ2UoZCwgcGcsIG9yZGVy
LCBtZW1mbGFncykgKQ0KPiA+ICAgICAgICAgICB7DQo+ID4gICAgICAgICAgICAgICBmcmVlX2hl
YXBfcGFnZXMocGcsIG9yZGVyLCBtZW1mbGFncyAmIE1FTUZfbm9fc2NydWIpOw0KPiA+ICAgICAg
ICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9t
bS5oIGIveGVuL2luY2x1ZGUveGVuL21tLmggaW5kZXgNCj4gPiA4ZThmYjVhNjE1Li4yZTc1Y2Rj
YmI3IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oDQo+ID4gKysrIGIveGVu
L2luY2x1ZGUveGVuL21tLmgNCj4gPiBAQCAtMTMyLDYgKzEzMiwxMiBAQCBpbnQgcXVlcnlfcGFn
ZV9vZmZsaW5lKG1mbl90IG1mbiwgdWludDMyX3QgKnN0YXR1cyk7DQo+ID4gICB2b2lkIGhlYXBf
aW5pdF9sYXRlKHZvaWQpOw0KPiA+DQo+ID4gICBpbnQgYXNzaWduX3BhZ2VzKA0KPiA+ICsgICAg
c3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+ID4gKyAgICB1bnNpZ25lZCBsb25nIG5yLA0KPiA+ICsg
ICAgc3RydWN0IGRvbWFpbiAqZCwNCj4gPiArICAgIHVuc2lnbmVkIGludCBtZW1mbGFncyk7DQo+
ID4gKw0KPiA+ICtpbnQgYXNzaWduX3BhZ2UoDQo+ID4gICAgICAgc3RydWN0IGRvbWFpbiAqZCwN
Cj4gPiAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZywNCj4gPiAgICAgICB1bnNpZ25lZCBpbnQg
b3JkZXIsDQo+IA0KPiBJIGZpbmQgYSBiaXQgb2RkIHRoYXQgdGhlIHBhcmFtZXRlcnMgYXJlIG9y
ZGVyZWQgZGlmZmVyZW50bHkgYmV0d2Vlbg0KPiBhc3NpZ25fcGFnZXMoKSBhbmQgYXNzaWduX3Bh
Z2UoKS4gVGhleSBhcmUgc2ltaWxhciBpbnRlcmZhY2UgYWZ0ZXIgYWxsLg0KPiANCg0KSSB3aWxs
IGNoYW5nZSB0aGUgb3JkZXIgYmFjayBhbmQgbWFrZSB0aGVtIGluIHRoZSBzaW1pbGFyIG9yZGVy
Lg0KDQo+IEkgZG9uJ3QgdGhpbmsgaXQgd291bGQgYmUgYSBwcm9ibGVtIGZvciBiYWNrcG9ydGlu
ZyBwdXJwb3NlIGlmDQo+IGFzc2lnbl9wYWdlKCkgaGFzIGEgZGlmZmVyZW50IG9yZGVyIGZvciB0
aGUgYXJndW1lbnRzLg0KPiANCj4gSmFuLCB3aGF0IGRvIHlvdSB0aGluaz8NCj4gDQo+IENoZWVy
cywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

