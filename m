Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C19567FFE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361871.591641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zc0-00007X-F4; Wed, 06 Jul 2022 07:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361871.591641; Wed, 06 Jul 2022 07:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zc0-0008VE-9l; Wed, 06 Jul 2022 07:38:16 +0000
Received: by outflank-mailman (input) for mailman id 361871;
 Wed, 06 Jul 2022 07:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zV4-0004kS-Lv
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:31:06 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30066.outbound.protection.outlook.com [40.107.3.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 985978ef-fcfd-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 09:31:05 +0200 (CEST)
Received: from DB3PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:8:1::29) by
 AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:31:03 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::f3) by DB3PR06CA0016.outlook.office365.com
 (2603:10a6:8:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Wed, 6 Jul 2022 07:31:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:31:03 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Wed, 06 Jul 2022 07:31:03 +0000
Received: from 65e009a5c745.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA90A612-7718-4116-9470-D0F58085649A.1; 
 Wed, 06 Jul 2022 07:30:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 65e009a5c745.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:30:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5815.eurprd08.prod.outlook.com (2603:10a6:10:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 07:30:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:30:55 +0000
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
X-Inumbo-ID: 985978ef-fcfd-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cdGc9UiyHblvKunEJlXwXo1qGEv7FLDLFOi/u4XX13QuIcwWS71acpZT6NXKMd/10buQfBXHFUZS6ZZuMUHaMy63pawneHiFj/A9PwbyG84tViRHy5FcObjguGWjzM+go6pnMgnGJl2uJZgUseQsERcnSB+aMD28+F67gCDl1rKYyUUU6OHI61IUi1RrRQAPd56Wc4Xuqt3uUTdfwlbF95Mgvcqy3bD0w9BbUnzFmOs1vEXRXofhR69dkZhHNJe3ukjz75BlxVK/rUFUo8831jhuU+r4qibqTsKtIvMnGh47GIGqmWCL5WhRfOS5LH3s7VdAAryMZhMeMzqP4Dh2/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtvuUTHfMa9WQStmKLwcS73WtGEOGr1Z5Cx9umayByU=;
 b=lLGml07AncToljoiKFTKKqByT8hQJzQRxthO3NK96x1iGZFuSKPV8x2MIIebTB3MNd0oBcsoaB7aMzSZ5ILT5+sX/+ahUqihqG7OglurqQ/fZMX+Cw8Oa4BfP48EYIh+ksn2TiTk1n77vnJ4EIEjk/k2d+d9JVxjs3TgTvREVnIV5S5BYaKCeoYG6zA6VVjSOCD/bRxrsKXXirrrhn/ouaqV4hwEx8OTp3ZFVlsq7z7TQN2CX1pHh09We/IWg1N4kUR7yoxLp09mo5HbogGJ5G09vWhDuXfTodvq+w3jmDDrXQpNE7l1ESere29fuNrKVEr0HTFzIn9nTip+pKyzOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtvuUTHfMa9WQStmKLwcS73WtGEOGr1Z5Cx9umayByU=;
 b=oZ7SnARYR60nbp61Tpeb37YJd3FWdWxFY/1KBX+gfvTgOe0JwLzYrzuo/sSz7Sa7jNAW2k60GvdQain2KHB+Hlb2co5/trmX9N2sZlujEq8ekze0nVluOWKz9UZ6DR4uKlQy18TDja2SNVUynEt+V8r3L+wMtUi6l5BgAt20aBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFCSniWUxu9uz1v4ijp5b4QQeFDnuO7bc4JXg/vTDEHst9vp5lCcuDIOVkfMULkdg3LeW9dE3Dky1kqMlLq1SqVlSDNfOa/gyQtFZZgeZJ8mLbQHL4qrF0lsH016ohVPderfAHuOgsBOABnvILUsTer4oNVyLFniu6Rg+sRi47CyusAP+0tLSK1xtloGzUvVJm/mDGRSXtN3PACU8mP09dUWtb/63Lb1nWXNmeMLEb6/nrk/CBy3y48GpPKv+py09dMn5XYO2e/XRDD/5c5PRmhh5Uu+RY59agKrLMuzxJ/IXdbWaBfmNW2d1k1XRZghoiw1YUs/oKrqKNGYtxL1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtvuUTHfMa9WQStmKLwcS73WtGEOGr1Z5Cx9umayByU=;
 b=jGP1MPwprHcPEEBneVHIQcrK0Fh/GMRjIx6cv9e6MePW0vqiHT2uOXuUaO8wSCRYMleOHsKWzWl1E2Ai2BpgHJXULPsBf8y1JIsXmJG7TWCJBS5xhMj24GLNtL9vsBCl3MWD22gFxhbx87DmdmPactqgRCbWKRmf/VmGUCQwEPqWlZSel6tTKQVWyF3Qw+iJ4AC6r1SUxewPEEMkZa6+GqzSamH9S9ypJkoA4PKB71EiMCFN7ZW13ECMGEFqYJqmzhDyermf1rKULXdpUU2xtGyUdzuaxcBNo5T1vkf7/USK2UgLzU2CFS4dft9Z6izChwUUnOp6YMHci3ZWDEhzGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtvuUTHfMa9WQStmKLwcS73WtGEOGr1Z5Cx9umayByU=;
 b=oZ7SnARYR60nbp61Tpeb37YJd3FWdWxFY/1KBX+gfvTgOe0JwLzYrzuo/sSz7Sa7jNAW2k60GvdQain2KHB+Hlb2co5/trmX9N2sZlujEq8ekze0nVluOWKz9UZ6DR4uKlQy18TDja2SNVUynEt+V8r3L+wMtUi6l5BgAt20aBw=
From: Henry Wang <Henry.Wang@arm.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>, Connor Davis
	<connojdavis@gmail.com>
Subject: RE: [PATCH v1 00/10] Add Xue - console over USB 3 Debug Capability
Thread-Topic: [PATCH v1 00/10] Add Xue - console over USB 3 Debug Capability
Thread-Index: AQHYentnmjUfxWhyPUGA3lyI6tN6Lq1xG/NA
Date: Wed, 6 Jul 2022 07:30:55 +0000
Message-ID:
 <AS8PR08MB79919BC04235E0FFC352282C92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
In-Reply-To:
 <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 01004FA587B2BC4AAC14735FB8BDFDB4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c85e3f77-409c-4e38-1444-08da5f217b4b
x-ms-traffictypediagnostic:
	DBAPR08MB5815:EE_|DBAEUR03FT054:EE_|AM9PR08MB6258:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ap+RzDNYbmjmdXufgllTQ4Rtui9PLBieIBVoBQLEsoSYVjLrD8ntONtie0PtEGM4c0PhqG+VSA1zDIfeIEWHQIC6qOy0t3G4dKc2+IIzMout7ZkSmQ2xah76BhNFoSMjgVfiBAwdkfW7sL8yrJhbVSyfKS9hiHi9bL3ZY2mZ+GSVg6GzByvPsaxnjv8PDKdrMpdD/d49JVHjXV82/O5Ttn154S2JM0jIJMVZeoNVmlp8ZUK7W5bZwJkkYbuIx1D9DlSplBEa5CdtyJzBUuBVwKxXlqJD3wLW8K2w+5OHwO16YK89cnI5ydY+t3Xc+zrzj1rtiIop8cKt3dlshib+TUK70Ri0KpRq92EzNsBra4MfJf0wbu6RuUJoct/7KSsJ15cuZskPN9gHpwDaRwkPI0osvfTqd6lRgFej0qiqigSa8hzHU3enC0VYQjUU84rWmo+dgmuwOCTlPjSi3s4oxWjlEt8RP36doGcbrHlNwqjO9NVS5TcSiMUP92KDDnrqpSJc4939rztmmAIA8eENEeyJ1XWqxssUwtYUJ38GKfoKlz4TEeDYBDEj7tmbkidVNRimAxsCUXeOTlCr/ZqeFNRoDvQQwvJHoC45LwJ2O9y3+TebIZrOsOVcsrkeVENkmHzySeIOifjFsk3+yUJyNPCoCWN52TZLl7eIPr8Ep/ry8oGp3+VNxD9xUtB1u70QJv1YBRNzfDIVM36BKTkvs2MsW/IrcZzggZDxzyD5MzZ4vHfSIRs/xj9qVMYdRp7wQl7FKmlcjCB0dEwsgNhWhrfp6TeDAsZ9blEBtyJmbsIV6ckciQiUeG6uikRUkAJWyRsDRmCkthvdP0E+ADMVAg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(110136005)(966005)(478600001)(54906003)(41300700001)(71200400001)(7416002)(9686003)(55016003)(26005)(316002)(52536014)(122000001)(8936002)(5660300002)(38070700005)(86362001)(186003)(8676002)(66556008)(4326008)(66476007)(66446008)(64756008)(66946007)(66574015)(76116006)(38100700002)(7696005)(2906002)(6506007)(33656002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5815
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3000817-5999-4442-8fe0-08da5f217680
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3CwrCdqDBbxoKWiPTiZugTtg7pN2mkmiuh6EMvrMVJw+DKVPKWQFIlJezL0P6IbnWP05IEd3FbPKBUjjcPEHu+ku+2pk4sjjl6DRN8JZ4pRJDpDjNqRsf02Ae4L0xs1GDG3rQ/zFDYfpFe2oL4J/tc3t7ErTRd36ZjxG7y1KL1f+FylSSYMSNOi0gsZK1tp8Wgx15e7YcdA/T48WvKM8dDa5+1B5a4aEwkfVoc4bAUwa+VVIGGwQ+mAK9Uorc8DPyG37Yo0ygOtZ57Jq8XFExCirnvMMZR1UA29lX/4QFXv9IFYoluaNCW/smlqFDP8rNbqQKadd37ZuKNaM/IQSUg8fuqHtip0rJyR+C89CGLjnudHO7nmqIj+P6KF3C8Vw8zRvIvwrQ+ahsG8eK722vVF1lNPa8OWmXzR6+9a4khXwPCRQkmpflhvMr/VeqAb5IO+81pjk6yCUv+jq14iqlP1BN5a0kMfyUsMrZjBc7ve+NOlDLEvnPJHI913Nd5YYnfiTXFa7RbPll2SKIfeyxyLWNCSgr5m6DTDR/U2C8j9YMnRsjtNhT0Qd1KR9PXy8sAhsBGQ4k4Idf/txCzz27HGC/K2o598JJZ3tvazp2piX/krQ4dKMc5Owym5k4lJjtRT7f/ze/WgCnj26WnCjcECRMD4QyQUVzOYgVjY20Pa6C1GroL8oLTkXi0Pp66c3vYiyBA+cpnMHxQbQ3uRts53rNIWgiVVtXmSNY8EYJQM8uZBK+KEvRwFcf/cm8m4vErUleO2Pvb6FqdaCakOJ2mzSVBoz4GDWAGh8Mx4nbgaheK6xkZVAmhnCDJvJTjiBaxN+a88PicYsOFzop6miDw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(40470700004)(36840700001)(46966006)(82740400003)(356005)(82310400005)(41300700001)(83380400001)(54906003)(70206006)(8676002)(316002)(36860700001)(70586007)(4326008)(110136005)(81166007)(40460700003)(40480700001)(52536014)(55016003)(478600001)(26005)(186003)(7696005)(6506007)(8936002)(5660300002)(966005)(336012)(2906002)(66574015)(47076005)(86362001)(107886003)(33656002)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:31:03.3423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c85e3f77-409c-4e38-1444-08da5f217b4b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6258

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgaGFzIGJlZW4gc3RhbGUgZm9yIG1vcmUg
dGhhbiBhIG1vbnRoLCB3aXRoOg0KDQpQYXRjaCAjMSAjMiAjMyBuZWVkcyBhY3Rpb25zIGZyb20g
dGhlIGF1dGhvci4NClBhdGNoICM0IHJldmlld2VkLg0KUGF0Y2ggIzUgdG8gIzEwIG5lZWRzIGZl
ZWRiYWNrIGZyb20gbWFpbnRhaW5lcnMuDQoNClNvIHNlbmRpbmcgdGhpcyBlbWFpbCBhcyBhIGdl
bnRsZSByZW1pbmRlci4gVGhhbmtzIQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFtQQVRDSCB2MSAwMC8xMF0gQWRkIFh1
ZSAtIGNvbnNvbGUgb3ZlciBVU0IgMyBEZWJ1ZyBDYXBhYmlsaXR5DQo+IA0KPiBUaGlzIGlzIGlu
dGVncmF0aW9uIG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9jb25ub2pkL3h1ZSBpbnRvIG1haW5saW5l
IFhlbi4NCj4gVGhpcyBwYXRjaCBzZXJpZXMgaW5jbHVkZXMgc2V2ZXJhbCBwYXRjaGVzIHRoYXQg
SSBtYWRlIGluIHRoZSBwcm9jZXNzLCBzb21lDQo+IGFyZQ0KPiB2ZXJ5IGxvb3NlbHkgcmVsYXRl
ZC4NCj4gDQo+IFRoZSBkcml2ZXIgZGV2ZWxvcGVkIGJ5IENvbm5vciBzdXBwb3J0cyBvdXRwdXQt
b25seSBjb25zb2xlIHZpYSBVU0IzDQo+IGRlYnVnDQo+IGNhcGFiaWxpdHkuIFRoZSBjYXBhYmls
aXR5IGlzIGRlc2lnbmVkIHRvIG9wZXJhdGUgbW9zdGx5IGluZGVwZW5kZW50bHkgb2YNCj4gbm9y
bWFsIFhIQ0kgZHJpdmVyLCBzbyB0aGlzIHBhdGNoIHNlcmllcyBhbGxvd3MgZG9tMCB0byBkcml2
ZSBzdGFuZGFyZCBVU0IzDQo+IGNvbnRyb2xsZXIgcGFydCwgd2hpbGUgWGVuIHVzZXMgRGJDIGZv
ciBjb25zb2xlIG91dHB1dC4NCj4gDQo+IENoYW5nZXMgc2luY2UgUkZDOg0KPiAgLSBtb3ZlIHRo
ZSBkcml2ZXIgdG8geHVlLmMsIHJlbW92ZSBub24tWGVuIHBhcnRzLCByZW1vdmUgbm93IHVubmVl
ZGVkDQo+IGFic3RyYWN0aW9uDQo+ICAtIGFkanVzdCBmb3IgWGVuIGNvZGUgc3R5bGUNCj4gIC0g
YnVpbGQgZm9yIHg4NiBvbmx5DQo+ICAtIGRyb3AgcGF0Y2ggaGlkZGluZyB0aGUgZGV2aWNlIGZy
b20gZG9tMA0KPiANCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+DQo+IENjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQo+IENj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPg0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ2M6ICJSb2dlciBQYXUgTW9u
bsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IENjOiBQYXVsIER1cnJhbnQgPHBhdWxAeGVu
Lm9yZz4NCj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiBDYzogQ29u
bm9yIERhdmlzIDxjb25ub2pkYXZpc0BnbWFpbC5jb20+DQo+IA0KPiBDb25ub3IgRGF2aXMgKDEp
Og0KPiAgIGRyaXZlcnMvY2hhcjogQWRkIHN1cHBvcnQgZm9yIFh1ZSBVU0IzIGRlYnVnZ2VyDQo+
IA0KPiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgKDkpOg0KPiAgIHh1ZTogcmVzZXQgWEhD
SSBwb3J0cyB3aGVuIGluaXRpYWxpemluZyBkYmMNCj4gICB4dWU6IGFkZCBzdXBwb3J0IGZvciBz
ZWxlY3Rpbmcgc3BlY2lmaWMgeGhjaQ0KPiAgIGVoY2ktZGJncDogZml4IHNlbGVjdGluZyBuLXRo
IGVoY2kgY29udHJvbGxlcg0KPiAgIGNvbnNvbGU6IHN1cHBvcnQgbXVsdGlwbGUgc2VyaWFsIGNv
bnNvbGUgc2ltdWx0YW5lb3VzbHkNCj4gICBJT01NVTogYWRkIGNvbW1vbiBBUEkgZm9yIGRldmlj
ZSByZXNlcnZlZCBtZW1vcnkNCj4gICBJT01NVS9WVC1kOiB3aXJlIGNvbW1vbiBkZXZpY2UgcmVz
ZXJ2ZWQgbWVtb3J5IEFQSQ0KPiAgIElPTU1VL0FNRDogd2lyZSBjb21tb24gZGV2aWNlIHJlc2Vy
dmVkIG1lbW9yeSBBUEkNCj4gICB4dWU6IG1hcmsgRE1BIGJ1ZmZlcnMgYXMgcmVzZXJ2ZWQgZm9y
IHRoZSBkZXZpY2UNCj4gICB4dWU6IGFsbG93IGRyaXZpbmcgdGhlIHJlc3Qgb2YgWEhDSSBieSBh
IGRvbWFpbiB3aGlsZSBYZW4gdXNlcyBEYkMNCj4gDQo+ICBkb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MgICAgICAgIHwgICAgNSArLQ0KPiAgeGVuL2FyY2gveDg2L0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDEgKy0NCj4gIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9m
aXhtYXAuaCAgICAgICAgfCAgICA0ICstDQo+ICB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAg
ICAgICAgICAgICAgIHwgICAgMSArLQ0KPiAgeGVuL2RyaXZlcnMvY2hhci9LY29uZmlnICAgICAg
ICAgICAgICAgICB8ICAgIDcgKy0NCj4gIHhlbi9kcml2ZXJzL2NoYXIvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgfCAgICAxICstDQo+ICB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyAgICAgICAg
ICAgICAgIHwgICA1OCArLQ0KPiAgeGVuL2RyaXZlcnMvY2hhci9laGNpLWRiZ3AuYyAgICAgICAg
ICAgICB8ICAgIDIgKy0NCj4gIHhlbi9kcml2ZXJzL2NoYXIveHVlLmMgICAgICAgICAgICAgICAg
ICAgfCAxMDg5ICsrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL2lvbW11X2FjcGkuYyB8ICAgMTYgKy0NCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMgICAgICAgICAgfCAgIDQwICstDQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC92dGQvZG1hci5jICAgICAgIHwgIDIwMyArKy0tDQo+ICB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUu
aCAgICAgICAgICAgICAgICAgIHwgICAxMSArLQ0KPiAgeGVuL2luY2x1ZGUveGVuL3NlcmlhbC5o
ICAgICAgICAgICAgICAgICB8ICAgIDEgKy0NCj4gIDE0IGZpbGVzIGNoYW5nZWQsIDEzNDIgaW5z
ZXJ0aW9ucygrKSwgOTcgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2Ry
aXZlcnMvY2hhci94dWUuYw0KPiANCj4gYmFzZS1jb21taXQ6IDQ5ZGQ1MmZiMTMxMWRhZGFiMjlm
NjYzNGQwYmMxZjRjMDIyYzM1N2ENCj4gLS0NCj4gZ2l0LXNlcmllcyAwLjkuMQ0KDQo=

