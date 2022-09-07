Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA15B0148
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401106.642818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrwg-0006ro-8n; Wed, 07 Sep 2022 10:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401106.642818; Wed, 07 Sep 2022 10:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrwg-0006oC-4C; Wed, 07 Sep 2022 10:06:10 +0000
Received: by outflank-mailman (input) for mailman id 401106;
 Wed, 07 Sep 2022 10:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVrwe-0006fo-VS
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:06:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0b57135-2e94-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 12:06:07 +0200 (CEST)
Received: from DU2PR04CA0038.eurprd04.prod.outlook.com (2603:10a6:10:234::13)
 by PAXPR08MB7352.eurprd08.prod.outlook.com (2603:10a6:102:22a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Wed, 7 Sep
 2022 10:06:04 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::9b) by DU2PR04CA0038.outlook.office365.com
 (2603:10a6:10:234::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.13 via Frontend
 Transport; Wed, 7 Sep 2022 10:06:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 10:06:04 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 07 Sep 2022 10:06:04 +0000
Received: from 31369a1e4be1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF2928CC-C29A-48B5-8302-6C5C93348665.1; 
 Wed, 07 Sep 2022 10:05:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 31369a1e4be1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 10:05:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8305.eurprd08.prod.outlook.com (2603:10a6:150:a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Wed, 7 Sep
 2022 10:05:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 10:05:55 +0000
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
X-Inumbo-ID: b0b57135-2e94-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iUayeIxVujPz3j7pXrzCURi6Aqt01HdGq1DH5Lpf/C4RIcHQ8oBlMicCwVAqLzkr7cFSOFp0cFiLEVV/s3NuADg32dqrN1KLFc6uz2Z5tKGDNmp4uWBcQYJqJ5fbLbggB5OOCQWcdd23BT8me5ItZHxP9bOwWwEn2rt+QP4TVty3hXCfAB/nWnHcl+5LcoQ8C/AgJ07z9oZ5hfmvxmfmav3/4in0/fy+ErNwISvBY97aqGCw+kqx9qot5iMEJ6ZuIxkos+S6Yi3Ra1LbGilFuIdP/rUNwJ9jLp4cdv7+Fu5eVnecGVz+KvTYpGajgLFkJETQN7NIaO33nMsITjTcNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1c++8snHPM6G4uK3DDdgD6QKn838AAZMIC6ysONemz4=;
 b=dd1On4l8tPC5Gudu/kP457Qh/gjASAUnjQ4n9y8vZwzXaV8wfMtGoxnEJLy9J2/28RHxRGnUKe5jHygh9JBn/2YHkHdDc9/0fML9sOGNbtm4387Uo0kKk73LTNfOu+QP4zpHXqjIX1qlq/xgmBFc5KWriW/lgL7B8aMlOoolefu58jH4ntq2eoVgQGNWCD8Xrq6g8tMuhFI9moT47GlqdZgB2H04QUKao8fvEKRHuG0Gotymvy4puzMscDtdg2jzu3GGANfeZS2MYJgYzotRU6TRGUHfuBxXPLesWcEmORLimwrNT7EVtsFHb6L+zcdRRlOF3Fjp/FiUxasFzCancQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c++8snHPM6G4uK3DDdgD6QKn838AAZMIC6ysONemz4=;
 b=AguDbhipZOz7B/13eEg4r5sjL2Jb0uugHuD+wv77GuqtC4OKiDlKcGR5evqlT3KeptNuw0nWn+SYeOESKEvXN2Xo6+ofCN/2ncl/WAwfaG36d78OJXo6G2jR8eo2Nux7FyYZbT0QVGxQs18smPQ74K8If6IKxhE47e80mduFNq0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dec397dff9af23d0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4NQmpyllcC6pBqkMZhEs0QhEEr4v6GqIyuGQE/kwr6r7+qj0MU9z3PKZ0wPz7wtyGccXSm+t4QylyjMlkQWHGRxEHuRaGoWGmoa1jcEuuDqkLgevYUyHUtD4EmD4A+PVcLCHPiPGfb0rItIMGb8T0XJFJ30/Z0HsWUoPuP9fvnqvFFbEA+ZWkDtiemU1c0KizUkjyuxMfCk/C3m9bVEoAhCbQfVSTpCII57QC1GXCUqwKNqLlVmHRI5LFGxkjEDRuL8RHFt7gZDliacPg7qRQnkRAAhAez321FrUSVG7AQ7gGQ1CC0rzOj5ciBu0XA2Darp3Mg4wQ9JmkRYuQXxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1c++8snHPM6G4uK3DDdgD6QKn838AAZMIC6ysONemz4=;
 b=XpRtzRYNMSxbtmp5l9ywpKuWWWybmWh7Hq0DgOc0OKBelijC+8zvS06boy+PR3aeff61x3U5L66J82qVhFqtJM4R4ApJ6tF2lRl5y+ToYCp2SoGlLIZcceLUa+v3E1I+LkQzb44ze8Qsn+K5iaC5+gRkUDj422j6qX2a3zcMo8kTk27Fz5cpIWu6MP8ojm/b1tPePu5Wgxw9LxdRh1JslXjZ0CcL9Y65MH7Jhqyo3NptgDD4NLHJTbq9lmrnBhw4umv86zbZAV0a/N1EvHRyQoF8//Pd+qbYGyzgl3N1ZA8iulTYucicQhb0SgyCKK/BdknVStJzduiPn7Adf/RSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c++8snHPM6G4uK3DDdgD6QKn838AAZMIC6ysONemz4=;
 b=AguDbhipZOz7B/13eEg4r5sjL2Jb0uugHuD+wv77GuqtC4OKiDlKcGR5evqlT3KeptNuw0nWn+SYeOESKEvXN2Xo6+ofCN/2ncl/WAwfaG36d78OJXo6G2jR8eo2Nux7FyYZbT0QVGxQs18smPQ74K8If6IKxhE47e80mduFNq0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "leo.yan@linaro.org" <leo.yan@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Topic: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Index:
 AQHYweQzyVikzADCFE2Bfo+zYT5rgq3ToyoAgAABNgCAAAHYAIAABH8AgAAAyoCAAAC7AIAABHeAgAAOWQA=
Date: Wed, 7 Sep 2022 10:05:54 +0000
Message-ID: <524F3B92-5298-4BE3-864D-A076A8873800@arm.com>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
 <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
 <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
 <57d2eb45-bdbe-02b3-4ada-10ff278d699b@xen.org>
 <10E7EFB2-65A4-4092-9DC5-71825BC9595B@arm.com>
 <5ce7f63c-5ba5-f2cb-8e3e-f6dd2d9d76f7@suse.com>
In-Reply-To: <5ce7f63c-5ba5-f2cb-8e3e-f6dd2d9d76f7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 85e9acfc-895e-45f4-6b09-08da90b8934d
x-ms-traffictypediagnostic:
	GV1PR08MB8305:EE_|DBAEUR03FT057:EE_|PAXPR08MB7352:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tV0veYUT/pSGWlwIVLaWE5O6LbESm09thljyjAZ2D23D3LJrMtVX95afRrRptDr9QMuJc+LL4+BL9YDr6ujqK9LIE6trjt/okMwn+3lfQ1jT7D9SbaBhzsO9hUVAYpKYK9wFVB6+VoYyNObKK+eQ5sGTrGd9dtIOq8HELdadY1VbqIHBbj0dFD/fd5ux+cpWWIv9IHBZmu1896h0NwStWtl+UQWE37HAnWZps/0XrabXWjDp5crAfBjxOdJfAa5+aeNI94QHSIF2PC+d03VMOg81ya7sHwOZn83mRNybeIwAdNA+HbRd9E4MDo90TovJILmNWaDdRkr0z6EchyWNTqHY8By4T7YhPG/e7TxxFuX1W67guQbLSDPyesa75CFaE4XsgF9ObMHfDkB53ZYBOH/1tjm4InJxKffruUv3tfVWJcRRpi2vbC4obTqx2xs4j4CWI9LVo9rJGqWp+hBF4NtcBamGuAEpBvED5Z04tw/l90vZ/eItSEHnlgxRoeVVsb6Fx5K1i5LCR24Ngpfe8GXfxaJ/4mhDZArVIy1dIlVpNxa/gGl+dIT0+bKiFEKtizJ4FMfMxZGitg8ZJduvH5ek/cyNnV22Qtg+4OIq/DoNI63Xb6lEyydGMsPRHPNTuhIKULHxQgSx71yRLPStwGNJ0fpm75hz3Yb8v64WrPjM0gx8emjG2vlxQ/9PJh/KBdFCM2GHF4W+5GxpkFN7U0hQ9CpyGLChlXi9bfgGGo8ZqC2M6pJIZMHZieg6PTpiF84/rUtdT8kN6hYHVlbWmk+Ft5rLYd2Pj/qe1kQFsm8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(38070700005)(122000001)(64756008)(4326008)(66446008)(66946007)(66476007)(38100700002)(66556008)(54906003)(76116006)(6916009)(91956017)(8676002)(2906002)(316002)(5660300002)(53546011)(26005)(71200400001)(8936002)(186003)(2616005)(6486002)(6506007)(478600001)(41300700001)(33656002)(6512007)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F5E884284331047AD78C248BE41CEE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8305
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee9d2925-7266-4a56-706a-08da90b88d70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ITGGb7HIdztM/7fe7UTQ93GQWA2vNgWhh5FG2AI8SmAY6aUSNhGM03Y08X1JEIQafHCg5fv95cVjb0sDXKYQg8Dki0rbQ8DclAmSJDP16ja9P+b4WmzES1Gtkc79cKPO7EIzt3kKl9FNWXvnJIGb204kd5yU+g3UzlbL6hHqajKsIzMS/tDTKbQBGPOEsgYd+6f4ALa6RqQ00d0L6Zu5hD5n+JHlE0HtmABJ3npIMBqriZ/28Q2oSecJYkuo3p7PotTVKlCVxUoETXl/FGyif+dS9AlymnM+dWAwV7rjZPpSsnD2dbm8gXw2k4AjajUuPWJyjVA/EMfEdq9EtiJRiHskaqx1K/dovHNbLhvAV9GvK0aRYNuklxDr3YY786rWTS4UxjtV7VbKqkK6jWMmQgaK5P+wfcrLrq+cS+Czfr+cNEzgXJSWFxiqbXzw3ruvtrj9Pf3lfGw/REivTtUc3pP7EIUidmPy6z6MUeecnGhEhxIrt0KRGFw8u0kShm5B5ayTU7K7eGam0ZIHCF/vKy1Nd7T+fvm47tn+K6iA7nnoqrjFIah7dl0+DNzZf7470mB+zIUCVi9PY+QrQtlcNbF6431yQhG+86i92yKzhC8nf9XRByp3Kjnbfc7V+Uw7252kfrmuYSzj0XcPMqz9EYP60oV6ThKsSgTAM0wg+PP41ckQjEcru9tBgwBCQZQSfcTmKP/b0w2zGs0ilvnoyDXaSAbFtDbN0E/avHETps++BA7SVbs7O3iIgQ5sBGS8bsdOuFl1WUG+tzIg2SnAnw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(40470700004)(36840700001)(186003)(336012)(478600001)(47076005)(36860700001)(53546011)(6512007)(2616005)(6506007)(26005)(6486002)(2906002)(41300700001)(40460700003)(8936002)(5660300002)(70206006)(70586007)(86362001)(82310400005)(40480700001)(36756003)(8676002)(6862004)(4326008)(81166007)(33656002)(82740400003)(316002)(54906003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 10:06:04.6053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e9acfc-895e-45f4-6b09-08da90b8934d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7352

SGkgSmFuLA0KDQo+IE9uIDcgU2VwIDIwMjIsIGF0IDEwOjE0LCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDcuMDkuMjAyMiAxMDo1OCwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+PiBPbiA3IFNlcCAyMDIyLCBhdCAwOTo1NSwgSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gT24gMDcvMDkvMjAyMiAwOTo1MywgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+PiBPdGhlcndpc2UgaWYgd2Ugc3RhcnQgYWRkaW5nIHRo
b3NlIGtpbmRzIG9mIGNoZWNrcywgd2Ugd2lsbCBoYXZlIHRvIGFkZCB0aGVtIGluIGF0IGxlYXN0
IDMgcGxhY2VzIGluIHhlbiBjb2RlLg0KPj4+Pj4gDQo+Pj4+PiBUaGUgc29sdXRpb24gSSBwcm9w
b3NlZCBhYm92ZSBpcyBlYXN5IHRvIGltcGxlbWVudCByaWdodCBub3cuIE15IGd1dCBmZWVsaW5n
IGlzIHR3ZWFraW5nIF9fc3RyaW5naWZ5IChvciBlbHNlKSB3aWxsIHRha2UgYSBiaXQgbW9yZSB0
aW1lLg0KPj4+Pj4gDQo+Pj4+PiBJZiB5b3UgKG9yIExlbykgY2FuIGNvbWUgdXAgd2l0aCBhIHNv
bHV0aW9uIHF1aWNrbHkgdGhlbiBmaW5lLiBPdGhlcndpc2UsIEkgdGhpbmsgd2Ugc3RpbGwgd2Fu
dCBzb21lIGhhcmRlbmluZyBmb3IgYmFja3BvcnRpbmcgcHVycG9zZS4NCj4+Pj4gSSB0aGluayBh
IGRlZmluZSBpbiBjb21waWxlLmggdXNpbmcgc3RyaW5naWZ5IGlzIHRoZSBlYXNpZXN0IHNvbHV0
aW9uOg0KPj4+IA0KPj4+IEFoISBJIHRob3VnaHQgeW91IHdlcmUgc3VnZ2VzdGluZyB0byB0d2Vh
ayBfX3N0cmluZ2lmeS4gVGhpcyBpcyAuLi4NCj4+IA0KPj4gQWxzbyBwb3NzaWJsZSBidXQgYSBi
aXQgbW9yZSB0cmlja3kNCj4+IA0KPj4+PiAjZGVmaW5lIFhFTl9TVFJfVkVSU0lPTiAiX19zdHJp
bmdpZnkoWEVOX1ZFUlNJT04pIi4iX19zdHJpbmdpZnkoWEVOX1NVQlZFUlNJT04p4oCdDQo+PiAN
Cj4+IFF1b3RlcyBhdCBiZWdpbm5pbmcgYW5kIGVuZCBzaG91bGQgbm90IGJlIHRoZXJlLg0KPiAN
Cj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSBkaXNsaWtlIHRoZSBTVFIgaW5maXguIEknZCBwcmVm
ZXIgYSBzdWZmaXhlZCB2YXJpYW50DQo+IChlLmcuIFhFTl9WRVJTSU9OX1NUUklORykgb3Igb25l
IG9taXR0aW5nICJzdHJpbmciIGFsdG9nZXRoZXIsIGUuZy4NCj4gWEVOX0ZVTExfVkVSU0lPTiAo
YWxiZWl0IEkgc2VlICJmdWxsIiBhcyBiZWluZyBwb3RlbnRpYWxseSBhbWJpZ3VvdXMgaGVyZSwN
Cj4gc2luY2Ugb25lIG1pZ2h0IGV4cGVjdCB0aGF0IHRvIGluY2x1ZGUgWEVOX0VYVFJBVkVSU0lP
TiBhcyB3ZWxsIHRoZW4pLg0KDQoNClZlcnNpb24gaXMgYSB2YWx1ZSBzbyBoZXJlIEkgdGhvdWdo
IGl0IG1hZGUgc2Vuc2UgdG8gZGlzdGluZ3Vpc2ggdGhhdCBvbmUgYXMgaXQgaXMgYSBzdHJpbmcg
cmVwcmVzZW50YXRpb24gb2YgaXQuDQoNClhFTl9WRVJTSU9OX1NUUklORyBpcyBvayBJIHRoaW5r
Lg0KDQpJIGdlbmVyYWxseSBkaXNsaWtlIGFueXRoaW5nIG5hbWVkIEZVTEwsIEVYVFJBLCBCQVNF
IG9yIG90aGVyIHdoaWNoIGFyZSBqdXN0IHVuY2xlYXIuDQoNCkJlcnRyYW5kDQoNCj4gDQo+IEph
bg0KDQo=

