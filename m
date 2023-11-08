Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E59F7E52EB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 10:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629247.981301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0fGJ-0004qs-HE; Wed, 08 Nov 2023 09:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629247.981301; Wed, 08 Nov 2023 09:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0fGJ-0004oX-Ed; Wed, 08 Nov 2023 09:54:15 +0000
Received: by outflank-mailman (input) for mailman id 629247;
 Wed, 08 Nov 2023 09:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SfAH=GV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r0fGH-0004oR-Re
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 09:54:14 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4612473-7e1c-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 10:54:11 +0100 (CET)
Received: from AM6P191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::49)
 by PAXPR08MB6397.eurprd08.prod.outlook.com (2603:10a6:102:12f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 09:53:41 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:209:7f:cafe::41) by AM6P191CA0072.outlook.office365.com
 (2603:10a6:209:7f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Wed, 8 Nov 2023 09:53:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.17 via Frontend Transport; Wed, 8 Nov 2023 09:53:40 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Wed, 08 Nov 2023 09:53:40 +0000
Received: from 905b1454dca2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 633926C0-27ED-4816-8AAE-AB8A758D6179.1; 
 Wed, 08 Nov 2023 09:53:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 905b1454dca2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Nov 2023 09:53:06 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9366.eurprd08.prod.outlook.com (2603:10a6:20b:596::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 09:53:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 09:53:03 +0000
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
X-Inumbo-ID: c4612473-7e1c-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I1ORuAi2FcoLMXm5Pxv70KIpmFzDUyiyp1MZxNQ4LrE0aRThEkuvdnNmbfwpq9ofMQEa6fVv38jmOyJDmG5K4zLZ1G7ZmgfXZYOnMdXcAucYm8L6dAhLIG95Fxaq7NkAz8uEdYANgGNd0my2p9pfrDvIsXcFuep+rC77OV69hFZXwjNCoQb02M31k/KNgk3bof56xNIytZ3g9A+j+dBXhYek7ECMap5p8ACP3SlsT/i3EiBTILB0KR/pbcCQCAW2rDFlWLxH9XJ7WoN7Oa/1/TnWp6O18WV4J6hyGFSdlau9D2GHD58JRWKP7zRWSX0u5J37l5gWjSNRUqvMhFxlDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6L/YZDPsesgrtyMIjEaDcBjHfqdbJpYJM3pXf9oqyg=;
 b=im0iXovahqbVeWN7K8KDgjZbRej4h+bhd5aE2xbVwgin8eRBvb/3EjKajaHx9iKKdE551M86Eqr2fm4KSuChdX48db99qoWnrbakP3RsrAv0q/ZMMaI5pStusgr7lIqA7z/75dA8sGiCt4crC4qHXZrdz1g4nrsD0lKsFsXGmDX4BDHI0CpM2sUqHnI1ryI3hV7J5kpCMKS2i6NAIh3MgfKEHl+j5g7d586JOetkiNQ+6YDCkE8FzxFp8xMo3o95sfxWZ0UlsDYTP7yPIcuiRNM75EAWlY7IpAlm7brjw0pRzmHlqiVkBJlgJdEHUWdpC9lEXPRaYqCkxVk+j16qeg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6L/YZDPsesgrtyMIjEaDcBjHfqdbJpYJM3pXf9oqyg=;
 b=asil3/pbyNcIlZmKt2/EpXsdC48WWAJI4Y9q3xI6iRqaAS1KCMJyAEcnWY4OqSP7eAjCPt2oXwQx51JbMY/mQtwGS8ofOQfRJnkfwedH4Ar0nkfj9iP6mYMoFKl42w24XglsLcQ55wWD92KT8T4b0b46svtA685XOJaD3DRu9Ho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec2572d5ff5cce74
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEUojyTXX/46dVU3jFHIXtE1nHpMj+Tsk5syMUFCD6aCzv/dm8trSM6XsCMwIUG+BHogcng0b+TkE1KB+KUfPKkTvjdzOHPYJFzV76Ebkmo0uhw5hICvz4sDtmbM/BGllQF5gZSlHFev/03ADE4pLDTPpimtSXxAr9/GpHSHAhbocLPiUAx5yIWFNR5rHJQ8xftcWcmkFjlDLRrwIANQKiyJgY1F7e7Pl+eIwrATRYiBo52Xt7L7ltjhReElcg7JXFYUHJC1NZG8QAKWPaXBxp8TR7nm8Q+5P2QrXRkVxqUyeAR9a/4hjMXfmp5avRkjYbOOHFbJs1Zoz9KfGWy5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6L/YZDPsesgrtyMIjEaDcBjHfqdbJpYJM3pXf9oqyg=;
 b=U7fAm4jsu20QPN3XOtiZtVduEQh5ZMFCl6UNq+zBIAz1UrKDEkGWViIl9kQTjVPpl01XzfwDSIxv7Lf4CEQpM40I4/X4xSRYlXQ/X3H1X1kWWxrACEdLaSnVE1sKG7mVihlfDE2Z/ksMjIuYOq5U/nFE/qRmJX0aCORCzehyDT6EDXEZi2UbHR96G9UzjJMOVhLFG9zfHYr6fdo8ReTEXia6xLJAxsKOGoj3v+/FBbTLPC49Lj9qlq7hU0dFEEfoaZbMm5dw0pg43RR0b/Elg/C8zm6afdZXkLsNvcewTeIgfIVNDXbFTgML8PirdM+b/itOviu2ddgFUpkZZJnCuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6L/YZDPsesgrtyMIjEaDcBjHfqdbJpYJM3pXf9oqyg=;
 b=asil3/pbyNcIlZmKt2/EpXsdC48WWAJI4Y9q3xI6iRqaAS1KCMJyAEcnWY4OqSP7eAjCPt2oXwQx51JbMY/mQtwGS8ofOQfRJnkfwedH4Ar0nkfj9iP6mYMoFKl42w24XglsLcQ55wWD92KT8T4b0b46svtA685XOJaD3DRu9Ho=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@amd.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Clang-format configuration discussion - pt 1
Thread-Topic: Clang-format configuration discussion - pt 1
Thread-Index: AQHaEildkKeYHk+uAUifn4n5p7dg+w==
Date: Wed, 8 Nov 2023 09:53:03 +0000
Message-ID: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9366:EE_|AMS1EPF00000044:EE_|PAXPR08MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: a85a12c6-70b6-435a-9ff0-08dbe0409660
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 z4yHqyKFvy/Jz83JaCDl+Ci1I9rQ65R7SyZpkX5/7ik47RhrTsOC/NuRbpi1X9JoKOFs4AUZmQ5qjSsZgIVe3h3jED5QzN+ijOqLmjGwbdwcesH2wZyLJ8F5spXbpkBL4shZPZC/45AADZxNrRRGuR6+j1njaq37q/oOXPozMKcqwPkkb2+wxIJQeJoj1FTTq8NSxpALQ8tj89PvRtLSxHtoM3ul6Y41+5/tWBivG1PWY94yMaVPpquW3xPDFvDZ/XBohiE7OXYSgI7IREEjbrdKoN0G9JJ48A0VTNjO80LRYrYts7nnb1vfgG3+rRqUXtn9eQZjmfsY9/0DYbOrsPrfhHr7HjK0njTLEGAXpfbyXXf1uyVPTgcy58m3gzAZDwW9nIvPyMuD/6DDzre/4/jTtfMLybCjL/iusKYgmUwXUZG/836AXufPqqBa6uB/ODov3evQapbyHkYUt5EE4/Dd4EpeLbLea89cgyMARVMQmRVx3e+qDidqcgMBHQaj1PSQz6FTwm0nb2jZ4JDmdxusIwB9WqB2leJWaTh/fbCcaOY1puySVPIhX2+yQP7zDf0d2B5irb5jGBFJmWCPl/fTcTv90KeLniUvRaF/My9odznZzhm2LhM3gDpwAvoXJw/OzKvbk/loWzAotjXtopoJpKJwnyvVC5N5igraNz+ZYC/Wf/haWm2swGhJvuZ/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66899024)(6506007)(966005)(6512007)(2616005)(478600001)(6486002)(71200400001)(33656002)(36756003)(38100700002)(86362001)(122000001)(5660300002)(91956017)(76116006)(66476007)(66446008)(66946007)(66556008)(41300700001)(83380400001)(2906002)(26005)(316002)(38070700009)(4326008)(54906003)(8676002)(64756008)(6916009)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B53AFFDA43D2FE468C1C6C76F412C6F5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9366
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa5e09dd-2728-42ff-b974-08dbe0407fdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rJheeWZ+9HSYG0ha3quiSZJMPxkfSYRRRLA3naG0tsoO0LoEm1bT2g9kDTEs2x/ckGI852zoeS3QZ5s979l1m3wRGzxWpIeAw9Kw7rvl9Q55EHdzrT6xpo4501CRF8CFk8m7OnW0dcXKSbcMtoYb+a+4/3RrScuyhNgYu8mtFxSvkI8pK6b7VXmyjRBAcO1SDIT13lNPfTnTaY4WY6M/9dDarfmHlAiMietVrpuPFuc/+cl7lUCKZFO3buTC78YRhF37s/PpD1xLFSJWtvTXkmyRXbYmkJzCfSCFnmWpYwUXjK5+314i5vx8vjGMhUme7Kj/k1/ghufENHKUBZrRFru4BAlZwdnUfMEAfYaNksS0k8zNbK1wNFFq13IY+OJOd9AWdtOASFl2/UKisfeNGTpS58yGxwYcemtdl54g5UhswxU7Hy3CZZGP3eL2SctBoCz1irLP22GylYi/TCfKMOf4t0HV97XjJoZMCXahj6EEHY4PXmv2eXfK1p3JcnHTf/Qcp6pIeORjeWKYx48s9/hpAF/uhpVCcq/LyjsQEFIHykfwpiMwWHx9uPSvtFqFBhcV0YacnXT3K7IhXKttmMlyOuBZdg8ZlH5UjUw/1XeRy7DIF4ntGWKqnmsba0YEut62cwxjoBUgKdMOPgX3jUrwXpJltp2rn5XmQsbZhODDkRNHYmRhJTzTOD0Kahv1jIc54o4qjipweQuemjHU9L45l4W3pFn2X4RwX1yeBND0PFVxTKHChM+5jCdnFWQ3phSlI/s5Jsc2dGXsp5iPEA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(82310400011)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(36860700001)(478600001)(40480700001)(6486002)(356005)(6506007)(6512007)(81166007)(966005)(36756003)(82740400003)(336012)(316002)(6916009)(54906003)(2616005)(47076005)(83380400001)(26005)(70206006)(70586007)(8676002)(4326008)(8936002)(66899024)(41300700001)(86362001)(2906002)(33656002)(5660300002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 09:53:40.7719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a85a12c6-70b6-435a-9ff0-08dbe0409660
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6397

SGkgYWxsLA0KDQpMZXTigJlzIGtpY2sgb2ZmIHRoZSBkaXNjdXNzaW9uIGFib3V0IGNsYW5nLWZv
cm1hdCBjb25maWd1cmF0aW9uLCB3aXRoIHRoaXMgcGFydCAxIEkgd291bGQgbGlrZSB0byBkaXNj
dXNzIHNvbWUgY29uZmlndXJhYmxlDQp0aGF0IEkgZmVlbCBhcmUgbm90IGNvbnRyb3ZlcnNpYWwu
DQoNCllvdSBjYW4gZmluZCB0aGUgc2VyaWUgaW50cm9kdWNpbmcgY2xhbmctZm9ybWF0IGhlcmU6
DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2NvdmVyLzIw
MjMxMDMxMTMyMzA0LjI1NzM5MjQtMS1sdWNhLmZhbmNlbGx1QGFybS5jb20vDQphbmQgdGhlcmUg
aXMgYWxzbyBhIHBhdGNoIGxpbmtlZCB0byBteSBnaXRsYWIgYWNjb3VudCB3aGVyZSB5b3UgY2Fu
IGZpbmQgdGhlIG91dHB1dCBmb3IgdGhlIGh5cGVydmlzb3IgY29kZS4NCg0KRm9yIGEgZnVsbCBs
aXN0IG9mIGNvbmZpZ3VyYWJsZXMgYW5kIHRvIGZpbmQgdGhlIHBvc3NpYmxlIHZhbHVlcyBmb3Ig
dGhlbSwgcGxlYXNlIHJlZmVyIHRvIHRoaXMgcGFnZToNCmh0dHBzOi8vY2xhbmcubGx2bS5vcmcv
ZG9jcy9DbGFuZ0Zvcm1hdFN0eWxlT3B0aW9ucy5odG1sDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkNvbHVtbkxpbWl0OiA4MA0KDQpJbmRlbnRXaWR0
aDogNA0KDQpUYWJXaWR0aDogNA0KDQpVc2VUYWI6IE5ldmVyDQoNCi0tLQ0KT3VyIGNvZGluZyBz
dHlsZSBzdGF0ZXMgaXQgZXhwbGljaXRseToNClsuLi5dDQpJbmRlbnRpbmcgdXNlcyBzcGFjZXMs
IG5vdCB0YWJzIC0gaW4gY29udHJhc3QgdG8gTGludXguIEFuIGluZGVudA0KbGV2ZWwgY29uc2lz
dHMgb2YgZm91ciBzcGFjZXMuIENvZGUgd2l0aGluIGJsb2NrcyBpcyBpbmRlbnRlZCBieSBvbmUN
CmV4dHJhIGluZGVudCBsZXZlbC4NClsuLi5dDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQoNCkxhbmd1YWdlOiBDcHANCg0KLS0tDQpBcyB0aGUgY2xhbmct
Zm9ybWF0IGRvY3VtZW50YXRpb24gc2F5czogU2hvdWxkIGJlIHVzZWQgZm9yIEMsIEMrKy4NCg0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KU3RhbmRhcmQ6
IEMrKzAzDQoNCi0tLQ0KRnJvbSB0aGUgZG9jdW1lbnRhdGlvbjogUGFyc2UgYW5kIGZvcm1hdCBD
KysgY29uc3RydWN0cyBjb21wYXRpYmxlIHdpdGggdGhpcyBzdGFuZGFyZC4NCg0KVGhpcyB2YWx1
ZSBpcyB1c2VkIGFsc28gaW4gTGludXguDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQoNCkF0dHJpYnV0ZU1hY3JvczoNCiAgLSAnX19pbml0Jw0KICAtICdf
X2V4aXQnDQogIC0gJ19faW5pdGRhdGEnDQogIC0gJ19faW5pdGNvbnN0Jw0KICAtICdfX2luaXRj
b25zdHJlbCcNCiAgLSAnX19pbml0ZGF0YV9jZl9jbG9iYmVyJw0KICAtICdfX2luaXRjb25zdF9j
Zl9jbG9iYmVyJw0KICAtICdfX2h3ZG9tX2luaXQnDQogIC0gJ19faHdkb21faW5pdGRhdGEnDQog
IC0gJ19fbWF5YmVfdW51c2VkJw0KICAtICdfX3BhY2tlZCcNCiAgLSAnX19zdGRjYWxsJw0KICAt
ICdfX3ZmcF9hbGlnbmVkJw0KICAtICdfX2FsdF9jYWxsX21heWJlX2luaXRkYXRhJw0KICAtICdf
X2NhY2hlbGluZV9hbGlnbmVkJw0KICAtICdfX3JvX2FmdGVyX2luaXQnDQogIC0gJ2Fsd2F5c19p
bmxpbmUnDQogIC0gJ25vaW5saW5lJw0KICAtICdub3JldHVybicNCiAgLSAnX193ZWFrJw0KICAt
ICdfX2lubGluZV9fJw0KICAtICdfX2F0dHJpYnV0ZV9jb25zdF9fJw0KICAtICdfX3RyYW5zcGFy
ZW50X18nDQogIC0gJ19fdXNlZCcNCiAgLSAnX19tdXN0X2NoZWNrJw0KICAtICdfX2twcm9iZXMn
DQoNCi0tLQ0KQSB2ZWN0b3Igb2Ygc3RyaW5ncyB0aGF0IHNob3VsZCBiZSBpbnRlcnByZXRlZCBh
cyBhdHRyaWJ1dGVzL3F1YWxpZmllcnMgaW5zdGVhZCBvZiBpZGVudGlmaWVycy4NCknigJl2ZSB0
cmllZCB0byBsaXN0IGFsbCB0aGUgYXR0cmlidXRlcyBJ4oCZdmUgZm91bmQuDQoNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCk1hY3JvQmxvY2tCZWdpbjog
J15QTEFURk9STV9TVEFSVHxeRFRfREVWSUNFX1NUQVJUfF5BQ1BJX0RFVklDRV9TVEFSVCcNCg0K
TWFjcm9CbG9ja0VuZDogJ15QTEFURk9STV9FTkR8XkRUX0RFVklDRV9FTkR8XkFDUElfREVWSUNF
X0VOROKAmQ0KDQotLS0NClJlZ3VsYXIgZXhwcmVzc2lvbnMgdGhhdCBtYXRjaGVzIGJlZ2luIGFu
ZCBlbmQgb2YgYSBibG9jay4NCmUuZy4NCg0KUExBVEZPUk1fU1RBUlQocmNhcjIsICJSZW5lc2Fz
IFItQ2FyIEdlbjIiKQ0KLmNvbXBhdGlibGUgPSByY2FyMl9kdF9jb21wYXQsDQouY3B1X3VwID0g
Y3B1X3VwX3NlbmRfc2dpLA0KLnNtcF9pbml0ID0gcmNhcjJfc21wX2luaXQsDQpQTEFURk9STV9F
TkQNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KU3Rh
dGVtZW50TWFjcm9zOg0KICAtICdQUk9HUkVTUycNCiAgLSAnUFJPR1JFU1NfVkNQVScNCiAgLSAn
Yml0b3AnDQogIC0gJ2d1ZXN0X2JpdG9wJw0KICAtICd0ZXN0b3AnDQogIC0gJ2d1ZXN0X3Rlc3Rv
cCcNCiAgLSAnREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUnDQogIC0gJ19fREVGSU5FX1hFTl9HVUVT
VF9IQU5ETEUnDQogIC0gJ19fX0RFRklORV9YRU5fR1VFU1RfSEFORExFJw0KICAtICdwcmVzbXBf
aW5pdGNhbGwnDQogIC0gJ19faW5pdGNhbGwnDQogIC0gJ19fZXhpdGNhbGwnDQoNCi0tLQ0KQSB2
ZWN0b3Igb2YgbWFjcm9zIHRoYXQgc2hvdWxkIGJlIGludGVycHJldGVkIGFzIGNvbXBsZXRlIHN0
YXRlbWVudHMuDQpUeXBpY2FsIG1hY3JvcyBhcmUgZXhwcmVzc2lvbnMsIGFuZCByZXF1aXJlIGEg
c2VtaS1jb2xvbiB0byBiZSBhZGRlZDsgc29tZXRpbWVzIHRoaXMgaXMgbm90IHRoZSBjYXNlLCBh
bmQgdGhpcyBhbGxvd3MNCnRvIG1ha2UgY2xhbmctZm9ybWF0IGF3YXJlIG9mIHN1Y2ggY2FzZXMu
DQoNCldoaWxlIEkgd2FzIHdyaXRpbmcgdGhpcywgSeKAmXZlIGZvdW5kIHRoYXQgZnJvbSDigJhE
RUZJTkVfWEVOX0dVRVNUX0hBTkRMReKAmSB1bnRpbCB0aGUgZW5kIG9mIHRoZSBsaXN0LCBwcm9i
YWJseSBJDQpzaG91bGRu4oCZdCBsaXN0IHRoZXNlIGVudHJpZXMgYmVjYXVzZSBhbGwgb2YgdGhl
bSBlbmQgd2l0aCBzZW1pLWNvbG9uLg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KDQpUeXBlbmFtZU1hY3JvczoNCiAgLSAnWEVOX0dVRVNUX0hBTkRMRScN
CiAgLSAnWEVOX0dVRVNUX0hBTkRMRV82NCcNCiAgLSAnWEVOX0dVRVNUX0hBTkRMRV9QQVJBTScN
CiAgLSAnRUxGX0hBTkRMRV9ERUNMJw0KDQotLS0NCkEgdmVjdG9yIG9mIG1hY3JvcyB0aGF0IHNo
b3VsZCBiZSBpbnRlcnByZXRlZCBhcyB0eXBlIGRlY2xhcmF0aW9ucyBpbnN0ZWFkIG9mIGFzIGZ1
bmN0aW9uIGNhbGxzLg0KVGhlc2UgYXJlIGV4cGVjdGVkIHRvIGJlIG1hY3JvcyBvZiB0aGUgZm9y
bToNClNUQUNLX09GKC4uLikNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCg0KV2hpdGVzcGFjZVNlbnNpdGl2ZU1hY3JvczoNCiAgLSAnX19zdHJpbmdpZnkn
DQoNCi0tLQ0KQSB2ZWN0b3Igb2YgbWFjcm9zIHdoaWNoIGFyZSB3aGl0ZXNwYWNlLXNlbnNpdGl2
ZSBhbmQgc2hvdWxkIG5vdCBiZSB0b3VjaGVkLg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpPayB0aGlzIGlzIGl0IGZvciBub3csIGxldCBtZSBrbm93
IHlvdXIgdGhvdWdodHMgYWJvdXQgdGhlbSwgaWRlYWxseSBpZiBJIGRvbuKAmXQgZ2V0IGFueSBy
ZXBseSBpbiB0d28gd2Vla3MgKDIybmQgb2YgTm92ZW1iZXIpLA0KSSB3aWxsIGNvbnNpZGVyIHRo
YXQgd2UgaGF2ZSBhbiBhZ3JlZW1lbnQgb24gdGhlc2UgY29uZmlndXJhdGlvbi4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQoNCg0K

