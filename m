Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F51554EFD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354157.581207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o429z-0003Mi-T0; Wed, 22 Jun 2022 15:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354157.581207; Wed, 22 Jun 2022 15:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o429z-0003KL-Os; Wed, 22 Jun 2022 15:20:51 +0000
Received: by outflank-mailman (input) for mailman id 354157;
 Wed, 22 Jun 2022 15:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UqP7=W5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o429z-0003FD-3p
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:20:51 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00044.outbound.protection.outlook.com [40.107.0.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5bc8071-f23e-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 17:20:50 +0200 (CEST)
Received: from AS9PR06CA0367.eurprd06.prod.outlook.com (2603:10a6:20b:460::10)
 by AM4PR08MB2849.eurprd08.prod.outlook.com (2603:10a6:205:5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 15:20:47 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::5e) by AS9PR06CA0367.outlook.office365.com
 (2603:10a6:20b:460::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 22 Jun 2022 15:20:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 22 Jun 2022 15:20:47 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Wed, 22 Jun 2022 15:20:46 +0000
Received: from f7333ba6cae3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E62760A-8540-4E63-8B40-F0712CCBA213.1; 
 Wed, 22 Jun 2022 15:20:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7333ba6cae3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Jun 2022 15:20:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6813.eurprd08.prod.outlook.com (2603:10a6:102:15f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 22 Jun
 2022 15:20:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 15:20:38 +0000
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
X-Inumbo-ID: e5bc8071-f23e-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T1M0S/a5EkQ6O3NlMhHxRuUipc80cNfhk+6YopXS/Y4B8N0Jf47Y+XehCW0iZz2/vaaLtDtrH7z+FHcgaB8Y7IW4d9k05NeE8lkO5qY9jlMxCNVenF6fPXxcyk7s58gg04hVIpA/rxUd7Aoo17DIF9HUazxs3UAPA/KVc8EHA9x7vpUKUACgzydpJ/DRCAU/cAgQMUZwDAZtQxc/jrCtHvaatIBsq4nfDpjs7camHWLg489wWvDvyqae5ZUl0s6nBdMGzmHlSLLVVWYtPVq6ytHY8YEWESBRYFhDP/SxIKt0gshIiOzKDp/k87r9y/qnKhnkQ731uWfiuEyyM2L1Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vFoZcwbqI+NsiNNqicTnfXAr7FgcW/4VWjVFJkbny4=;
 b=No+CCVQMhBlDFh/b2bAZyUWuyvgin31pF3Qdq5+cv6GOnoO55owGWR7eNKQgeE5WKwF6viJwdKchevfCpDDZg9bHb41i0Jwc9RUQZ66HZHgWqm0wBeQs3D/ARZx/y8z3HM7AfoWvPwPSI1kuy/TW/BzuPyQjl1qXdayGJCS9HzU6B3N0/GX5oAVe3J/gwAi0qCHD7wwU7JOQIlAMzHuUjynFocDSwtMrHmL36GRpXos7FXMBEe23sdPS4nd6MxVCxV/lXJeeLJjy/bDj4dcNtnfEtOhRpCWv5qtXiQyPxWCCDI5+hAX31sPyWeHchqre2C7nw7BHak6uTY9FfISxxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vFoZcwbqI+NsiNNqicTnfXAr7FgcW/4VWjVFJkbny4=;
 b=0Avhmf1Z8eVggOCwqiRleTQaAtuR1cMCiyVeSE+UIhqsxF9RU9YL1X8IzTAfOMd/y5fe1W01qyIeUvGic19F8qzssbDa4Poie9cqm+2St7cX+3++mwkQq1/kn/yFUcZLFGCH/m4gab3fzkR5eae8Dde5lWFkMkiX7Svt42E5DFc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34f99f6d10c7afad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/wdRF+2A2bQloyCfDJpYY7NDBZSNhesKnQa75rmMTmlEVIkPNYrAJRXSrHiSdt8EET0jLXw4OIS9pMXqjKjvpXjeNI+CGMHATxa3Ie6ikS40g1T501As1lZDVNkkQmEXn8nP8VpLKNvqxR+EQ7It9T9wLqfjFYqa+L5mX7pYhlptawZEohV9ybBmtSnQb3mxHOPLbXoe8k8DgEJEAuzrb/WslFEkEXTnW8Qdgqf+NGg/X0cvNJ0ex8USYQixroapYxBSAToM0QjyS1xwMXRjCfAaKesOoYuM9Agm4Yc3JdqTC6p4EqtlYem74nx0wuNugRc03qHektTfOwn40PV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vFoZcwbqI+NsiNNqicTnfXAr7FgcW/4VWjVFJkbny4=;
 b=M85nIfgdwaTZAhE4veDdRSWLZSzXDYnFk24y4ZDlV/ut/rR7LgJiaOCQGOQsTXdVbQJMDplhargc9cOhGwvZIHLQWqs2kgrR+TnxL0b3/9yrhPa8fVd9SKyj84Mvi3YEQ6v8Q2znAYhk1/CdZ/J4dpTZPFASCQCNd2TdLAHmQNWYBv1sAWBfHBnCi0aKlsAAufboXg9XVfN0IbuEQso0DS+m1H599uWlwfizNnmvPKTr54GU4szu/yUFiXnEws9k5UwoeWOWD3RVMvt958raXRuoz8FJS2lOtWINob1+NXAXu4680DhV8O8PKpfQEjH9lbVvt59UpJv/gMxSXVpUjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vFoZcwbqI+NsiNNqicTnfXAr7FgcW/4VWjVFJkbny4=;
 b=0Avhmf1Z8eVggOCwqiRleTQaAtuR1cMCiyVeSE+UIhqsxF9RU9YL1X8IzTAfOMd/y5fe1W01qyIeUvGic19F8qzssbDa4Poie9cqm+2St7cX+3++mwkQq1/kn/yFUcZLFGCH/m4gab3fzkR5eae8Dde5lWFkMkiX7Svt42E5DFc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/3] xen/lib: list-sort: Fix MISRA C 2012 Rule 8.4
 violation
Thread-Topic: [PATCH 2/3] xen/lib: list-sort: Fix MISRA C 2012 Rule 8.4
 violation
Thread-Index: AQHYhksCTJ95E1G/9EC0Af/pOiohlq1biqoA
Date: Wed, 22 Jun 2022 15:20:38 +0000
Message-ID: <A8523E50-348E-45E9-B2D9-9C1A7C532E5B@arm.com>
References: <20220622151514.545850-1-burzalodowa@gmail.com>
 <20220622151514.545850-2-burzalodowa@gmail.com>
In-Reply-To: <20220622151514.545850-2-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 616a9e32-fbe0-40ea-db8c-08da5462c861
x-ms-traffictypediagnostic:
	PAXPR08MB6813:EE_|VE1EUR03FT010:EE_|AM4PR08MB2849:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2849DCCCA55B72725DDCAD6D9DB29@AM4PR08MB2849.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y3tJh5GS9145yaTu5MWi1x2MMKm0S1fRpdGmr5UUuftLfGtiyH5OtsWs9DBhDwKxQnKIMhw+YPBKngz2NaQV2wdMNwpsoqS9SIyi7B7XcuykNrHHM07Kp2NS16KJvdJkaGVbn66IaeuX5cRLmxdN8iza5RLzGQJ0fMlDLtTsW397QV55N/oMx3r9sw0uZuh4AK42baDCeoPoqkbrcteb/0XkrTfIWzc6PE1G1fTJYgIgc5ItLDX/xbE5u3ZXULJoMDQUy+YTc26kSfGJXnhMtEL7z3MHI2qS0843MymuoLLwXgKfH64VWPzpszYLt7CemyztLHAmZUtbT2rJAX64bYwyuSWAgfRk27cVpj+2XOB6yV9yWnCN+4ZlxEKP7jboU4ZdVDvlGRylO3z+y3q5xVnWCa2jUq/uOjdRCpNM/uqN7rimTiwjfcXHPzjfIPaKPr2uTID43kX8XADAdC/l/m7lfvYWxvAuHrZgBsfLcmDqyammSQ5rKiL7TIhv/xgohHXuMBSaGoD9Wrd3lTEFbHvar9nUh4VOKa/tFkDeeLYy93v5W1wd8GT6Qh8mn+LpP/s+pjqVEhSzaf1mE9qZJ46yDSLYiQEu78mM0MpAwT0Mxj9vi5/TjkrcAtrefFOSmYTlnrlOHFP6klT0u2ztXVkb9tfEY8AJorZ4sJE1jzpcXFewfcM2+VE9DJzonxQpjJRJVy1yxug8CF3pcneKJCtMRz2CBcYwQQCz5f2gEbSrSS0j4G2neTpqam2GTGz1SxlHVR79Mdt9KmdO9pwlijGoEL/+mu4RAG7PcG32VM4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(91956017)(4326008)(66476007)(66446008)(36756003)(38070700005)(66946007)(76116006)(66556008)(186003)(8676002)(71200400001)(64756008)(478600001)(8936002)(6486002)(316002)(6512007)(38100700002)(54906003)(4744005)(5660300002)(122000001)(6916009)(2616005)(41300700001)(6506007)(26005)(86362001)(53546011)(2906002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <609AF9D387FD454E8D18B910030570F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6813
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eb4033f4-d761-443c-0473-08da5462c375
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/CWzFMXepnqA83PG02LxNbdPDsTVwI7yrfZOSzHrwX/8QPDCVfgws7r8PprsgZ33g88Q1OMQRHNgbQLXM3wi1C5Tik1yswfZhSM2Got9gDVoBEQgoZNYt0yhNdQ2HxrNxhgsJaeM4dyGM7g0pBaVBHknksraHojQdzisdJSjGegCG8Ff3VFCQ9egzBO/dTJNauGsnbz/SppaUrcmq6zLn7XXkQdUwH6noR4vaY7KBWXbnwjaoPc6iDh5qB1YwKQuzsnRkB/07SpPkTDZ1hOIyY2cXgFbCeUapQ8kWxHo9NG6jV2I/qSDcZxHnBtMnmzc8ohe0wMTyzM/7HlUO+MUgTfVXr/CrKmqbgY7m3u6SaOiOfPzxHKvnAlWszOHrK4Qon8myNpr15KVwn0ZcmDIm/WTttFYSlEvQw/pmaKHYE33WiwOXtv5WHRv/k1FL2KgdXqSFiyYqdBw1pegcBrbeb3zpdcVdhb2fH/wy3C4x1n/jJTrr2qK3M0pBnFcI4srONLNtQoXzkNz+wWTn3moAJn2k9xBGWOgWwdkdvg78qlOEVLdh65NRh+F3dTuIbarESGceLW57gus+Ba/g01rfMHA1bzedOJn6CNpuhPFRDtyWtzL9hQIqr/iHnjSzUIDI4xCo7qxVrpGMf8gQb02VW7ntAmr9JFlLC1rXPzBbryCArl7vqgfHJ6KYxZhSyZIHccARSzeeDVT7386hoyhJshUVkBe74RCdQfdEIjHnnATEm09DbAAYN5BxlJq0ppSP4a2wcp6WIhv+4c/5pMxDA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(40470700004)(46966006)(36840700001)(4744005)(6506007)(186003)(5660300002)(2616005)(6512007)(82740400003)(40460700003)(356005)(82310400005)(36860700001)(33656002)(41300700001)(2906002)(86362001)(26005)(53546011)(316002)(70586007)(54906003)(40480700001)(70206006)(83380400001)(81166007)(47076005)(36756003)(478600001)(4326008)(8676002)(336012)(6862004)(8936002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 15:20:47.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 616a9e32-fbe0-40ea-db8c-08da5462c861
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2849

Hi Xenia,

> On 22 Jun 2022, at 16:15, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Include header <xen/list_sort.h> so that the declaration of the function
> list_sort(), which has external linkage, is visible before the function
> definition.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/lib/list-sort.c | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/lib/list-sort.c b/xen/lib/list-sort.c
> index f8d8bbf281..de1af2ef8b 100644
> --- a/xen/lib/list-sort.c
> +++ b/xen/lib/list-sort.c
> @@ -16,6 +16,7 @@
>  */
>=20
> #include <xen/list.h>
> +#include <xen/list_sort.h>
>=20
> #define MAX_LIST_LENGTH_BITS 20
>=20
> --=20
> 2.34.1
>=20
>=20


