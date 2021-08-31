Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2F23FC890
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175765.320101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL43e-0007xQ-Mh; Tue, 31 Aug 2021 13:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175765.320101; Tue, 31 Aug 2021 13:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL43e-0007uV-Iv; Tue, 31 Aug 2021 13:44:10 +0000
Received: by outflank-mailman (input) for mailman id 175765;
 Tue, 31 Aug 2021 13:44:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06Zp=NW=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mL43c-0007om-Np
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:44:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::621])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad64f4af-6298-46c9-9349-b59e7a867d39;
 Tue, 31 Aug 2021 13:44:06 +0000 (UTC)
Received: from AS9PR06CA0054.eurprd06.prod.outlook.com (2603:10a6:20b:463::14)
 by PAXPR08MB6799.eurprd08.prod.outlook.com (2603:10a6:102:13b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 13:44:04 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::a2) by AS9PR06CA0054.outlook.office365.com
 (2603:10a6:20b:463::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24 via Frontend
 Transport; Tue, 31 Aug 2021 13:44:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 13:44:02 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Tue, 31 Aug 2021 13:43:59 +0000
Received: from 7338cbcdcc9b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6501F1B-D52D-49E4-B5BD-F1C1C0248F5F.1; 
 Tue, 31 Aug 2021 13:43:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7338cbcdcc9b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Aug 2021 13:43:49 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6957.eurprd08.prod.outlook.com (2603:10a6:10:2bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 13:43:48 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:43:48 +0000
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
X-Inumbo-ID: ad64f4af-6298-46c9-9349-b59e7a867d39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0leoXdtt7Cfe38f6pquOEy6M9w12Ev4ld5FUMBC4SM=;
 b=AE41UtW2BCvAU6Y0RjxPf6iJxGGAAvLr7ztFQileZB8XvE8j5sENbRDKtGjGXV5rslmQcFQmGOtgvpbJukvwKXlbB5sB8W6wB7zJKbby+mQFARG384MoETk8dqKQhWA9/Pe5jq+ZV2cRSIEGJSrSvZaZ80vTcJGP9yPYa5fQOPU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRWZPUNahqCWKPI0xL8jzkgxFcpBMt0/ar3aY/MoqjbAPV+hXItJ7gBF1bD3ekUDrzFWxsSizZyn5FVor08co+mx7cKnEFzq061HNWwCRS7gq+gQwOlufsl0oBtV+GjzGSfpCktNLXV/aIRtteFspTb0WN+mtIr3Ishw4v7J/ZtnG4p/qLNl6lo1u2Ira+2XmGwl8Gyh0W8FUY6DEJF/cWW2xa3e614Ch75z9dCWR640TVkt0yEtlToSg21hYCSknMG9w0LCay5tLTGnHLPfN/ZJEjdrFncGVp/yQQ0ix/riQayk0mZfCfWDrNkk51Pn94imRNuHVUczrxLYD896sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0leoXdtt7Cfe38f6pquOEy6M9w12Ev4ld5FUMBC4SM=;
 b=lEwgm57GDpZ2Pi/P4B2pG9ZKWbU7ZbmKashKTaCAgXyUnOpYohBNpg3VY89n1UJ9H+8INABHCvm0Hq3mVax/qg6zp2lSLN0fLyUmJEiATTmUyZDcguIuVCeG99ExIatuIz3AD438CrjaB+1TL3gv7/7nWQ8G4kql/eDCAT8jBZ6ngpDbGcpLHPZrM7uJ+ViCfafZW0xFkN5WXx91X3YzY1plVAUfALFXqST/gZlmO9CVECNiA6yM9uwImZHZvp4ZjhR1+zTtwbQdwb5JKzkXmH4zDSLUXVSx9OUvWpa/DZN4GwXRZbc1afXUAEiU7Md27+IQxBO/XDxGWq0JPXvnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0leoXdtt7Cfe38f6pquOEy6M9w12Ev4ld5FUMBC4SM=;
 b=AE41UtW2BCvAU6Y0RjxPf6iJxGGAAvLr7ztFQileZB8XvE8j5sENbRDKtGjGXV5rslmQcFQmGOtgvpbJukvwKXlbB5sB8W6wB7zJKbby+mQFARG384MoETk8dqKQhWA9/Pe5jq+ZV2cRSIEGJSrSvZaZ80vTcJGP9yPYa5fQOPU=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
Thread-Topic: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in
 system init
Thread-Index: AQHXjptQCVAwokAljU6uEdAOvxt6uKuM9/MAgADAnZA=
Date: Tue, 31 Aug 2021 13:43:48 +0000
Message-ID:
 <DB9PR08MB6857F983ECA9D783C37B920E9ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-39-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301848140.17851@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108301848140.17851@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EFEE00173B0DE94C9A48D878433B7A16.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 03869209-ee1b-4bc0-b20c-08d96c8564f0
x-ms-traffictypediagnostic: DB9PR08MB6957:|PAXPR08MB6799:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6799C5EB2EB2C603217EE9A79ECC9@PAXPR08MB6799.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zyx8S9zeDFJZclpoR8tDKjsOaLwY8acN2lU/TcuGDgP+Vmm+Q+mvjLQuZmMmG8/oYM2hLdT8BYrc0b1RCSVyoU9WlYqznz17DvoHbiFz4ghmN1xqQ/MMUOgNBmGQEfbkxgk3qK0BwMYA5fwR8NvEFe5hYm/lD0TMFIIIYG518XRNYr0C8qYR/62vAlycJriRdaLlrxA84ETWqrojLvcuaHH1mbE/1BjFHlja8WHy/zR3KvDe95awaKN1p4S8mCPr/54ESgKRfcHPvongPvw0lyG4bJEP2iVwbNA6e4080MC49vfxJwfQi2ESNM55zMvSCfDcdtKZutEgT4OgN91isoTqMI+8SmbJkafr5Z/inJe1ECagPQuFABW8Ym/iqxtGsLlIQeGCEGsHV2qD0Dg4jar4bSnzd3g4SIw/aBmua5tM9NPHOYWEPa/I3sOsfXaAGgPinaHcCs9rRgducmuQRUiRpuraiObx1w/QwJtsuIvdKHMCMJnfFRl2JAx6ujo9hzMwSVI5p1LEZs6149wulLOvLgC7SAwDc9DoLoXrTb5KLKJRM5z37RN5alm4xfBt8j96SlZc2uRk8WIKpkPZvmebFTEoAF8YNEdxJvsjeRalCPV9ZGKk+Gzh5DIRs6kzpOW9TfrA4WAuAdhwV+0W7EOe5SBlW+L6tPOxXC4U4PUQYslSScNpVAl4q2ZY8pA4on8N0zJHeZQpphVcTBq+Iw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(366004)(396003)(346002)(53546011)(2906002)(4326008)(6506007)(9686003)(71200400001)(55016002)(8936002)(38070700005)(66556008)(66446008)(26005)(66476007)(64756008)(76116006)(7696005)(186003)(122000001)(316002)(478600001)(6916009)(83380400001)(86362001)(33656002)(66946007)(54906003)(8676002)(38100700002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SktnWmw4Y3VnMW83ZGFLQURWaXlZMU1IaUFWNnc2SnpuZW1PYk1sTW9lT20w?=
 =?gb2312?B?MEdWZDc1QXFyb21qYW1hOWFrbHNCS3dZRHhKWTNyMWdKdlJneW5JL29BYUZI?=
 =?gb2312?B?RGdjVjdyaVRES01YMkRKUXlURHQ4RDN6Tmh5S1FHcjE1eGozVThEWXVxOXNq?=
 =?gb2312?B?YXlGTlZSQU83WVZkb2xmWU1DeFdEcnZ5NU5iZUdBY0VyOVdWR00yc2xIYWd6?=
 =?gb2312?B?UGU2N2h3ci9kbjF4TitORGZXcUc5NzlwN2U0aHBRcEVJY2YyZjQ0cTVCeXZG?=
 =?gb2312?B?dGlmSmtxWWtzOE4xV25jRGlEa1RHR3RFTUFPVW1LRHNVeXBXbkJVNnNVWDA4?=
 =?gb2312?B?Q3NxVXBQcEpLTzdmSkZRUXczVVZZUys2c3pMUVgrNnE5ZnlWbXlVc3dOSldz?=
 =?gb2312?B?NG1oZG5TUDdncEExMG9ma1BtcmF3ZXlKOFBDZ3JBdHM5ZGlndFRxQzE4czUw?=
 =?gb2312?B?ZzdJMWpTNWlXTWxHRGJNNngrcnVBcHJXbjFsWW5UTHJKUkIxOFRPVUw0QXNG?=
 =?gb2312?B?bnRlVjcxbnZuZzRMdzd1cWVqMGFnN1Yrci85TkxBRldsYm9BVy9KeUhjK1Zw?=
 =?gb2312?B?YXBIOG53aEpQeHFQUVV2aXg4Rk5lRjhDbHJ4bmp5SUdkYkp3end3c1dvSzVx?=
 =?gb2312?B?T0RxTTJXNmhkZG5WT3NkajFmaFQ1WTN5RU1FSGZHNitFbWNyazRmN3Vad0Jj?=
 =?gb2312?B?UmFnRHhKM0V0UG9kMSt3a3NRMFB4T0tDUUhDOU5iMkFyeUlqczRTWjVDUzFO?=
 =?gb2312?B?a0thR1VDT1l5U2k2Z2dENGJqcUxFaS9sbE9lZEVyVlhlT1pVNHk2V3hGdFFk?=
 =?gb2312?B?c1pKd1BBNFo1Zk82L3ZkTGdxSjhBcVBteGRtSFRFYWZvTnVGd0RCMEtWamNi?=
 =?gb2312?B?NGc3NHhSRTF0KzFXd2svRFRMcmNmN21DRXNjNzNWVk4wSC9iR0xZOW1mTXFu?=
 =?gb2312?B?Z3I4eDVkRFV5cVZPYWpiOGhYNXJvVXVmQ2d2VXl5ZEFnaWgxSURmZDZ0N1Zo?=
 =?gb2312?B?dzJsT2JMVlo4T1laNkp5MFNPTThmVWNFZWQxZUdwYkFwTHQ4UTI0OUtIMzRP?=
 =?gb2312?B?K01qMnM5UVpDc0ZZYlRIQWNYSzNWOWcyRjBIK3RMSkJuSE1HMnNZbzFtaDNK?=
 =?gb2312?B?T0h1U1ZyK1I0c3lMTjNUTzlnem9NbGNkZ09LV0QvcHVsRXVBb09nZnVZUE9p?=
 =?gb2312?B?OEcrcmpTWkszSEYvMzYyZ29uMC9HZGpsWERnck4yU1RabmNDNlBTU2RuK1JR?=
 =?gb2312?B?T1I3K1JrQmpmYTNpcU9DMi9Ba3RINStFMFVOTFQwVmpOR09Yb1oyZ00rZjdQ?=
 =?gb2312?B?VjZSa0JFb0F0M2ZjaE1wcjVqOFU2VldWRlkzeXE1Y2REYktHUHBuQmpmV0xy?=
 =?gb2312?B?ZkNwbCtIcTErMkptY0VnNjZsbTVOcW1ycGRIV20yUU4vL3FlaDFLeEhpSXRN?=
 =?gb2312?B?eXkxU0E1ZThCcHRnUC9RNTA4UWpqU2pnUmxiaGVzUHdaMm9KangwVkszZ0gx?=
 =?gb2312?B?WE9rcXhVNG9QdTVJOGgxRkpEOU11VDF3dHpyRFBBaW5qTkl1dXJFL24zMmtG?=
 =?gb2312?B?YVJkeXBBVW9GT0UyOWl2bkNlM3FQY1U2MDVPcm5sRGMweW9GREJkTG1jSlZX?=
 =?gb2312?B?TDVDNk4wQi9Tdm8xSU1RQk9aRUhhNTVXbjAzRVhHbTh5dExLd2lEZWVyTHhE?=
 =?gb2312?B?ZWFSWGQ2Nzd1dXF0a1BWNGw1TGZoUExZdCtWMmJyRHNBdFhkRGJnSUdPYnhu?=
 =?gb2312?Q?EmwATzlQJemP+OwuHfhfUwQbTenkB20HBIo2RGm?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6957
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa51f54c-1a0b-43b1-26f8-08d96c855c63
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rh7gt3lIJRCO5QE7iJZBQSUt6YvOyMsVli2JkCHYV8O1M6h+w9JBXnIuj8dsAzeRo/ZnB9Ob+OenTKNMzKQD1D/oxAYWsauggVdjjrqSqHJfOEiX701gz/Z2Mew7AlL+AJ+0TPr8t3eZjWPUs1b/oTMn5ulMz17YXdx7Q77qSgt6oWNQuINUwp4zXs8FIES+oXoAbRTnDURh46+cR7GLFf94ZnTHbIXaEGtTsM0Sdm7L4r/lDaGzRUjjHEgcLNSQdBDIJbiY6cW4ZGbLPgm/fMdw7eOY/ipcaOYPjCIIlOjjcDv1FdVB5mUP+Lv+hopT7Ce4YFyU+7d+w7+rJZFrqNdTWVYW3jTmi3e5UufIZyo18NVMv7Ogct+OOcud2HaUVeDwEhTvHZ4a+ov/dtDJL/mBO2UbENv4OO/Jl1hjoaX0F41DMQ33uJ9/CZj8pf7Oy4iStf3p4J9GCcba6oQoWgVQ4HsPOmfrQ6QtVoMEFK5aVlJgZAFx1ne4xkBoA5K6ruOT57PP8v9ibiVXN5MgUSL1A8FL3XEPja1j+PJI/u1q+aWSUvVtWUi8zsnwt4HWPG70ipxWxs5f2UGShBR28aj3s3cegenAu2ymkBCbP+/Yskn8WwN/wxzs0/KCcxJvSU+o8mtwmH18K42TBOHKUVC4KeaDlMe6T1p1V/mcbIH2aaudQs+CQrBztOoXSfJIyL79wJZRcL8Ybuz+yaQMlA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(396003)(46966006)(36840700001)(8936002)(53546011)(47076005)(9686003)(82310400003)(86362001)(36860700001)(33656002)(5660300002)(83380400001)(70206006)(2906002)(81166007)(4326008)(55016002)(26005)(186003)(478600001)(70586007)(336012)(8676002)(356005)(6862004)(82740400003)(7696005)(52536014)(6506007)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:44:02.8162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03869209-ee1b-4bc0-b20c-08d96c8564f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6799

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjMxyNUgOTo1MQ0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzgvNDBd
IHhlbi9hcm06IGVuYWJsZSBkZXZpY2UgdHJlZSBiYXNlZCBOVU1BDQo+IGluIHN5c3RlbSBpbml0
DQo+IA0KPiBPbiBXZWQsIDExIEF1ZyAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBFdmVyeXRo
aW5nIGlzIHJlYWR5LCB3ZSBjYW4gcmVtb3ZlIHRoZSBmYWtlIE5VTUEgbm9kZSBhbmQNCj4gPiBk
ZXBlbmRzIG9uIGRldmljZSB0cmVlIHRvIGNyZWF0ZSBOVU1BIHN5c3RlbS4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICB4
ZW4vYXJjaC9hcm0vbnVtYS5jICAgICAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwgIDcgLS0tLS0t
DQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL251bWEuYyBiL3hlbi9hcmNoL2Fy
bS9udW1hLmMNCj4gPiBpbmRleCAyYTE4Yzk3NDcwLi4zYjA0MjIwZTYwIDEwMDY0NA0KPiA+IC0t
LSBhL3hlbi9hcmNoL2FybS9udW1hLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+
ID4gQEAgLTE4LDYgKzE4LDcgQEANCj4gPiAgICoNCj4gPiAgICovDQo+ID4gICNpbmNsdWRlIDx4
ZW4vaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+DQo+ID4gICNpbmNs
dWRlIDx4ZW4vbm9kZW1hc2suaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9udW1hLmg+DQo+ID4gICNp
bmNsdWRlIDx4ZW4vcGZuLmg+DQo+ID4gQEAgLTgzLDI4ICs4NCwzNCBAQCB2b2lkIF9faW5pdCBu
dW1hX2luaXQoYm9vbCBhY3BpX29mZikNCj4gPiAgICAgIHBhZGRyX3QgcmFtX3NpemUgPSAwOw0K
PiA+ICAgICAgcGFkZHJfdCByYW1fZW5kID0gMDsNCj4gPg0KPiA+IC0gICAgcHJpbnRrKFhFTkxP
R19XQVJOSU5HDQo+ID4gLSAgICAgICAgIk5VTUEgaGFzIG5vdCBiZWVuIHN1cHBvcnRlZCB5ZXQs
IE5VTUEgb2ZmIVxuIik7DQo+ID4gLSAgICAvKiBBcm0gTlVNQSBoYXMgbm90IGJlZW4gaW1wbGVt
ZW50ZWQgdW50aWwgdGhpcyBwYXRjaCAqLw0KPiA+IC0gICAgbnVtYV9vZmYgPSB0cnVlOw0KPiA+
ICsgICAgLyogTlVNQSBoYXMgYmVlbiB0dXJuZWQgb2ZmIHRocm91Z2ggWGVuIHBhcmFtZXRlcnMg
Ki8NCj4gPiArICAgIGlmICggbnVtYV9vZmYgKQ0KPiA+ICsgICAgICAgIGdvdG8gbWVtX2luaXQ7
DQo+ID4NCj4gPiAtICAgIC8qDQo+ID4gLSAgICAgKiBTZXQgYWxsIGNwdV90b19ub2RlIG1hcHBp
bmcgdG8gMCwgdGhpcyB3aWxsIG1ha2UgY3B1X3RvX25vZGUNCj4gPiAtICAgICAqIGZ1bmN0aW9u
IHJldHVybiAwIGFzIHByZXZpb3VzIGZha2UgY3B1X3RvX25vZGUgQVBJLg0KPiA+IC0gICAgICov
DQo+ID4gLSAgICBmb3IgKCBpZHggPSAwOyBpZHggPCBOUl9DUFVTOyBpZHgrKyApDQo+ID4gLSAg
ICAgICAgY3B1X3RvX25vZGVbaWR4XSA9IDA7DQo+ID4gLQ0KPiA+IC0gICAgLyoNCj4gPiAtICAg
ICAqIE1ha2Ugbm9kZV90b19jcHVtYXNrLCBub2RlX3NwYW5uZWRfcGFnZXMgYW5kIG5vZGVfc3Rh
cnRfcGZuDQo+ID4gLSAgICAgKiByZXR1cm4gYXMgcHJldmlvdXMgZmFrZSBBUElzLg0KPiA+IC0g
ICAgICovDQo+ID4gLSAgICBmb3IgKCBpZHggPSAwOyBpZHggPCBNQVhfTlVNTk9ERVM7IGlkeCsr
ICkgew0KPiA+IC0gICAgICAgIG5vZGVfdG9fY3B1bWFza1tpZHhdID0gY3B1X29ubGluZV9tYXA7
DQo+ID4gLSAgICAgICAgbm9kZV9zcGFubmVkX3BhZ2VzKGlkeCkgPSAobWF4X3BhZ2UgLSBtZm5f
eChmaXJzdF92YWxpZF9tZm4pKTsNCj4gPiAtICAgICAgICBub2RlX3N0YXJ0X3BmbihpZHgpID0g
KG1mbl94KGZpcnN0X3ZhbGlkX21mbikpOw0KPiA+ICsgICAgLyogSW5pdGlhbGl6ZSBOVU1BIGZy
b20gZGV2aWNlIHRyZWUgd2hlbiBzeXN0ZW0gaXMgbm90IEFDUEkgYm9vdGVkDQo+ICovDQo+ID4g
KyAgICBpZiAoIGFjcGlfb2ZmICkNCj4gPiArICAgIHsNCj4gPiArI2lmZGVmIENPTkZJR19ERVZJ
Q0VfVFJFRV9OVU1BDQo+ID4gKyAgICAgICAgaW50IHJldCA9IG51bWFfZGV2aWNlX3RyZWVfaW5p
dChkZXZpY2VfdHJlZV9mbGF0dGVuZWQpOw0KPiA+ICsgICAgICAgIGlmICggIXJldCApDQo+ID4g
KyAgICAgICAgICAgIGdvdG8gbWVtX2luaXQ7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19X
QVJOSU5HDQo+ID4gKyAgICAgICAgICAgICAgICJJbml0IE5VTUEgZnJvbSBkZXZpY2UgdHJlZSBm
YWlsZWQsIHJldD0lZFxuIiwgcmV0KTsNCj4gPiArI2Vsc2UNCj4gPiArICAgICAgICBwcmludGso
WEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgICAgIkNPTkZJR19ERVZJQ0VfVFJFRV9O
VU1BIGlzIG5vdCBzZXQsIE5VTUEgb2ZmIVxuIik7DQo+IA0KPiBJIGRvbid0IHRoaW5rIHdlIHdh
bnQgdG8gc2VlIHRoaXMgd2FybmluZyBldmVyeSB0aW1lIGF0IGJvb3Qgd2hlbg0KPiBDT05GSUdf
REVWSUNFX1RSRUVfTlVNQSBpcyBvZmYuIEknZCBzZXQgaXQgdG8gWEVOTE9HX0RFQlVHIG9yIHJl
bW92ZSBpdC4NCj4gDQoNCk9LDQoNCj4gQWxzbyBnaXZlbiB0aGF0IHdlIGhhdmUgbWFueSBzdHVi
IGZ1bmN0aW9ucyBpbg0KPiB4ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCBhbHJlYWR5LCBtYXli
ZSB3ZSBjb3VsZCBhbHNvIGhhdmUgYSBzdHViDQo+IGZ1bmN0aW9uIGZvciBudW1hX2RldmljZV90
cmVlX2luaXQgc28gdGhhdCB3ZSB3b24nZCBuZWVkIGFuICNpZmRlZg0KPiBDT05GSUdfREVWSUNF
X1RSRUVfTlVNQSBoZXJlLg0KPiANCg0KWWVzLCBpdCdzIGEgZ29vZCBpZGVhLiBJIHdpbGwgZG8g
aXQuDQoNCj4gDQo+ID4gKyNlbmRpZg0KPiA+ICsgICAgICAgIG51bWFfb2ZmID0gdHJ1ZTsNCj4g
PiArICAgIH0NCj4gPiArICAgIGVsc2UNCj4gPiArICAgIHsNCj4gPiArICAgICAgICAvKiBXZSBk
b24ndCBzdXBwb3J0IE5VTUEgZm9yIEFDUEkgYm9vdCBjdXJyZW50bHkgKi8NCj4gPiArICAgICAg
ICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgICAgIkFDUEkgTlVNQSBo
YXMgbm90IGJlZW4gc3VwcG9ydGVkIHlldCwgTlVNQSBvZmYhXG4iKTsNCj4gPiArICAgICAgICBu
dW1hX29mZiA9IHRydWU7DQo+ID4gICAgICB9DQo+ID4NCj4gPiArbWVtX2luaXQ6DQo+ID4gICAg
ICAvKg0KPiA+ICAgICAgICogRmluZCB0aGUgbWluaW1hbCBhbmQgbWF4aW11bSBhZGRyZXNzIG9m
IFJBTSwgTlVNQSB3aWxsDQo+ID4gICAgICAgKiBidWlsZCBhIG1lbW9yeSB0byBub2RlIG1hcHBp
bmcgdGFibGUgZm9yIHRoZSB3aG9sZSByYW5nZS4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLWFybS9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+IGluZGV4
IGEzOTgyYTk0YjYuLjQyNWViOWFlZGUgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+IEBA
IC0zMCwxMyArMzAsNiBAQCBleHRlcm4gaW50IG51bWFfZGV2aWNlX3RyZWVfaW5pdChjb25zdCB2
b2lkICpmZHQpOw0KPiA+ICBleHRlcm4gdm9pZCBudW1hX3NldF9kaXN0YW5jZShub2RlaWRfdCBm
cm9tLCBub2RlaWRfdCB0bywgdWludDMyX3QNCj4gZGlzdGFuY2UpOw0KPiA+ICBleHRlcm4gdm9p
ZCBhcmNoX251bWFfaW5pdF9mYWlsZWRfZmFsbGJhY2sodm9pZCk7DQo+ID4NCj4gPiAtLyoNCj4g
PiAtICogVGVtcG9yYXJ5IGZvciBmYWtlIE5VTUEgbm9kZSwgd2hlbiBDUFUsIG1lbW9yeSBhbmQg
ZGlzdGFuY2UNCj4gPiAtICogbWF0cml4IHdpbGwgYmUgcmVhZCBmcm9tIERUQiBvciBBQ1BJIFNS
QVQuIFRoZSBmb2xsb3dpbmcNCj4gPiAtICogc3ltYm9scyB3aWxsIGJlIHJlbW92ZWQuDQo+ID4g
LSAqLw0KPiA+IC1leHRlcm4gbWZuX3QgZmlyc3RfdmFsaWRfbWZuOw0KPiA+IC0NCj4gPiAgI2Vs
c2UNCj4gPg0KPiA+ICAvKiBGYWtlIG9uZSBub2RlIGZvciBub3cuIFNlZSBhbHNvIG5vZGVfb25s
aW5lX21hcC4gKi8NCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=

