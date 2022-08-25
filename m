Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31815A0A75
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 09:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393083.631810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7TR-0002qH-1o; Thu, 25 Aug 2022 07:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393083.631810; Thu, 25 Aug 2022 07:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7TQ-0002nj-Up; Thu, 25 Aug 2022 07:40:20 +0000
Received: by outflank-mailman (input) for mailman id 393083;
 Thu, 25 Aug 2022 07:40:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9hs=Y5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oR7TP-0002nM-2G
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 07:40:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29f287fa-2449-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 09:40:17 +0200 (CEST)
Received: from DB7PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:52::39)
 by AM4PR08MB2643.eurprd08.prod.outlook.com (2603:10a6:205:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 07:40:08 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::31) by DB7PR02CA0026.outlook.office365.com
 (2603:10a6:10:52::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Thu, 25 Aug 2022 07:40:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 07:40:08 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 25 Aug 2022 07:40:08 +0000
Received: from b8d8d8c02ecd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC3F851C-5CF0-41F5-ADE5-97F042FACCB6.1; 
 Thu, 25 Aug 2022 07:39:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8d8d8c02ecd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Aug 2022 07:39:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR0802MB2509.eurprd08.prod.outlook.com (2603:10a6:800:b7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Thu, 25 Aug
 2022 07:39:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Thu, 25 Aug 2022
 07:39:54 +0000
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
X-Inumbo-ID: 29f287fa-2449-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mmOUK54y23vRBi0TmJSjHMTTfLWYLfFKHBpxJxqQzLXYfw65jH90+u9XC0y7vXMPr5GJWFD2n2a+CnCHt/t5VYJpCaRjFFzE/0/pNl7wx3ajoIUO5KJiwzIRPmfMOY89hzFofr0d/XYEHMOOWvvoD+R+DXfP4N+Vj8/84rmp7dLJOlATXW54XDGb28jRevsgGkWP0F7vRxA4BFSL6cw7WtX9ofRrJZoaIbhlo2xWeJXxJRUi80hSke/jjQekN9eVYXbzq2Cn+f28NI9scoOX+UUhflc5rqVUzXBnvtlQC3GAPxFPOTNxD0P9MbWO2rxqymkCZ7YYnx0SlYLCNLwBQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tjVRQOdm17mtgT+xDzAWMwGlC4HBPkOmQspog7aYTI=;
 b=RXheFQf1DrjY6vTNuoIh5yCPH7THEJZnQHtH7BrHQv2ToE8wXnhMTHbGqnFC+/G4EREuk6p4ocnJbqkTqzHcCR5nbuwz6H4pWlnyrBNYI9Je4yakwJ8ly1U4T19DMhQrGhzRs8DsvDIPPbRNQ4/TopNY1mYOdlLBEsH+kfBTmFd/fmaeyMjlXGDJZc2dAC6uRbkhXfjQBqEHUVFHjZHt7WmfCPlfkuvg++3iP2c2I8+hE4etWl56wSm3G9vCml8ROjun5HTx8XuVYW38y2Gh6nKukywX4VG7FfCGkVc6BKpNfMjtH/frdqEjSpVrfc6uKib4pUCuzYxUnUJwtRwiMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tjVRQOdm17mtgT+xDzAWMwGlC4HBPkOmQspog7aYTI=;
 b=T6nB+VeyGt4pQKxuuRrrdE3/8ysgSvlw39NIBiblC3jH+RQGhWHr03rq5bTZ91tjS6UP4aZQ2TSUnSOEzfg5bCdXmqcjoVhzbV50FHVf39SoJEdoLwlbBcXp/JXQyzJFNiSuyV5sG4Vx7AzXslJnGFsM+JVH46YTWRXbPtmUiRg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eaba17f8f8fae1a0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BunVZBNFbMv/i7ivSD3dsJXF7gUemKGPPqfKTa3e1HuLMYNOjFnBlf+vBGPmJeFnG7QFUikA+oqfQ3IMpy4pwMh+Fvi14oXAzYWo9t2c5n4b7hFH7eLDEheLvqZvSGA/PGa4/bS1U9BhkfNWduds0IO2/dXjMce+dYj2JWKrQC5j50nhs6dE64UtijLSSDOm0FP+N2DMYRxIqWevSRrcoSWYdo6szRdcomU/xPvNcYCx20IgWvkzTpNPpQW/VP74EnuDpnljLCSSOakL8K/q9CuDuXHlOh01McyctcpZOS6o9tuU6Jfvrtja38QJpEGJ5+Q+jZqzhICJ4LiQHfzRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tjVRQOdm17mtgT+xDzAWMwGlC4HBPkOmQspog7aYTI=;
 b=n975dy9HwMd4axxxQNURZnBLgl+HZVaiXxMNY3O8bkDpKi7nBQ4dl7Hqo2uDFiXbvTv4vfnOqlRQPD/pexUzHQ3UY5BqO7KQ2rZsWN9n2+PTA48Ve5lG8ssgFVaGZdRIB73YLmawvtKOuMy4McKQNwGdGLWQiIetwuEhp7tG5Ks7MUGPTBUKoTG6eurrxvR9LztI44FWwUgEpNrfXEyRztVuDZwFlkkvR4hRkxm6LhZnEZfmi+OGXWwwMFJXR2AHlcOfmgAF8S/GX//vL37mQlFB4TPTIKp1DnnJAaXoVe/JWYZJXu84RTSC4KMWaf8ADOcjF74WMO+oeNPg4td1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tjVRQOdm17mtgT+xDzAWMwGlC4HBPkOmQspog7aYTI=;
 b=T6nB+VeyGt4pQKxuuRrrdE3/8ysgSvlw39NIBiblC3jH+RQGhWHr03rq5bTZ91tjS6UP4aZQ2TSUnSOEzfg5bCdXmqcjoVhzbV50FHVf39SoJEdoLwlbBcXp/JXQyzJFNiSuyV5sG4Vx7AzXslJnGFsM+JVH46YTWRXbPtmUiRg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
	xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYs7NVsywB9ZS1YkG+gj2FUNdLeq28SEyAgAG2wYCAAAw/gIAAHKuAgAAPTYCAABB2AIAAWmwAgAAL9QCAACl/gIAAbLmA
Date: Thu, 25 Aug 2022 07:39:54 +0000
Message-ID: <646CFFC2-9259-45C8-89AB-D59AA5B0DBC1@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
 <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
 <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
 <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org>
 <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com>
 <alpine.DEB.2.22.394.2208241439220.15247@ubuntu-linux-20-04-desktop>
 <da07bb5d-98c3-9c94-a1f0-6021e398f898@xen.org>
 <alpine.DEB.2.22.394.2208241810390.15247@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208241810390.15247@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c6638358-e31a-44c5-0f25-08da866d08f5
x-ms-traffictypediagnostic:
	VI1PR0802MB2509:EE_|DBAEUR03FT029:EE_|AM4PR08MB2643:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oN/fGcDmhqQyPQt+RTnWO2e5sPfD4PcDCGf1N5DG9+w+UNolpkhY/KqncOEDfaLpjsE8XwZCXNmrUVIBjOxPuxWU0hkAD+yuEEqjWGHJKzND9P4QEaHO+Ot0N2e4y6CAMMBmFZPXsAjwlxsVpo8YX02epgq3HY+HgNPnDiFA30gq6VBWuyI+2YMpl2V4MMvdszfg+J/i9vx0xjlpTLltfAtbrqP0OvbLxIZc7vjdQHmOkzjMv+SriChyXrZqKkd3h7XJUua+pnuxcJRnjRdCt23ZmE7K7aK5AbwJJ4uaimXqmM+4A65C7rfBPuX8nqRVN3huEVIkcCq5+JqglHYsjkYoFwhldPhY4pZOIsInFL9FRQinPnJGWUbEGb3RYkjKtx4r1U7pIREtSygnW7QorT7VInpYvpcuXvWegIuvkdsq1kKYoIeQDpxOBiH+Ny/Bi1F8t1oRYNAiwYq/D6O6KJx3WqITQAH1u86vkabqRbwAC1XexuAmsCZhEY6zBtCSgMERpRvhyrltDd2O/FTXqNrV6S1HIYCkpmXJ7CyxVMBH+jnNDgFhRHeL00GZcOorh7I10F1PUwU426ICwbx7YiJEtBCXD+8E7FQASnkgQTIcKVquW+/VF0zy+zcZ/f8CmL8dJJ9UeK67y2cDT/vcUXP0/+DtUbUACZVoNvuAkJVwce2ROQ00rk/0E8FXz4mNwxA2/4qWhk9LpVR955KFFFPxKPcQ5e2WukZ9b6SBIS5R4Pcq9Ve+uO60HpiFZVF2aCHmkcyeXQMjFl203GCuRduSdpWt2CDxxS/WjXo/UuY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(38070700005)(2906002)(53546011)(478600001)(122000001)(6486002)(66476007)(316002)(91956017)(6916009)(26005)(4326008)(6512007)(66556008)(66446008)(33656002)(64756008)(66946007)(8676002)(76116006)(83380400001)(41300700001)(36756003)(186003)(38100700002)(6506007)(86362001)(8936002)(54906003)(2616005)(71200400001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C450A6B7C7B151429CD07D139B105471@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2509
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eddcf5ea-0341-423f-076d-08da866d00be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6nxmGL2UFT3pNHjrTSK2ImqYJp4Q1Q+gHLpapJ62uqDOiL5H5AKBBqudTyXYvkSJB2GvkRi62xLEzeUSYA9FKWe1BL+AtrM1oiipJFjflBzas/VB2jChOUUWBUTalk9dl3wvxSV0ExuzfvLvGwkwALEXxl9GsTGJgndDF2I1raONodkTPJVXl8JK7i+P8NKXdPNKjauZH9SZH3a8X2f9BXASihjZ1dlvnSSbvMnh41Kwu48yNCcKMpnuIzmkHVkM9gGNbcwrQxGN81nAI5n7I4rQybat/ERqZd/qn7n06TsWYIOqgVJYtZdpUDaihNW3WY8YTf5I139aa9JkGS1vfAILdL71H/wJgTHNQyFEfl0WFIy8ZpNt/vnx+FHfrlxAnHFBrGdaMofsn8ygWKZ7gE/qfI9gxLvlV5OtRlkgg9CJZzWFhSkvqU9u5WqQnwJOpoJouQB4v5Retd53f+oIeI3vcPZbN6YTN2Dve1tqQKRkgp7/IImc5R4tomWeYzAwE1yySq56WgG4fCcDrxmDCJsIH569Sb4UoNMALuynkV3sep2xkaJ77NUfbvYvstLPurMzAaplXrEkwqN1mQXrlCt0d47GE3wcTPiG8gPlKS7X1xDWgP1M3o8gS0n7pJX5I+jSDrJMfuvRk12vNSU2kjyyknJHkKGDO+2oQnehTb6g1XArtgCVUg7WgebIBhPYS8kxc1WxENoUn6OyQc5DFNOtdPhm/bF/XtpUHonB/w3YSgcfvOcMWWRWyqW08FipSt8fpbMtWiJnDyqOZwFVHQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(40470700004)(36840700001)(33656002)(70586007)(2616005)(6486002)(6862004)(4326008)(83380400001)(70206006)(478600001)(81166007)(8936002)(8676002)(26005)(82740400003)(5660300002)(6506007)(186003)(336012)(82310400005)(54906003)(6512007)(107886003)(356005)(2906002)(53546011)(86362001)(47076005)(36756003)(36860700001)(41300700001)(40480700001)(40460700003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 07:40:08.6025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6638358-e31a-44c5-0f25-08da866d08f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2643

SGksDQoNCj4gT24gMjUgQXVnIDIwMjIsIGF0IDAyOjEwLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAyNCBBdWcgMjAyMiwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gT24gMjQvMDgvMjAyMiAyMjo1OSwgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOg0KPj4+IE9uIFdlZCwgMjQgQXVnIDIwMjIsIFJhaHVsIFNpbmdoIHdyb3Rl
Og0KPj4+Pj4gT24gMjQgQXVnIDIwMjIsIGF0IDQ6MzYgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4gT24gMjQvMDgvMjAyMiAxNTo0MiwgUmFodWwgU2luZ2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDI0IEF1ZyAyMDIyLCBhdCAxOjU5IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+Pj4+PiANCj4+
Pj4+Pj4gT24gMjQvMDgvMjAyMiAxMzoxNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+PiBI
aSBKdWxpZW4sDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBIaSBSYWh1bCwNCj4+Pj4+Pj4gDQo+Pj4+Pj4+
PiBQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB2aWV3IG9uIHRoaXMuDQo+Pj4+Pj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+Pj4+PiBiL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYw0KPj4+Pj4+Pj4gaW5kZXggYmZlN2JjNmIzNi4uYTFlMjNlZWU1OSAx
MDA2NDQNCj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+Pj4+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+Pj4+PiBAQCAtMzU2Miwx
MiArMzU2Miw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21VKHN0cnVjdA0KPj4+
Pj4+Pj4gZG9tYWluICpkLA0KPj4+Pj4+Pj4gICAgaWYgKCByYyA9PSAtRUlMU0VRIHx8DQo+Pj4+
Pj4+PiAgICAgIHJjID09IC1FTk9EQVRBIHx8DQo+Pj4+Pj4+PiAgICAgIChyYyA9PSAwICYmICFz
dHJjbXAoZG9tMGxlc3NfZW5oYW5jZWQsIOKAnGVuYWJsZWTigJ0pKSApDQo+Pj4+Pj4+PiAtICB7
DQo+Pj4+Pj4+PiAtICAgIGlmICggaGFyZHdhcmVfZG9tYWluICkNCj4+Pj4+Pj4+ICAgICAgICBr
aW5mby5kb20wbGVzc19lbmhhbmNlZCA9IHRydWU7DQo+Pj4+Pj4+PiAtICAgIGVsc2UNCj4+Pj4+
Pj4+IC0gICAgICBwYW5pYyjigJxUcmllZCB0byB1c2UgeGVuLGVuaGFuY2VkIHdpdGhvdXQgZG9t
MFxu4oCdKTsNCj4+Pj4+Pj4+IC0gIH0NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFlvdSBjYW4ndCB1c2Ug
InhlbixlbmhhbmNlZCIgd2l0aG91dCBkb20wLiBJbiBmYWN0LCB5b3Ugd2lsbCBlbmQgdXANCj4+
Pj4+Pj4gdG8gZGVyZWZlcmVuY2UgTlVMTCBpbiBhbGxvY194ZW5zdG9yZV9ldnRjaG4oKS4gVGhh
dCdzIGJlY2F1c2UNCj4+Pj4+Pj4gInhlbixlbmhhbmNlZCIgbWVhbnMgdGhlIGRvbWFpbiB3aWxs
IGJlIGFibGUgdG8gdXNlIFhlbnN0b3JlZC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IE5vdyBpZiB5b3Ug
d2FudCB0byBzdXBwb3J0IHlvdXIgZmVhdHVyZSB3aXRob3V0IGEgZG9tMC4gVGhlbiBJIHRoaW5r
DQo+Pj4+Pj4+IHdlIHdhbnQgdG8gaW50cm9kdWNlIGFuIG9wdGlvbiB3aGljaCB3b3VsZCBiZSB0
aGUgc2FtZSBhcw0KPj4+Pj4+PiAieGVuLGVuaGFuY2VkIiBidXQgZG9lc24ndCBleHBvc2UgWGVu
c3RvcmVkLg0KPj4+Pj4+IElmIHdlIG1vZGlmeSB0aGUgcGF0Y2ggYXMgYmVsb3cgd2UgY2FuIHVz
ZSB0aGUgInhlbixlbmhhbmNlZCIgZm9yDQo+Pj4+Pj4gZG9tVXMgd2l0aG91dCBkb20wLg0KPj4+
Pj4+IEkgdGVzdGVkIHRoZSBwYXRjaCBhbmQgaXRzIHdvcmtzIGZpbmUuIERvIHlvdSBzZWUgYW55
IGlzc3VlIHdpdGggdGhpcw0KPj4+Pj4+IGFwcHJvYWNoPw0KPj4+Pj4gDQo+Pj4+PiBZZXMuIEZv
ciB0d28gcmVhc29uczoNCj4+Pj4+IDEpIEl0IGlzIG11ZGR5aW5nIHRoZSBtZWFuaW5nIG9mICJ4
ZW4sZW5oYW5jZWQiLiBJbiBwYXJ0aWN1bGFyIGEgdXNlcg0KPj4+Pj4gbWF5IG5vdCByZWFsaXpl
IHRoYXQgWGVuc3RvcmUgaXMgbm90IGF2YWlsYWJsZSBpZiBkb20wIGlzIG5vdCBwcmVzZW50Lg0K
Pj4+Pj4gMikgSXQgd291bGQgYmUgbW9yZSBjb21wbGljYXRlZCB0byBoYW5kbGUgdGhlIGNhc2Ug
d2hlcmUgWGVuc3RvcmVkIGxpdmVzDQo+Pj4+PiBpbiBhIG5vbi1kb20wIGRvbWFpbi4gSSBhbSBu
b3QgYXdhcmUgb2YgYW55b25lIHdhbnRpbmcgdGhpcyBvbiBBcm0geWV0LA0KPj4+Pj4gYnV0IEkg
ZG9uJ3Qgd2FudCB0byBjbG9zZSB0aGUgZG9vci4NCj4+Pj4+IA0KPj4+Pj4gU28gaWYgeW91IHdh
bnQgdG8gc3VwcG9ydCBjcmVhdGUgInhlbix4ZW4iIHdpdGhvdXQgYWxsIHRoZSByZXN0LiBUaGVu
IEkNCj4+Pj4+IHRoaW5rIHdlIG5lZWQgYSBkaWZmZXJlbnQgcHJvcGVydHkgdmFsdWUuIEkgZG9u
J3QgaGF2ZSBhIGdvb2Qgc3VnZ2VzdGlvbg0KPj4+Pj4gZm9yIHRoZSBuYW1lLg0KPj4+PiANCj4+
Pj4gSXMgdGhhdCBva2F5IGlmIHdlIHVzZSB0aGUgZWFybGllciBhcHByb2FjaCwgd2hlbiB1c2Vy
IHNldCAgInhlbixlbmhhbmNlZA0KPj4+PiA9IGV2dGNobuKAnSB3ZSB3aWxsIG5vdCBjYWxsIGFs
bG9jX3hlbnN0b3JlX2V2dGNobigpDQo+Pj4+IGJ1dCB3ZSBjcmVhdGUgaHlwZXJ2aXNvciBub2Rl
IHdpdGggYWxsIGZpZWxkcy4NCj4+PiANCj4+PiBUaGlua2luZyBtb3JlIGFib3V0IHRoaXMsIHRv
ZGF5IHhlbixlbmhhbmNlZCBoYXMgdGhlIGltcGxpY2F0aW9uIHRoYXQ6DQo+Pj4gDQo+Pj4gLSB0
aGUgZ3Vlc3Qgd2lsbCBnZXQgYSByZWd1bGFyIGFuZCBjb21wbGV0ZSAieGVuLHhlbiIgbm9kZSBp
biBkZXZpY2UgdHJlZQ0KPj4+IC0geGVuc3RvcmUgYW5kIFBWIGRyaXZlcnMgd2lsbCBiZSBhdmFp
bGFibGUgKGZ1bGwgWGVuIGludGVyZmFjZXMgc3VwcG9ydCkNCj4+PiANCj4+PiBXZSBkb24ndCBu
ZWNlc3NhcmVseSBpbXBseSB0aGF0IGRvbTAgaXMgcmVxdWlyZWQgKGZyb20gYSBkb21VIHBvaW50
IG9mDQo+Pj4gdmlldykgYnV0IHdlIGRvIGltcGx5IHRoYXQgeGVuc3RvcmUrZXZ0Y2huK2dudHRh
YiB3aWxsIGJlIGF2YWlsYWJsZSB0bw0KPj4+IHRoZSBkb21VLg0KPj4+IA0KPj4+IE5vdywgc3Rh
dGljIGV2ZW50IGNoYW5uZWxzIGFyZSBkaWZmZXJlbnQuIFRoZXkgZG9uJ3QgcmVxdWlyZSB4ZW5z
dG9yZQ0KPj4+IGFuZCB0aGV5IGRvbid0IHJlcXVpcmUgZ250dGFiLg0KPj4+IA0KPj4+IEl0IGlz
IGFzIGlmIHRoZSBjdXJyZW50IHhlbixlbmhhbmNlZCBub2RlIGFjdHVhbGx5IG1lYW50Og0KPj4+
IA0KPj4+ICAgeGVuLGVuaGFuY2VkID0gInhlbnN0b3JlLGdudHRhYixldnRjaG4iOw0KPj4gDQo+
PiBDb3JyZWN0Lg0KPj4gDQo+Pj4gDQo+Pj4gYW5kIG5vdyB3ZSBhcmUgb25seSBlbmFibGluZyBh
IHN1YnNldDoNCj4+PiANCj4+PiAgIHhlbixlbmhhbmNlZCA9ICJldnRjaG4iOw0KPj4+IA0KPj4+
IElzIHRoYXQgYSBjb3JyZWN0IHVuZGVyc3RhbmRpbmc/DQo+PiANCj4+IFllcyB3aXRoIHNvbWUg
Y2F2ZWFycyAoc2VlIGJlbG93KS4NCj4+IA0KPj4+IA0KPj4+IA0KPj4+IElmIHNvLCB3ZSBjYW4g
Y2xhcmlmeSB0aGF0Og0KPj4+IA0KPj4+ICAgeGVuLGVuaGFuY2VkOw0KPj4+IA0KPj4+IGl0IGlz
IGEgY29udmVuaWVudCBzaG9ydGVuZCBmb3I6DQo+Pj4gDQo+Pj4gICB4ZW4sZW5oYW5jZWQgPSAi
eGVuc3RvcmUsZ250dGFiLGV2dGNobiI7DQo+Pj4gDQo+Pj4gYW5kIHRoYXQgb3RoZXIgY29tYmlu
YXRpb25zIGFyZSBhbHNvIGFjY2VwdGFibGUsIGUuZy46DQo+Pj4gDQo+Pj4gICB4ZW4sZW5oYW5j
ZWQgPSAiZ250dGFiIjsNCj4+PiAgIHhlbixlbmhhbmNlZCA9ICJldnRjaG4iOw0KPj4+ICAgeGVu
LGVuaGFuY2VkID0gImV2dGNobixnbnR0YWIiOw0KPj4+IA0KPj4+IEl0IGlzIE9LIHRvIHBhbmlj
IGlmIHRoZSB1c2VyIHNwZWNpZmllcyBhbiBvcHRpb24gdGhhdCBpcyBjdXJyZW50bHkNCj4+PiB1
bnN1cHBvcnRlZCAoZS5nLiAiZ250dGFiIikuDQo+PiANCj4+IFNvIHRvZGF5LCBpZiB5b3UgY3Jl
YXRlIHRoZSBub2RlICJ4ZW4seGVuIiwgdGhlIGd1ZXN0IHdpbGwgZXhwZWN0IHRvIGJlIGFibGUN
Cj4+IHRvIHVzZSBib3RoIGdyYW50LXRhYmxlIGFuZCBldmVudCBjaGFubmVsLg0KPj4gDQo+PiBU
aGVyZWZvcmUsIGluIHRoZSBsaXN0IGFib3ZlLCB0aGUgb25seSBjb25maWd1cmF0aW9uIHdlIGNh
biBzZW5zaWJseSBzdXBwb3J0DQo+PiB3aXRob3V0IGFueSBtYWpvciByZXdvcmsgaXMgImV2dGNo
bixnbnR0YWIiLg0KPj4gDQo+PiBJZiB3ZSB3YW50IHRvIHN1cHBvcnQgImV2dGNobiIgb3IgImdu
dHRhYiIgb25seS4gVGhlbiB3ZSBsaWtlbHkgbmVlZCB0byBkZWZpbmUNCj4+IGEgbmV3IGJpbmRp
bmcgKG9yIG5ldyB2ZXJzaW9uKSBiZWNhdXNlIG5laXRoZXIgInJlZ3MiIG5vciAiaW50ZXJydXB0
cyIgYXJlDQo+PiBvcHRpb25hbCAoYWx0aG91Z2ggYSBndWVzdCBPUyBpcyBmcmVlIHRvIGlnbm9y
ZSB0aGVtKS4NCj4gDQo+IFllcyBJIHRoaW5rIHlvdSBhcmUgcmlnaHQuIEkgYWxzbyBicm9hZGx5
IGFncmVlIHdpdGggdGhlIHJlc3Qgb2YgeW91cg0KPiByZXBseS4NCj4gDQo+IFRoaW5raW5nIGFi
b3V0IGl0IGFuZCBnaXZlbiB0aGUgYWJvdmUsIHdlIG9ubHkgbmVlZCAyICJsZXZlbHMiIG9mDQo+
IGVuaGFuY2VtZW50Og0KPiANCj4gMSkgZXZlcnl0aGluZzogeGVuc3RvcmUsIGdudHRhYiwgZXZ0
Y2huDQo+IDIpIGdudHRhYiwgZXZ0Y2huLCBidXQgbm90IHhlbnN0b3JlDQo+IA0KPiBOb3RoaW5n
IGVsc2UgaXMgcmVhbGx5IHBvc3NpYmxlIGJlY2F1c2UsIGFzIEp1bGllbiBwb2ludGVkIG91dCwN
Cj4gInhlbixlbmhhbmNlZCIgaW1wbGllcyB0aGUgeGVuLHhlbiBub2RlIGluIHRoZSBkb21VIGRl
dmljZSB0cmVlIGFuZCBpbg0KPiB0dXJuIHRoYXQgbm9kZSBpbXBsaWVzIGJvdGggZXZ0Y2huIGFu
ZCBnbnR0YWIuDQoNClNvIHdlIGNvdWxkIHNheSB0aGF0IHhlbixlbmhhbmNlZCBhbHdheXMgaW5j
bHVkZXMgZ250dGFiIGFuZCBYZW5zdG9yZSBpcyBvcHRpb25hbC4NCg0KPiANCj4geGVuc3RvcmUg
aXMgc2VwYXJhdGUgYW5kIGlzIGRldGVjdGVkIHVzaW5nIEhWTV9QQVJBTV9TVE9SRV9FVlRDSE4g
YW5kDQo+IEhWTV9QQVJBTV9TVE9SRV9QRk4gYW55d2F5Lg0KDQpBY2ssIG5vdCBoYXZpbmcgWGVu
c3RvcmUgc2hvdWxkIGJlIGhhbmRsZWQgcHJvcGVybHkgdXNpbmcgdGhlIHBhcmFtcy4NCg0KPiAN
Cj4gU28gSSB0aGluayB3ZSBqdXN0IG5lZWQgdG8gYWRkIGEgd2F5IHRvIGV4cHJlc3MgMikuIFdl
IGNvdWxkIGRvDQo+IHNvbWV0aGluZyBsaWtlOg0KPiANCj4gIHhlbixlbmhhbmNlZCA9ICJldnRj
aG4sZ250dGFiIjsNCg0KSSBhbSBhIGJpdCBwdXp6bGVkIGhlcmUgYXMgZ250dGFiIGlzIGFsd2F5
cyB0aGVyZS4NCg0KPiANCj4gT3Igd2UgY291bGQgdXNlIGEgbmV3IHNlcGFyYXRlIG9wdGlvbiBs
aWtlIEp1bGllbiBpbml0aWFsbHkgc3VnZ2VzdGVkLA0KPiBlLmcuOg0KPiANCj4gIHhlbixlbmhh
bmNlZC1uby14ZW5zdG9yZTsNCj4gDQo+ICJ4ZW4sZW5oYW5jZWQtbm8teGVuc3RvcmUiIGlzIGEg
dGVycmlibGUgbmFtZSBhY3R1YWxseSwgYnV0IGp1c3QgdG8NCj4gZXhwbGFpbiB3aGF0IEkgYW0g
dGhpbmtpbmcgOi0pDQoNCkkgdGhpbmsgbW9zdCBjb21tb24gdXNlIGNhc2Ugd2lsbCBiZSB0byBo
YXZlIGFsbCwgc28gbWFrZSBzZW5zZSB0byBhbGxvdyB0byBkaXNhYmxlIFhlbnN0b3JlLg0KDQpI
b3cgYWJvdXQ6DQp4ZW4sZW5oYW5jZWQgPSDigJxuby14ZW5zdG9yZeKAnSA/DQoNCkFuIG90aGVy
IHNvbHV0aW9uIGlzIHRvIGtlZXAgeGVuLGVuaGFuY2VkIGFzIGl0IGlzIGFuZCBpbnRyb2R1Y2Ug
YSBuZXcgb3B0aW9uOg0KWGVuLG5vLXhlbnN0b3JlDQoNCkF0IHRoZSBlbmQgWGVuc3RvcmUgY2Fu
bm90IGJlIHVzZWQgaWYgdGhlcmUgaXMgbm8gRG9tMCBhbmQgdGhhdCB3ZSBjYW4gZGV0ZWN0IGVh
c2lseS4NCkFsc28gdGhlcmUgaXMgbm8gc29sdXRpb24gYXQgdGhpcyBzdGFnZSB0byBoYXZlIGFu
IG90aGVyIGRvbWFpbiB0aGVuIERvbTAgcHJvdmlkaW5nDQpYZW5zdG9yZSAobWF5YmUgaW4gdGhl
IGxvbmcgdGVybSBzb21lb25lIHdpbGwgd2FudCB0byBpbnRyb2R1Y2UgdGhhdCBhbmQgd2Ugd2ls
bCBuZWVkDQphIHdheSB0byBzcGVjaWZ5IHdoaWNoIGRvbWFpbiBpcyBoYW5kbGluZyBpdCkuDQoN
ClNvIEkgc3RpbGwgdGhpbmsgdGhhdCB3ZSBjb3VsZCBqdXN0IHNheSB0aGF0IFhlbnN0b3JlIGNh
biBvbmx5IGJlIGFjdGl2ZSBpZiB0aGVyZSBpcyBhIERvbTANCmFuZCBqdXN0IGRpc2FibGUgWGVu
c3RvcmUgYXV0b21hdGljYWxseSBpZiBpdCBpcyBub3QgdGhlIGNhc2UuDQpJZiB0aGVyZSBpcyBh
IGRvbTAgYW5kIHNvbWVvbmUgd2FudHMgYSBndWVzdCB3aXRob3V0IFhlbnN0b3JlLCB0aGVuIHdl
IHdvdWxkIG5lZWQgdG8NCmhhdmUgdGhlIG5vLXhlbnN0b3JlIHN1cHBvcnQuDQpCdXQgaXMgaXQg
YSB1c2UgY2FzZSA/DQoNCkFsbCBpbiBhbGwsIGVuaGFuY2UgZG9tMGxlc3Mgd2FzIG5vdCBzdXBw
b3J0ZWQgYmVmb3JlIDQuMTcgc28gd2Ugd2lsbCBub3QgY3JlYXRlIGFueQ0KYmFja3dhcmQgY29t
cGF0aWJpbGl0eSBpc3N1ZS4NCg0KV2hhdCBkbyB5b3UgZ3V5cyB0aGluayA/DQoNCkNoZWVycw0K
QmVydHJhbmQNCg0K

