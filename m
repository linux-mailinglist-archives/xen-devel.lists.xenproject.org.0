Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C0C7B2E54
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610397.949758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm97r-0001Iy-97; Fri, 29 Sep 2023 08:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610397.949758; Fri, 29 Sep 2023 08:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm97r-0001Gi-68; Fri, 29 Sep 2023 08:45:31 +0000
Received: by outflank-mailman (input) for mailman id 610397;
 Fri, 29 Sep 2023 08:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPTL=FN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qm97p-0001Eu-4Y
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:45:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8992c866-5ea4-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:45:27 +0200 (CEST)
Received: from DUZPR01CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::9) by GV1PR08MB7899.eurprd08.prod.outlook.com
 (2603:10a6:150:5e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 08:45:22 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::ec) by DUZPR01CA0070.outlook.office365.com
 (2603:10a6:10:3c2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 08:45:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.26 via Frontend Transport; Fri, 29 Sep 2023 08:45:21 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Fri, 29 Sep 2023 08:45:21 +0000
Received: from 7ef519e64068.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 434B119D-28A5-49EA-80FC-D819E277064C.1; 
 Fri, 29 Sep 2023 08:45:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ef519e64068.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:45:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9304.eurprd08.prod.outlook.com (2603:10a6:150:d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 08:45:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 08:45:11 +0000
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
X-Inumbo-ID: 8992c866-5ea4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX5jYifE4AR+XHJQejcaPs0cFsjITqj2JOSczgNhGLQ=;
 b=UgClp/ca9HNPOLxsPlU9qsmYPZWyaCo2cmwCzjxeVwm7tP6mpQL9K980t2isRRABkFd4F3gua3anuJCxjzEKjWf4beEtEaFXWhcURgzS8jLcMxSjqYLcIxyfFisHZZS5U7lOo7MSBD2TqhtZIrH30YLZjvOQZhCskpezstKtuw8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c0040a865715278
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D04UYkOqG147HGn3ZSpw58EJhAqvW8rpP2SYmooyXwYIz0WNe9LKRIXWE7OJ+8/amIa7dyTwF29dQhKygohF7a3JFL0LHBiIhIVJF/SvyJM8zTy/fASZBSoTMw2PNl5bMJAH1mE13CxFTI0bJHZJ3RxQ1u1wD/aPuEaj6xDwzQnq2e47/93M7WfheeVmtKS3RztnCu3C/oJxvIzROsl82A2Fc8vVAAQKzM/BsbcNnBddWN6vc2EsnA5TeWDxlcN4BoVBj4kMN0fFl/vGA11sz9ADpbyMdslY2uxNZMQIolbxO9bPY/q1+KpNH46JGJgt+d1FefRvSdAl5T1eQsF0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX5jYifE4AR+XHJQejcaPs0cFsjITqj2JOSczgNhGLQ=;
 b=OPt1nnVOVZ1quDuKfnSN0NgmYscJ8hqk55F49Qnwu1gJJbe8Es3RCW/U45jtgeHyRcGzSdlvjV07RZqWgMTGByaueWfWO1kVdPB0nhf67oCQ/be3JgfI+ikGz6W4OOBiKOWpJkR3HsJtwIcfaN0Ye0Y/oymzsWv7gugoP4kkoYx/KzKz1zKrUG1Evdoouz/5y8VjG463VSTjnZ9fZ5f0dDx5bUl3/rzNyrblL2zk2DQ5Y0SUK1bcnzOyEmAwVkgLgurGA/zI7FyWNVoNtYrFzbRsWBefXHuBsZgUqbc9A5OMtVEIZm6aiC75OViCX7jbMdcVsxCTMAGcsO9+ESchHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX5jYifE4AR+XHJQejcaPs0cFsjITqj2JOSczgNhGLQ=;
 b=UgClp/ca9HNPOLxsPlU9qsmYPZWyaCo2cmwCzjxeVwm7tP6mpQL9K980t2isRRABkFd4F3gua3anuJCxjzEKjWf4beEtEaFXWhcURgzS8jLcMxSjqYLcIxyfFisHZZS5U7lOo7MSBD2TqhtZIrH30YLZjvOQZhCskpezstKtuw8=
From: Henry Wang <Henry.Wang@arm.com>
To: "committers@xenproject.org" <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: Temporary commit moratorium for 4.18 RC1
Thread-Topic: Temporary commit moratorium for 4.18 RC1
Thread-Index: AQHZ8NWHieDtW3L/RkOX7PfWoLrW7rAxgMyA
Date: Fri, 29 Sep 2023 08:45:11 +0000
Message-ID: <63DD7E33-55A1-41BE-B2EA-FC8CFDEDBFA4@arm.com>
References:
 <AS8PR08MB799113F8D3EFDD9AC16DD88F92C3A@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB799113F8D3EFDD9AC16DD88F92C3A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9304:EE_|DBAEUR03FT061:EE_|GV1PR08MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 825b9504-a415-4151-128c-08dbc0c86a8c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xar/ufOcoALaP6ZncA+DJhCkJdUvTHO6PXCQ+FOt5rOtvaba13uYDpl/1lNosXhOEtxM1Ogykh+qxPKIFp3d0iVNRGfcq9Mjwon+r436SKHByIxPYBcrDqM6PcYxTHtjGSui2TooJiw0CgILCIJ37WG2GArOCxbZEKDLwZba72c5zwsf5QQ++qCRnmlF+ksYFEjFzjAnin78P/BsqE/aTFGp2IeAxqZig3tozJXgdjHwm3SS4SlTdJl+6rSerKvVqk/knsLe4BUTaCdZ2QdMAloHy2/ypoSjmQYpp12bybr8PZXfKk0IEYo95jmk5L8OKCxnSdjxKWavARgTkF3whhLKpyB39dqc2RLGz0GixoBcg14zPQNAasJQ6CAADL2ykj0/B8QnHHYlqeNNjY9MEtAtI6JsQf+HiGkUqhD5388Achh99wjUGNdtPgesyVXhrT0P+URjoMXz7FlZECiAEzSUUj+32rVwkJlnBS+23rtZ9jFsXvCs2hWE0Ep8GXb8hOE3uKjmKEpTgPGTm4UTEA+/FZPJQxGx0cLAizz68OY6cnCP67YF3GsW9KvBMsty/hP6THJ4SQskex9jUtPPgN9/ZK8z17+kn6pQDKHHlMUzQsdHie2r7tz3TfkwjiUXc2ndpp/KF4BnPbAcUXEFlQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(396003)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2616005)(66946007)(6486002)(26005)(6506007)(53546011)(6512007)(38100700002)(38070700005)(86362001)(36756003)(33656002)(122000001)(316002)(8676002)(8936002)(83380400001)(4326008)(41300700001)(5660300002)(66476007)(66446008)(54906003)(110136005)(91956017)(76116006)(4744005)(2906002)(64756008)(71200400001)(66556008)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2372F9D222557C49ADF135DED64244A9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9304
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52023760-e8e4-428b-8eb4-08dbc0c86499
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BNOVmEa/kkLbkAE0dwiq2LTcdcHaksqRAFu1N7SYJ5doPM2f+aa5jd0s6TPJmbbKLgZcWK1eHFGDvBJogJziZxKjga+WmX/8Yyltla5pMWtI7zO1vaiQa6KcVVbsbL7yzOc3I63ZGiFxuicoRE214uGtEm/xtABLWwtHmABZXyLQMi0Gzu+QVyrNxpbXHHYRk99Hm/MKchDMij7mglslUtY1WNzG6emyl3Wf5JvunAE67XKgIEDbdPV4YdQKFNRgT1Np7X1LahV3V9d0SQwRWNv4B10n0QQHnwexhUpB7QfaitWBvVAC06h9t3IMQR/owLJ3Fr5kiT5LO5Jq2CXV4sMN6nal1vrEolUhb9dr+0BMWYstNuLU9aOgf0DdwxlmObkAQMBmEW6/SiEOMZN12xOowO+aVGCF7XW8/90EZlG9BUAfMVKn4ybzGsVs+pEZ15tuXapLoCJ1ODDUw3HqsCoEUeEnoYctWPfJV3uF4o42h16pIru3VRL6d7enWCb9iCJMD3QbjwwOHDkceXZ13WWmFVituGOnPzpEyIXgk93oN8EnZfg/uBQM/WzlJzez9pHp+zxZtzBRqGQ7lFXdFX4kSumhh42k0EgRE0pk99dpuBLOn+uPXN0gCqEo2uuquz3pewCF5YMPnw4JWpAu/TDCPwAPZvATZv4qt4+sBM9BVWS+zLUhuzEp13DCTx7beghop7KEuEAmJj2p+YP7RGDzAOGtV/UWIDRtueR7grx75Ki7/7h0lT2cOcla2Oct
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(86362001)(2906002)(4744005)(478600001)(5660300002)(8676002)(4326008)(8936002)(41300700001)(316002)(54906003)(70586007)(70206006)(110136005)(40480700001)(33656002)(40460700003)(81166007)(82740400003)(356005)(6486002)(6512007)(36860700001)(53546011)(6506007)(2616005)(26005)(336012)(47076005)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:45:21.6614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 825b9504-a415-4151-128c-08dbc0c86a8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7899

Hi all,

> On Sep 27, 2023, at 08:10, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi committers,
>  We will be tagging the 4.18 RC1 on Fri Sep 29, 2023. In order to have en=
ough time
> for OSSTest to do the sync between staging and master, if there is any pa=
tch to be
> committed, please commit them by the morning of Thu Sep 28, 2023, EU time=
 and
> avoid committing to the staging until 4.18 RC1 is prepared. Thanks!

The 4.18 RC1 is now prepared, so the staging branch is re-opened.

I will send another email about temporary commit moratorium for RC2 when RC=
2
needs to be prepared. Thanks!

Kind regards,
Henry


>  Kind regards,
> Henry



