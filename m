Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FD605BE5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 12:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426386.674778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSXr-0000Q6-Ht; Thu, 20 Oct 2022 10:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426386.674778; Thu, 20 Oct 2022 10:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSXr-0000NC-EE; Thu, 20 Oct 2022 10:12:59 +0000
Received: by outflank-mailman (input) for mailman id 426386;
 Thu, 20 Oct 2022 10:12:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZuZ=2V=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1olSXp-0000N6-Gt
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 10:12:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c33e54ad-505f-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 12:12:55 +0200 (CEST)
Received: from DB8PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:110::25)
 by PAXPR08MB6334.eurprd08.prod.outlook.com (2603:10a6:102:dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 20 Oct
 2022 10:12:52 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::44) by DB8PR04CA0015.outlook.office365.com
 (2603:10a6:10:110::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Thu, 20 Oct 2022 10:12:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 20 Oct 2022 10:12:52 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Thu, 20 Oct 2022 10:12:52 +0000
Received: from 8f6c0fbdb673.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 886E33D4-7360-4062-B224-BDD0569F4209.1; 
 Thu, 20 Oct 2022 10:12:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f6c0fbdb673.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 10:12:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6091.eurprd08.prod.outlook.com (2603:10a6:10:1f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 10:12:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 10:12:44 +0000
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
X-Inumbo-ID: c33e54ad-505f-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=D04oXZ1hQsA+p3GaIwUyYzSw5BY3H30zvwEkkcimHrGub/zy2tk8RugTl5oXcw7I94EY89d+3nCISqeeWH0wdxCLoB7wKFXq0SvEBycGUwov94I0Gvdqt1IUPvgTTf4X55SMFaiZ7tQ6zd3XEttccEaHj9yzRy6RAMDqbTzIRgnhRsWZwm86V5rsmWnvtgtZ41Icn4G6tcv4mReT+Iau0uehluLGTQjBsG18K8tvASkxPaoWc0eojf2kG9GgZjdQ/C6t35sdw71Gon5K2iYvP0kJYfYJ5fzTluc4qhXAs8iKoSKCySDpdJnb6RCqEN8UKrQIfuO3hENgkkRXEWqXWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj4P5s/YQPJglgykj+oSMcvjBIAHOgnUdborGgmu0+0=;
 b=NyaLNtL6lOKfl8bbxB4gV1DVjHLmkvNn0FK5Zg1tj7Q4+3/L0kij+8p5V2onvo/yNn42ku8NXjpj6/JE+LHP1755bY7OPbJo+he7ZV0BCkBrRC9Cc8SF6S9MX4YqDNSBRAbhAoXu2dsTR1qU39fDQiNtIIPk2jAar2hBSUYkJY1UKDkSThmaqGG69pCY50vbQjigJVn6uClqSlt0xSXMXU8EsTTk1ahg0G9J68OhAAAofS+sP+4IVnO3rKlA4KXCM0UYdOhybn8KbLdT4wxitZf47MtU/7rbQ8QJRjLeY9PqUFW+GxbBZBNdT6fkgUNKq2Xu3qpn/67c4ApBTGxZeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj4P5s/YQPJglgykj+oSMcvjBIAHOgnUdborGgmu0+0=;
 b=4xy7GUP/+KU3BPZD4LR11euzT2ERykIdJwVA9eV9fzWrZShQTe+Lo3yEDuuCtOE08PqzDdQk8K1bA5FTmdws20QxFy4OUGd3gwYd7J90WiIf870J8dblgiAJ1Pzo/Fa360rMOdKMW9vDH6ocN9Zsy5nP+sE08W9W/R+jquSxd/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VktSi8ntBh1PDnxKC3zLqAUrqVBtALO4Wv8ycPgtRVy8MchG9AWeCFof/Awmkabb4NGeFh+SqDFgOKpL+7WrhGUh12ZWJxMlVJa8DMzYAzGoBDkS0vjMECUErw7bsR1/8g8I47Rqmk+2Oo+GVg2A9f7WW17zjESpx36XQ9K9U9b1liGXn0odzT5X8OeGp90iRJdzjL76cHcg1XsI4LCCLzQWfcqoxZJB3Ig7bh2I2zRIDvjAAxOtOaV6JPYZTJWypQMFhpPHnBVwcvfYXf0toLdZB3LThOb7pKtiCx7+oKDxPMqZAjDIyropWE6oA3YsTH4ejjfra6MmhrxvCC9IbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj4P5s/YQPJglgykj+oSMcvjBIAHOgnUdborGgmu0+0=;
 b=i+/juhvqih6ZaPGVmH7mXyKQPPX5cXc3I5qFOrlIGSebJwXDp728w+TiouXaMAQuv8VPibldA+Eqm92xQziecnwqnRHOl1fd7aJY+4E+HQGCQG5j3Qi2xioPOj9+TblaiowJ+OlcK8lWnHV0UETcKaMbVJjidtARIcgOZopPqJZsTXXOKU+vka41z77gljOCKTpmmZPHo1EzdktW85H54EtcpgNpNnOJgpDySSUz8Wr1tBg7nQ8ylVrgdTBMr9L1AZirUm4SQg7Q0vDj93/4wo48SIZzwMoEG6Xy69Ua67owMo49Wvd2sPE6ls3ajB1GKELXIwLTmj1NZfxgrGOXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj4P5s/YQPJglgykj+oSMcvjBIAHOgnUdborGgmu0+0=;
 b=4xy7GUP/+KU3BPZD4LR11euzT2ERykIdJwVA9eV9fzWrZShQTe+Lo3yEDuuCtOE08PqzDdQk8K1bA5FTmdws20QxFy4OUGd3gwYd7J90WiIf870J8dblgiAJ1Pzo/Fa360rMOdKMW9vDH6ocN9Zsy5nP+sE08W9W/R+jquSxd/s=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: RE: [PATCH for-4.17 0/6] (v)pci: fixes related to memory decoding
 handling
Thread-Topic: [PATCH for-4.17 0/6] (v)pci: fixes related to memory decoding
 handling
Thread-Index: AQHY5GkOCveZHX5ZBUGwhdfrTrFAqa4XD2Ag
Date: Thu, 20 Oct 2022 10:12:44 +0000
Message-ID:
 <AS8PR08MB7991CDF482A0B232C36628D0922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
In-Reply-To: <20221020094649.28667-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FDCF0ED0873DFD44896DA35FDB1FDF21.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6091:EE_|DBAEUR03FT012:EE_|PAXPR08MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9cc7fa-2d33-43c0-8dc7-08dab283a5f8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 udrSH5KWoe3Rw3vOt3zlE9Kq408phiPBNcE62Sc9Rjlub/Gqa4lEa+fLUpv/8GRSWz/lBZ20Ga/avhzywvZ1yxvTdAK0nx8Ezh5O0SGq2tS3uYd4VXt8wfpT2nXIqUnWVmleliFdnKrEroZfQpXe/amTWkLkDNARY9h6Alhf3XTvYZEku2xDAadMRU/JwE992VSzHXDWfIkvYAESD0U4Hy6xeVsQA9/U5kk80q/TO0e+D1lbHJbdLaLaWWuFjW5jubYTvNbQ0kfpFbVbUGCyDzzO7pOxhdF468G6WW9+5xpQLadvMC7NhIFjHNim2zyu1TcVCIDxL/3cq5rdqlSIDFBIpmI+8CDfd1+cGpfdY+3cqbEnBqZ8DtIRURCyexmcQXsliKOMc3GOrDwnKB6IkTSar6wpkNu0PGovi7RwaIpSO/NY8yiTtxwmgyY2UQOsoFWXdonibQnHWLrjnIsU5SdqiT35EAJSNqwrZZilJ3m6t4jlppt5ZLWT8xHhCka659Gq2XnW+QMZDU3gKTrCjUd2w3J5xNEVGRcibiUSaoTLIrah+v273q532N9tMewz+DRDzCqAbyKHU0ERyGJwMVBeMxDM0VLVQDSYxbt6LKw/oi42jZWk9whnsTiQ4j6u2mW51ESIFNy1F0SHY3dofsmbCcLEWCv9HfYDS3tP9Mn8ECzMGZYed+4q1996gBy0L/NjzDJo52tmCE5QO63VbitUGh9jLA8UjBMOmsmEQmkZYLkij6aeuipWEYhB+BRuu5CpHK/5Tl2FwAW9a8XOTg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199015)(186003)(71200400001)(38100700002)(478600001)(38070700005)(122000001)(33656002)(54906003)(110136005)(6506007)(7696005)(41300700001)(55016003)(83380400001)(316002)(76116006)(66946007)(5660300002)(2906002)(66446008)(66476007)(66556008)(64756008)(52536014)(4326008)(8676002)(86362001)(26005)(9686003)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6091
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6bd5fdf2-edc8-4aa8-fed5-08dab283a19b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	295/FChDSEHHyVSNYlx9ARCAS328hk98rMTEncCD2AEshPiBnvhC+atwzFf+QxaLGwT+SYxSosiAn9TVCgD7KOcmEXD6BlxaADRoTQCoQ3ERen6ImrhzTRKE99AbIrbXJFeX8T5bVgxBJ63ioWzNcDArZDoBLaUFlKqYXWE4p7cF7fif6uev5QODrvk92k0SuYbarmhmORHX5yQ8tHw4XEtlB+TJ6Ez0MiKCYu5+OO8sCDKM+Y7Vc8yOQ6aSaDKP19OoqpZt/59KEF6HZcyzcHcoCtj2Y5kBhFjbcHWTy7g0FS1wUygIQ5jJjKDBPFvgdweanaYZcDDSg19rP+x4HhkZUjOFSORg65Y7wSCMiRG2zMtbRVg2l4NyeqzWFMxU5uzyU2SpwQ6+chGs8H2QVM+d6za2RZ+6PJEX5J7V3nkHXOZrjszYgCb1xqWegTjbKc1fVHWlENif4HGQIVtzQsXDuYO+6MRrV1XtO9UHbjGgCI85kJSEQGgpXP3Ul1DFhsYIiLjOxiG6RaNIlRwGVeT6uC6HAPMuJix6EdeAiJe0Rkqys02HkVhBV0Dg8BGHlmIKvX2oDZwAFMLDzC5VEeqFKUrYfnkjXubOUdCyNs8ki5Fp+IaODYBUXCupLxq/hgSdg/K/wonPDQs8mMHLp+kjmpyf9mhXYq0rLbTXWclzwyfaByI8b5T5PCkP/h5LmV0UbYbT1fV7drIMEo4iMHJHm8RVUbze5sdqdvQJ2HvvcsHRXlKDEJeuhyw93hGlfrSLzbR3tBqmo/qU9Dm4WQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(9686003)(54906003)(8676002)(81166007)(70586007)(82740400003)(83380400001)(82310400005)(4326008)(70206006)(2906002)(356005)(36860700001)(40460700003)(33656002)(52536014)(186003)(336012)(6506007)(110136005)(26005)(86362001)(5660300002)(41300700001)(55016003)(7696005)(8936002)(47076005)(478600001)(40480700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 10:12:52.1336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9cc7fa-2d33-43c0-8dc7-08dab283a5f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6334

SGkgUm9nZXIsIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFtQ
QVRDSCBmb3ItNC4xNyAwLzZdICh2KXBjaTogZml4ZXMgcmVsYXRlZCB0byBtZW1vcnkgZGVjb2Rp
bmcNCj4gaGFuZGxpbmcNCj4gDQo+IEhlbGxvLA0KPiANCj4gRmlyc3QgdHdvIHBhdGNoZXMgZml4
IHNvbWUgYnVpbGQgaXNzZXMgdGhhdCBzaG93ZWQgdXAgb24gdGhlIHZwY2kgdGVzdA0KPiBoYXJu
ZXNzLCBmb2xsb3dpbmcgcGF0Y2hlcyBhdHRlbXB0IHRvIGZpeCB0aGUgcmVncmVzc2lvbnMgY2F1
c2VkIGJ5DQo+IDc1Y2M0NjBhMWIgKCd4ZW4vcGNpOiBkZXRlY3Qgd2hlbiBCQVJzIGFyZSBub3Qg
c3VpdGFibHkgcG9zaXRpb25lZCcpIGFuZA0KPiB0aGUgbGFzdCBwYXRjaCByZWxheGVzIHRoZSBj
aGVjayBkb25lIHdoZW4gYXR0ZW1wdGluZyB0byB3cml0ZSB0byBCQVJzDQo+IHdpdGggbWVtb3J5
IGRlY29kaW5nIGVuYWJsZWQuDQo+IA0KPiBJIGNvbnNpZGVyIGFsbCBvZiB0aGVtIGJ1ZyBmaXhl
cywgYWxiZWl0IHRoZSBsYXN0IHBhdGNoIGlzIG5vdCBmaXhpbmcgYQ0KPiByZWdyZXNzaW9uIChz
aW5jZSB2UENJIGNvZGUgaGFzIGFsd2F5cyBiZWhhdmVkIHRoaXMgd2F5KS4NCg0KQXMgSSBkb24n
dCByZWFsbHkgd2FudCB0byBzcGFtIHRoZSBsaXN0LCBJIHdpbGwgcHJvdmlkZSBteSByZWxlYXNl
LWFjayBpbg0KdGhlIGNvdmVyIGxldHRlci4NCg0KVGhpcyBzZXJpZXMgaXMgYSBidWdmaXggc2Vy
aWVzLCBzbzoNCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0u
Y29tPg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQo+
IA0KPiBSb2dlciBQYXUgTW9ubmUgKDYpOg0KPiAgIHRlc3QvdnBjaTogYWRkIGR1bW15IGNmY2hl
Y2sgZGVmaW5lDQo+ICAgdGVzdC92cGNpOiBmaXggdlBDSSB0ZXN0IGhhcm5lc3MgdG8gcHJvdmlk
ZSBwY2lfZ2V0X3BkZXYoKQ0KPiAgIHZwY2k6IGRvbid0IGFzc3VtZSB0aGF0IHZwY2kgcGVyLWRl
dmljZSBkYXRhIGV4aXN0cyB1bmNvbmRpdGlvbmFsbHkNCj4gICB2cGNpOiBpbnRyb2R1Y2UgYSBs
b2NhbCB2cGNpX2JhciB2YXJpYWJsZSB0byBtb2RpZnlfZGVjb2RpbmcoKQ0KPiAgIHBjaTogZG8g
bm90IGRpc2FibGUgbWVtb3J5IGRlY29kaW5nIGZvciBkZXZpY2VzDQo+ICAgdnBjaTogcmVmdXNl
IEJBUiB3cml0ZXMgb25seSBpZiB0aGUgQkFSIGlzIG1hcHBlZA0KPiANCj4gIHRvb2xzL3Rlc3Rz
L3ZwY2kvZW11bC5oICAgICAgIHwgIDMgKy0NCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jIHwgNjkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIHhlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMgICAgIHwgMzggKysrKysrKysrKysrKystLS0tLQ0KPiAgeGVuL2Ry
aXZlcnMvdnBjaS92cGNpLmMgICAgICAgfCAgNiArLS0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzQg
aW5zZXJ0aW9ucygrKSwgODIgZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjM3LjMNCj4gDQoN
Cg==

