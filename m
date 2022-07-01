Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49EF562AC6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 07:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358846.588231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o790K-0007N8-Dq; Fri, 01 Jul 2022 05:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358846.588231; Fri, 01 Jul 2022 05:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o790K-0007KK-Ab; Fri, 01 Jul 2022 05:15:44 +0000
Received: by outflank-mailman (input) for mailman id 358846;
 Fri, 01 Jul 2022 05:15:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lOeg=XG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o790I-0007KE-Pd
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 05:15:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d946f83f-f8fc-11ec-bdce-3d151da133c5;
 Fri, 01 Jul 2022 07:15:40 +0200 (CEST)
Received: from AS8PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:20b:331::7)
 by DU0PR08MB8140.eurprd08.prod.outlook.com (2603:10a6:10:3ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 05:15:38 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::40) by AS8PR04CA0152.outlook.office365.com
 (2603:10a6:20b:331::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17 via Frontend
 Transport; Fri, 1 Jul 2022 05:15:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 05:15:37 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Fri, 01 Jul 2022 05:15:37 +0000
Received: from a1f9e7746467.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A08FEA4-66AC-4CA5-8265-064C75896A82.1; 
 Fri, 01 Jul 2022 05:15:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a1f9e7746467.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Jul 2022 05:15:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB3471.eurprd08.prod.outlook.com (2603:10a6:803:7d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 1 Jul
 2022 05:15:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 05:15:29 +0000
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
X-Inumbo-ID: d946f83f-f8fc-11ec-bdce-3d151da133c5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h/LMnun09YY7f83eiTxVCgUPKCeG+hloqAakOWV2lbvEwtkzBJoh8vocxGgCw4T+eI45DD5A4nvoxUHPAhYRekm5+60JzlNKpciKG1PEDUaJrQar92k+163YljKJYffNJBtdyWe1r7cDzN1zJ9kkWzbcyL7fknNg6CGpK4DfxAM31fcTroB78GmJSaQ9RqHA1vBuA4G10E48ol9f7skHHbeBEHICfitCWaIJSjrla9+QhV2Stb5Pw8mQF9YP1BOKdA8R4xEdX65U72ztJ5XZdSYiIDjriJWVagdgu6qBgINAoWn1OcsMapA3oFd7EWeAMK1QEa03AjebpwNShNtRVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVwCWXc1+TSNoacnkpf/IEWCE7xaUXwTOiE4rGFpa9E=;
 b=gU82rU0BJ0+WcNWex7si6ndIYv1MbkJQW7rloDSQvDLwwp1zSfQcLsLUih2W4tX7+lKRUHCHCEB0HjXFAbCAtUyF8ZBQbhAO+QUr0p+aWBztjIAZCLsd/O41sYmzEuWHG7rQIfrk0wZ1L7ICIMWqo6KSoktyvxXCnoKDHKccKspQVK0YBtU1tvZOSVMEWLxFScTzODu5//VwvHjmX4r8I70v5rE3EW8Ac6bjakpIDfdERWzGdcf0NiMT3lYXZqgFhAnFERCN5g6ZE6r+MJ9m53ZmqM+GCUHeox5qhi1WCzS2+0b51/kd2BgNcJBiLIIqoGHTDPu9wCLBfXI2w5ROWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVwCWXc1+TSNoacnkpf/IEWCE7xaUXwTOiE4rGFpa9E=;
 b=Dit00Mvw/NC59snY63DdsUaZeEfOoY8A2MrRcZl9CEh0aNrENnzFgtdssAaWUmkHxdm1G/FzUIvLzrghaD7uzklgGcOwoU7uGGgN05jLeQFRgaVKrBJ9kUqiy9fQv6le/24jpW9BtDdYEaY3yOH1IUeeHh+JSpncpB9NGB6k5OE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN5jo6z5u6jGejB/WPplZ5lWEFgQjuXnWSZQtio0bZ6ikXBrDUW9kCVNDoyP/Onygnn0eWwtz3NxRPgxEsu4g2k8EisgiXYtDeDXboAZfshWCbA09cgn1oOhcMw3HzCLzOecTMlgqAAruEwD/v5f0wXmzzea9a5YVmP6Wsu9UUzuntal5tnBJXb/pp3qveWC53m8z+CqJGvsmDul4uu3woHVDKjnfhjJ7eGSSFK8yguRlRIVpB7ZqS6m+H/usqqupcOfu7eJn81Uc+5Gvx2JAZGZTKTj5aB0WwboYaAcl3O5T4Gl812eKRqMBalrITKyl/1MjKhdKR9OF/1siN9DoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVwCWXc1+TSNoacnkpf/IEWCE7xaUXwTOiE4rGFpa9E=;
 b=nOIBFdunQOO0TX5f8h/4wn8reHZKQ1CyZ/7b2p0dWLgzlEC/zRiP2AxVTKTltKOsxXTKDJN9JN70yNRwni2BenzB057+nSejaZJS8FRul991M9Y6La1dg/wT/u8IMfCDhoLF20fFpRET7ZvXmyP80iwP6Wajt0hrO5DATyIz0X1nxcZIwNvcXiIB9eEAOIK9FoIS02Qmj/VSNH7WhX4V9UWycQT5d21XRhQEHPBHNDJG2EGYeTO7bbjzZD1swP40Avkg7hhDmGQCNBFfEXcWOfzwKQwm6fbxU0uKxq+zepY5CYKU4MxB26nwU1NuJ/rzb3gyD7srGpC97CYjmajvRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVwCWXc1+TSNoacnkpf/IEWCE7xaUXwTOiE4rGFpa9E=;
 b=Dit00Mvw/NC59snY63DdsUaZeEfOoY8A2MrRcZl9CEh0aNrENnzFgtdssAaWUmkHxdm1G/FzUIvLzrghaD7uzklgGcOwoU7uGGgN05jLeQFRgaVKrBJ9kUqiy9fQv6le/24jpW9BtDdYEaY3yOH1IUeeHh+JSpncpB9NGB6k5OE=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
	Julien Grall <julien@xen.org>
Subject: RE: [PATCH v3] public/io: xs_wire: Document that new errors should be
 added at the end
Thread-Topic: [PATCH v3] public/io: xs_wire: Document that new errors should
 be added at the end
Thread-Index: AQHYjLCT8ll1pspHXU2Irp2zQF5YmK1ox2KQgAAxoACAAABVAA==
Date: Fri, 1 Jul 2022 05:15:29 +0000
Message-ID:
 <AS8PR08MB79911ECF184F464ED9ED956192BD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220630183655.44391-1-julien@xen.org>
 <AS8PR08MB79915165082E112C7631801892BD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <8f7224dd-72a7-d690-54da-98790d4a6153@suse.com>
In-Reply-To: <8f7224dd-72a7-d690-54da-98790d4a6153@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A04DDEC2AEBDFF4488FD05D12120483A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e3b75036-abe5-459b-56c0-08da5b20bc26
x-ms-traffictypediagnostic:
	VI1PR08MB3471:EE_|AM5EUR03FT059:EE_|DU0PR08MB8140:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +UIq3IR2gEndJacCUXG5dOI8VP9EuYssKfO40Q286/iSJAtLaxvUFyhPx7ZbOCq5KcnztNmqjteOvUPTC4iB9iy6SEh2lJkRO3V/Ci6tM63CNVis9JwoOvwvWmfVK51TgGPlzAoTwZZg6vmgAAz6Zo825THtmJM2KEXlwSiU4qoILQdwlDkhJjKkjr4U4AE/s0uBPxVpJacKm0BDFDEffltuHNlgIgoiLfYXNveE4ALRi7HbkffOb8VkDiujloCu9UZ9kVoJmx5F1H0YAJECC8CUzjSglqkbTWrxkcLQYWiSnjn6KAfn5IFzXQI07BDQ8BJgbCEUzdTQaaodcrkhOIBR6fyAnDNjwA9HZK3quy7y4hEzBP2+HV+IVWZlev8RvffOdhRWWMFMMsyjs5aamJGriE4SsMxJGQIjCzIaGmNsHyrsGB4jVBxXFsFlXROia42M9vbsbKW9qTL5UXDbN3HU65JlkbMqyMLoCVVgadE/0CRgRGA/vLWnnftJGGxCOF0fkZMS9ejj1UbFRnpMB5lY5jyH6tiz6xRLpO3ih3zpYZMnIO0QydzY1JptXDSOetn4U9wukhlp8LVymfcYdvZj8DtTh1BJpBN3kwnV3a9R+oMzivXJiRdn0jct0l7Tl8BWgUOH+g4OUIuKtW11bh9EzDuQmc8ZNcyR1f2OIoTGageH+AbAsf33olq5KnGeRgoThp/lUa0NKFlfzqtRYaXNgDImpF5+jGEvOIOQx8lvSxhWUS8Q++r3xrz+VX8+t5C+bqU+IAfMvOWAErQu98UtwU08s53LPpvDNf0gIx3kFiii5ChbrFsFlOWImljz
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(122000001)(9686003)(66446008)(7696005)(26005)(4744005)(2906002)(53546011)(33656002)(41300700001)(38070700005)(71200400001)(54906003)(110136005)(86362001)(83380400001)(478600001)(6506007)(76116006)(66556008)(4326008)(66476007)(52536014)(5660300002)(38100700002)(55016003)(64756008)(8676002)(66946007)(316002)(186003)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c22b1f4-bbd2-4c26-3fed-08da5b20b70a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cd0AdqztRiQIqRMvPClO9ctbj3ahhyVKLg69mCN8q9wczaBUXTR4fLEUln4YLkOdz4ZC6Bjc9XVa4xv+WcMK8NNEFc2/BruD7ci98aW50Mbk9ZOXKaHdEd4+6vvjWETeipspQLNAPAPEFyrEKNLkH83xnonTv6B4ZQpUH5+c9/JA+U7hU+gZRE8j2eF0d/VGx9s2P2B9lfyc6g69rl3d64g3AK2yXLqexO6/u3k0XjI5hfN7p8HXCwW+VfrScHZXhR5vFdxVuILDtvtcyI0QjAyo1Y2FAOGYUaB1pKdy9p0zWgnChGjDcBH7Zb+YQ8aAt6lHwRJgKIl0pffr54rGRlNa42DrPknmcMMFFq2emDGwPjoYf+FvxWjzN5DHia3fGYEHDA+Vw4pyw32wYbW4TqEsrCvGJhG8veTa1GjBpct2/t3enFh5FU8a/W61O08V64/MdvO8uVC35aTiRkgUAGvfM4XdDGU69ktY+J2+qdjvx41RW00nfIrC1koKPgyutk7VCktohq55FeE6lyOtf8ISt4rNBbkFXxIL0YNTMah7DENuRRYqVtPNkRJncPHZAtLjZfTB2XhTXObtI7iaZijQRIKh2xQpz14pB1UsUEiKjFfz6TeHbS2SjTdJIuDnx4fZbcZLxBCRPtDj5OyHwDa/3R7qbbEFXViaYaRechCFAusuZsVmR1WRIerJkR6sUGU2jqF2wuUNj8Dhy8fYs2RBwbOKXnysWvUyNj49+sWxGMGb8micMDLhLmsUviZK7lIVaneDDoqHp0ZypnhA/bD92Xpslzyx7fn0weGX4CcMIvMDHDE1aqHLo24laZT+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(55016003)(4326008)(52536014)(83380400001)(5660300002)(86362001)(8936002)(70206006)(33656002)(40480700001)(40460700003)(316002)(2906002)(4744005)(110136005)(9686003)(336012)(81166007)(478600001)(356005)(6506007)(70586007)(8676002)(186003)(7696005)(53546011)(82740400003)(41300700001)(47076005)(36860700001)(26005)(82310400005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:15:37.9431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b75036-abe5-459b-56c0-08da5b20bc26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8140

SGkgSnVlcmdlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBPbiAwMS4wNy4y
MiAwNDoxOSwgSGVucnkgV2FuZyB3cm90ZToNCj4gPiBIaSBKdWxpZW4sDQo+ID4NCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gU3ViamVjdDogW1BBVENIIHYzXSBwdWJsaWMv
aW86IHhzX3dpcmU6IERvY3VtZW50IHRoYXQgbmV3IGVycm9ycyBzaG91bGQNCj4gYmUNCj4gPj4g
YWRkZWQgYXQgdGhlIGVuZA0KPiA+Pg0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBh
bWF6b24uY29tPg0KPiA+Pg0KPiA+PiBTb21lIHRvb2xzIChlLmcuIHhlbnN0b3JlZCkgYWx3YXlz
IGV4cGVjdCBFSU5WQUwgdG8gYmUgZmlyc3QgaW4geHNkX2Vycm9ycy4NCj4gPj4NCj4gPj4gVG8g
YmUgY29uc2VydmF0aXZlLCBtYW5kYXRlIHRoYXQgbmV3IGVycm9ycyBzaG91bGQgYmUgYWRkZWQg
YXQgdGhlIGVuZA0KPiA+PiBvZiB0aGUgYXJyYXkuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+ID4NCj4gPiBXaGlsZSB0aGUgY2hh
bmdlIGlzIGxvb2tpbmcgZ29vZCwganVzdCBGWUkgdGhlcmUgaXMgYW4gIkVSUk9SIiBzZWN0aW9u
IGluDQo+ID4gL3hlbi9kb2NzL21pc2MveGVuc3RvcmUudHh0IHRoYXQgcG9pbnRzIHRvIHRoZSBp
by94c193aXJlLmguIFlvdSBtYXkNCj4gPiB3YW50IHRvIGFkZCBzb21ldGhpbmcgdGhlcmUgKHRo
YXQgZGVwZW5kcyBvbiB5b3VyIG93biB0YXN0ZSA6KSkgKQ0KPiANCj4gVGhpcyBkb2N1bWVudGF0
aW9uIGlzIG1lYW50IGZvciB1c2VycyBvZiBYZW5zdG9yZSwgbm90IGZvciBob3cgdG8gbW9kaWZ5
DQo+IGl0LiBJIHRoaW5rIHRoZSBjb21tZW50IGlzIGFsbCB3aGF0IHNob3VsZCBiZSBhZGRlZC4N
Cg0KT2sgc3VyZSwgdGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uIFRoZW4gSSB0aGluayB0aGlz
IHBhdGNoIGlzIHBlcmZlY3QuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IA0KPiBK
dWVyZ2VuDQo=

