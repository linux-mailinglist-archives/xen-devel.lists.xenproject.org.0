Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD059D69C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391808.629778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQ89-0005bn-Bk; Tue, 23 Aug 2022 09:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391808.629778; Tue, 23 Aug 2022 09:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQ89-0005Z6-8m; Tue, 23 Aug 2022 09:23:29 +0000
Received: by outflank-mailman (input) for mailman id 391808;
 Tue, 23 Aug 2022 09:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxx3=Y3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQQ87-0005Z0-9K
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 09:23:27 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dab7c0b-22c5-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 11:23:26 +0200 (CEST)
Received: from AM6P193CA0100.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::41)
 by VI1PR08MB3710.eurprd08.prod.outlook.com (2603:10a6:803:c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 09:23:22 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::c5) by AM6P193CA0100.outlook.office365.com
 (2603:10a6:209:88::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 09:23:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 09:23:22 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Tue, 23 Aug 2022 09:23:21 +0000
Received: from 71eb19da907f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 944F328B-683D-49B5-BD05-F7694855383F.1; 
 Tue, 23 Aug 2022 09:23:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71eb19da907f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 09:23:14 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM5PR0801MB2019.eurprd08.prod.outlook.com (2603:10a6:203:4b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 09:23:12 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:23:12 +0000
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
X-Inumbo-ID: 3dab7c0b-22c5-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NlDuV0KQU3osurfkfL7uE0Y7Hi8CAQJ/9ipWvdU7Y9MYOwFgv9UgV4wEEKIsuyerbPZjKXdG+0scl4++wTrh55sIc+tmFOuei6XbX3vQvyp/aFhAfhyo1bIedXaN/ybP1ZFJ+V0JP9VUJtT0jbjGtYO1kiES9Sb8MAR/wr3DeHSnqCWhofUbbHh3jIcKi/EzgBLMcDozluSxSXjioLkGlyNzLKATfbsCGR2tV8ghwzjMB7/yx/rhZ+LI1giKyuwYt8JW7xDqaTevloPZDTfnxSRUKpT6/CBLVv2RbfBBN7k0pizwU8sdxARcmSqa62JyjwZDFF196SChW8L+PWhb/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXNyk0uak+sMNoqFZ/H1Ta7Ck8GLF1wWXmHUj9pspAM=;
 b=dmlF1bzSzn7QoK4DcZVKOGUgntE6ekax5v7Wbh1H6Y34EiF4t8zH79MH/GH1ND0FBUD4lKyCeZENFBtRqWeVnzUPQlx8EZbgg/lrPm2eU38U21uiULZhK/cwHvfkBMDsIfrK71N+8mHKPIVB0BlHAzroFuwSFt+F3WzIQndS48INSHG+KqHAuCMPdAQLHEetSKPHFOUSI/V6GfAzywQwTROeUMJHbTlBu9MyZxOWUV9d4WRwu/JHebS12PcpF7fuQek3rWXTX0rwOqzsxxpwdMHMFKLrUudbJ/ydaLpim04sdkMVDSGScsWkyxoOD1lyYx6gpw7+Q65DbHkQZEgEZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXNyk0uak+sMNoqFZ/H1Ta7Ck8GLF1wWXmHUj9pspAM=;
 b=uQA10lCNUPTEwgnOK11+SfRj2TrP2KNaSrRoqA6mWiWgTW4plBoXjECvHUsbRw3gw/SQ7tKUWyndqhNtTlqyXZMb9FwxLZ3wTfEunnJdqfUwFBlEpQzi1PkHchTOksUrn8kyvJcrnEyP8pdErlDEX4EDbwDDmm+7Rhw6DOZaVAE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a1e1d2a522bdb30
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORVk7bmJFvQFldwa4fe08l9CxSBAYODMQZ2Xv3qvlK+uBoMW0+JGAdB6v8689XkdrA4jYVe6PK9oRK9tHZLd3Fy2IfDKo6zch0BFcOKCu3mCLFby+exDRSm3uabZreMCjM1K4u4/gxP7ErS4Y3eymjP/vLsG/JvzlTgSKtm+vP6j2QDl2R6HuKOUr53DeR6ZpEtzJ0/HUup/NW3Mr/fgE8C201AFh/sJIlDcLUDIKM0c+emX9WKzbNgNx+UxMJMo63YyBhDEMBh9e8vqySQBQ7hYIfYZoSaedj6y9sReZxggrM44fyk2dCYRCxgPghIRm2oujYud0czTiXvKCGP68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXNyk0uak+sMNoqFZ/H1Ta7Ck8GLF1wWXmHUj9pspAM=;
 b=ltfbZOYjCUnAxrPuuYrwVUEGvq/2aLnZjUBsf5hxwywPMOscqlR6oG2Fhp59QvV8cDQytFAcc2od2FGO3twMq9+3KeErF+owKQDOuqYcQdeAH776y4iEd8xk7VonmAEukdoFnandNwxntDI7oFNZjjjfao1bSwDonCDqx9/3FgsGwhOh10uYIuOM2leuu4hm7KiRhzY02HF9hjlFgZwSV7OcMF50lD3hAiaeJTH5ZrdNV+n54iUjGzquVHMdQN2zq9afdOP59qkGxqrlU5pptX6HjTAkae0htSKQUI9U99m/ZpXKfMt/Y9rs/Kjx30oYn6VEnNHAMF+249Ud+TympA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXNyk0uak+sMNoqFZ/H1Ta7Ck8GLF1wWXmHUj9pspAM=;
 b=uQA10lCNUPTEwgnOK11+SfRj2TrP2KNaSrRoqA6mWiWgTW4plBoXjECvHUsbRw3gw/SQ7tKUWyndqhNtTlqyXZMb9FwxLZ3wTfEunnJdqfUwFBlEpQzi1PkHchTOksUrn8kyvJcrnEyP8pdErlDEX4EDbwDDmm+7Rhw6DOZaVAE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 4/7] xen/evtchn: modify evtchn_bind_interdomain to
 support static evtchn
Thread-Topic: [PATCH v2 4/7] xen/evtchn: modify evtchn_bind_interdomain to
 support static evtchn
Thread-Index: AQHYs7NTCp0JlYyBzkaD0R6ri3cXH628K9qAgAAQrQA=
Date: Tue, 23 Aug 2022 09:23:12 +0000
Message-ID: <098F71BB-DC43-43B2-8B18-81E365B6573D@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <abe4c5be55125eb3da33dbd187fd9b8ad5ace714.1660902588.git.rahul.singh@arm.com>
 <35a0b685-4c70-b9c0-0635-67e54e4315c7@xen.org>
In-Reply-To: <35a0b685-4c70-b9c0-0635-67e54e4315c7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 99f029b5-34d6-434e-b577-08da84e91fd8
x-ms-traffictypediagnostic:
	AM5PR0801MB2019:EE_|VE1EUR03FT021:EE_|VI1PR08MB3710:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ubgyOCynFVdwzqehDxOFF1gTTSfK5tvbT3mmnXxFDYi3fOz11HBAcbFLRvRDUUAJPtZA90olfteVczHjl/69qp85bwd2MQa3uAeHzk8WoMzGCpgNobDF3wgRAAFd0tDHmsAe11W9jd7PzrEMLMPw717vBj5dDjdohT5P8Vt7SvTGwVdlx87J/DVcE5Wds7dKiWVqUyGIug9tnAffKdPY/IvR7Fjh+PRu8oZyxJbqkW1yOXt/DjAr/k1OPbOzPmeGD50BpX2AIRkyWJdOj1RtSs7PXgeToJXEtJvv34gHU+xUi6kWIctYpzgtRHxWZ6fTzMwA6bx97s7PRJQCH11I8lXYv5Sz8I2i8NP5azd8Jlstev1OhU3Pg+bcdXM3S8Xi4lJpFPR7aEdJgIbLQ2RPU2TDxXg0KHh2TBqf2HHRdtNyOTPqvClI/3Nmtpaym4tnSelWQgLO2EdGKDzgAvD2A+edv/S1lxCcjR3L5JaJMGTV7+GzkuSRpjaIhWuCyrdyJGjjUISh58N6R4ytkudTi9fPEzkz1SjKapPmSf1tZjqrMDM3cWLHoNMG2yfMv7lczF+l5WPl0OAQ6eV9yf8ZGyMoRUdhwUrlLaHxGShVj3h7fkPCRBlI/cTdtroI8Jffw5bzCQNeKipdmacC5xQsOzn0ZJLatQnGNLhWyBYn5SJyFryvKgJ2Na+PQJNoXiL2gsDG/ToZFuPRhk8SvqrnHf3UvyR92BWN9DlxExY6gwMZFHuPFhD2Oyd2UnUlL8vN1CAr0JAwAeTNwkDd6201I1oXeWsSaQnzKodQ0PTYpOA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(53546011)(26005)(33656002)(86362001)(2906002)(6506007)(6512007)(8936002)(5660300002)(38070700005)(6486002)(478600001)(71200400001)(41300700001)(83380400001)(38100700002)(36756003)(122000001)(2616005)(186003)(66446008)(66556008)(66476007)(64756008)(54906003)(66946007)(316002)(6916009)(4326008)(8676002)(76116006)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <72CEAAC6B022C84795954CAE7BBC911B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2019
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0cf1d345-fc9b-414b-14cf-08da84e91a3a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vcc1emOsfrZqQeecLyInD3ZcyRpqPbd2l4KTAB4b1Bhb9IHaRQtF19BHQxrvWPamqS6FMqw9+qf+O7HNQe8lJ6AWxRNxVx7ZyMyLxj3qsCUvXXZVDL2ATqFZVPAnJAhWfH7KKlWWGNpsSPdQv4tyVsX3umBm4c8NiUOzRXsx0n6P/TldY+lNMcU2+iLE19DkP8KupUJAtJEo2WVqslEMtegT0N4ESrhvJgzrOMs3gWWm7CRVNjIkxh9j6rIVgnCpNHCv4jRvtisD4PqMhbFid0e/HmL8K4kfB59mMffoVid9DhzMP4aM5DWxft3FN9IXJ3TQ87Um+lagFVWN1BGf/UIaeBr03nUrDjuyCs/2rKhivmux1FitEcJxgatGz+YriYE7X+7muMpKXy/WQ+q6awn0yf55EB/9nkZNa2HMDDd2VPfgd7+VKtr9uJ1FAIhVY/TBdCaqwSV17x07VsC67Tuaha1tTAy5Rk4Ty+bMT8zaZKxw5NzdPejRYBxEzfZu8lr2Wy9DhxeKn4MufUIeMhQWdnl6CD/dav9SniC3D0MPKrxnf2tg+J2Eyg0EJvatHnde4+qmnxyO5A5o3V3D5WII3UmM4Vlqh951J/JR/CSeGlBKqKoFDnVGxqzVAJvRNFgL6Clf/Ur9BWytywEOdwoC4xZzyzznHAnWSLb+xQhdYqpRu7BCRPggB1s9TCSVsTFNknG2FVNARHsYfQgdp+4Nzx/KaeKWLl3zpoSW0Tw1Jj7giMclesPWFYzp4z8hTeHGMxKBbPpvl5ARMEn1Fw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(40470700004)(36840700001)(2906002)(54906003)(316002)(33656002)(82310400005)(6862004)(8936002)(5660300002)(36756003)(478600001)(6486002)(6506007)(40480700001)(41300700001)(6512007)(26005)(53546011)(81166007)(82740400003)(356005)(186003)(47076005)(2616005)(336012)(86362001)(36860700001)(70206006)(4326008)(8676002)(40460700003)(70586007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:23:22.1795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f029b5-34d6-434e-b577-08da84e91fd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3710

SGkgSnVsaWVuLA0KDQo+IE9uIDIzIEF1ZyAyMDIyLCBhdCA5OjIzIGFtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMTkvMDgv
MjAyMiAxMTowMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBTdGF0aWMgZXZlbnQgY2hhbm5lbCBz
dXBwb3J0IHdpbGwgYmUgYWRkZWQgZm9yIGRvbTBsZXNzIGRvbWFpbnMuIE1vZGlmeQ0KPj4gZXZ0
Y2huX2JpbmRfaW50ZXJkb21haW4gdG8gc3VwcG9ydCBzdGF0aWMgZXZ0Y2huLg0KPj4gSXQgaXMg
bmVjZXNzYXJ5IHRvIGhhdmUgYWNjZXNzIHRvIHRoZSBldnRjaG5fYmluZF9pbnRlcmRvbWFpbiBm
dW5jdGlvbg0KPj4gdG8gZG8gdGhhdCwgc28gbWFrZSBldnRjaG5fYmluZF9pbnRlcmRvbWFpbiBn
bG9iYWwgYW5kIGFsc28gbWFrZSBpdA0KPj4gX19tdXN0X2NoZWNrLg0KPj4gZXZ0Y2huX2JpbmRf
aW50ZXJkb21haW4oKSBhbHdheXMgYWxsb2NhdGVzIHRoZSBuZXh0IGF2YWlsYWJsZSBsb2NhbA0K
Pj4gcG9ydC4gU3RhdGljIGV2ZW50IGNoYW5uZWwgc3VwcG9ydCBmb3IgZG9tMGxlc3MgZG9tYWlu
cyByZXF1aXJlcw0KPj4gYWxsb2NhdGluZyBhIHNwZWNpZmllZCBwb3J0Lg0KPiANCj4gTklUOiBJ
IGZpcnN0IHJlYWQgdGhpcyBhcyB5b3UgYXJlIHRyeWluZyB0byBkZXNjcmliZSB3aGF0IHRoZSBw
YXRjaCBkb2VzLiBJIHdvdWxkIGFkZCAiY3VycmVudGx5IiwgImF0IHRoZSBtb21lbnQiIG9yIHNp
bWlsYXIgdG8gbWFrZSBjbGVhciB0aGlzIGlzIHRoZSBjdXJyZW50IGJlaGF2aW9yLg0KDQpBY2su
ICBJIHdpbGwgYWRkIOKAnGN1cnJlbnRseeKAnSBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPiANCj4+
IE1vZGlmeSB0aGUgZXZ0Y2huX2JpbmRfaW50ZXJkb21haW4gdG8NCj4+IGFjY2VwdCB0aGUgcG9y
dCBudW1iZXIgYXMgYW4gYXJndW1lbnQgYW5kIGFsbG9jYXRlIHRoZSBzcGVjaWZpZWQgcG9ydA0K
Pj4gaWYgYXZhaWxhYmxlLiBJZiB0aGUgcG9ydCBudW1iZXIgYXJndW1lbnQgaXMgemVybywgdGhl
IG5leHQgYXZhaWxhYmxlDQo+PiBwb3J0IHdpbGwgYmUgYWxsb2NhdGVkLg0KPj4gZXZ0Y2huX2Jp
bmRfaW50ZXJkb21haW4oKSBmaW5kcyB0aGUgbG9jYWwgZG9tYWluIGZyb20gImN1cnJlbnQtPmRv
bWFpbiINCj4+IHBvaW50ZXIuIGV2dGNobl9iaW5kX2ludGVyZG9tYWluKCkgd2lsbCBiZSBjYWxs
ZWQgZnJvbSB0aGUgWEVOIHRvIGNyZWF0ZQ0KPj4gc3RhdGljIGV2ZW50IGNoYW5uZWwgZHVyaW5n
IGRvbWFpbiBjcmVhdGlvbi4gImN1cnJlbnQiIHBvaW50ZXIgaXMgbm90DQo+PiB2YWxpZCBhdCB0
aGF0IHRpbWUsIHRoZXJlZm9yZSBtb2RpZnkgdGhlIGV2dGNobl9iaW5kX2ludGVyZG9tYWluKCkg
dG8NCj4+IHBhc3MgZG9tYWluIGFzIGFuIGFyZ3VtZW50Lg0KPiANCj4gRGl0dG8uDQoNCkFjay4g
DQogDQpSZWdhcmRzLA0KUmFodWw=

