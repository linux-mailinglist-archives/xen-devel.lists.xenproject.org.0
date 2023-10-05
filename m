Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AEA7B99AE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 03:34:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612825.952936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoDFL-0002nM-EZ; Thu, 05 Oct 2023 01:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612825.952936; Thu, 05 Oct 2023 01:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoDFL-0002kv-Bs; Thu, 05 Oct 2023 01:33:47 +0000
Received: by outflank-mailman (input) for mailman id 612825;
 Thu, 05 Oct 2023 01:33:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfD8=FT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qoDFJ-0002kp-IO
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 01:33:45 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 380c9805-631f-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 03:33:43 +0200 (CEST)
Received: from AM6PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:20b:6e::42)
 by AM9PR08MB6644.eurprd08.prod.outlook.com (2603:10a6:20b:30e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 01:33:34 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::bd) by AM6PR02CA0029.outlook.office365.com
 (2603:10a6:20b:6e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Thu, 5 Oct 2023 01:33:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Thu, 5 Oct 2023 01:33:33 +0000
Received: ("Tessian outbound 9aeaca65ec26:v211");
 Thu, 05 Oct 2023 01:33:33 +0000
Received: from e09e16a50595.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED6F316C-7A36-4AC4-9409-B6E2C918456F.1; 
 Thu, 05 Oct 2023 01:33:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e09e16a50595.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Oct 2023 01:33:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9521.eurprd08.prod.outlook.com (2603:10a6:20b:60f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Thu, 5 Oct
 2023 01:33:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 01:33:24 +0000
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
X-Inumbo-ID: 380c9805-631f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMTbu8aDaQm7NJPGlIKBhXV7yoWn0Z1K3mTRVnWgUmc=;
 b=lVvSVSqEi43MOEe6USvTgpBMKImD5Ojgze5c43fBlPzzQAabGHTG9vghNf6djdS3qknYhaDDPgx9hF7QzvJK8Byu9/0bGqu50YroZZjQMBlh/nrsCUZe7NvRrEcW9skph1vSrkXQqOGl3Hp3CleFUXVJOkEHwkYLCf/C+cC34kQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2391d365e99f78b1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+UZGpvcv9h3UL2+KM4R6XcJBTTG4tb96xyBNvkZm9c7XHnm9s43eWn+22pPmB23wYWfbQSvidKpSN3vC0RdWOqbGbV2Hy54Z5UBc3zlyvfp0n6Fk1e0ogGL5k1d58HQf4BQrTcLKd9vg2yr0Lp7Xawf0cchJvk8L5oL2biWpG718bUdLWULfNIhAqe3CvEoPsZViSh6Ks7vmttQ/H1yMvoAL8PxjDX3lqZKuMvc0UJZRPRGjWnz3KRsJPpELwjD0SOl6ZJnl380aSNvJKwSPI2j9Kc1qVwESLlJ+qT8kUwWiQniz4hv6G63lXuw1WxK4EwRdGAuQUhXkTBryibsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMTbu8aDaQm7NJPGlIKBhXV7yoWn0Z1K3mTRVnWgUmc=;
 b=b7u1v0JqnLm2lsNZ73fTBe8xWeCGsql7CMEi7B+9BvXxuB78/qBQsPO94nYbosmIWw4Zuvxq/ItD3kIxBD5PAYAa2QLyFR9nV91R8dR8KPcp4cSdQ8HLBIMmXGb9FyzVz4hfc48cSO2sA4wRMBdvh1Xjc0Dcd9NblM6QicOxKMgHdWOaPib69vefTlRAUGNbQ0ZOjFk8t7D01XQTnm3FYA4e/VvWfas8nZGHjoGnsqSMbnstTIrRENBIjvRjrRd7LkfMehFHpBhsP0xSisa4+sLKYtGdOJw+KalmmPduWdlqrxBAfpkFATLMwg0qIH0N9Pz5VeOecu8yqkADFnZHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMTbu8aDaQm7NJPGlIKBhXV7yoWn0Z1K3mTRVnWgUmc=;
 b=lVvSVSqEi43MOEe6USvTgpBMKImD5Ojgze5c43fBlPzzQAabGHTG9vghNf6djdS3qknYhaDDPgx9hF7QzvJK8Byu9/0bGqu50YroZZjQMBlh/nrsCUZe7NvRrEcW9skph1vSrkXQqOGl3Hp3CleFUXVJOkEHwkYLCf/C+cC34kQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Thread-Topic: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Thread-Index: AQHZ9g3DjAyQhyn3xk6z96DrL2N0h7A4i4QAgAHgMIA=
Date: Thu, 5 Oct 2023 01:33:24 +0000
Message-ID: <3C814639-8F88-4CA4-A8E4-2E46AAA74451@arm.com>
References:
 <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310031354260.2348112@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310031354260.2348112@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9521:EE_|AM7EUR03FT043:EE_|AM9PR08MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fdb01a7-8c48-4acd-3c5c-08dbc54316b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 adFcXzkOjxYNSmMQ1aNFBZePSPw37k6Z8ozpnW4RHSB/81EFc+xldOTHxJYSFf1GOn9QD3xbowetbwo8w+amWa2YdEKbS6m4j6Rv46T/HyJK6c761nGlR37RfBzWlTZXexRNf3fKPOwW++8haXH8b9TrYkQaGe2KNyk1LA4KjrmMhCFZ7SZHAWlvSK9E7cKCzOwaAeewA4ikPOBpq/oL2BWL+hePqR+Vjq8fb1Tu26/7FTAm2BgRaDozyV/Ci8jh8iZqXNfsLmB0nzBp4eWoqBq1HitccDsA5p8GntSMQQA1EKxpnqRbTTYDDmMIeuLIPFcG+DLgr40MPIXYINU7kifNcxVfq2bKh+nM56eELpNh4X5MCLJH1yi3f+53StKanfgA0EwrwtfO2Pyr5MM4txNEKUdMIDi4mFY8ycQhiEyO/yprur7dGFjq049tULtCLeOP8trcQqOQilcaLqKcK8BNj4buuPm1dNa+geokQkxXVet4zw0Cm0dqWJs3wjybw1scWSBMqdM+fQMIChJ+EZloqpHA/ilGPqHLmqffw5inzCq37dwLmFoT28ENv2B3cdo63XxIoNOxDey75QK/RE4yPO2kUY2gLWatBzjG9qUva3jx0pnCXmKB5CGCx2rVLdfoRAXSmG+D4xgnQHkCUA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(53546011)(6506007)(6486002)(6512007)(478600001)(38070700005)(86362001)(38100700002)(122000001)(76116006)(316002)(2906002)(2616005)(6916009)(71200400001)(33656002)(4744005)(91956017)(26005)(7416002)(66446008)(8936002)(36756003)(8676002)(4326008)(66946007)(66476007)(5660300002)(64756008)(66556008)(41300700001)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BDFAD56C3A376146BC2A98729E43B24E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9521
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7073e87d-5341-481c-fb98-08dbc5431126
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9D65nNGTubLm5ySwo58KT6AzbJDB/bKBTCWMwG92CR3YsQi106KmlQ6PK6N4dnEiKDLQBk7+U5TbG7ktSeIq3ij2TN02WSqcJ5xEhapaL8ndT9YqAnK4pBvRL7HynYKm85HyfWNU8DBIFbpvEKr7C9zZJAWHMSH0F3s4m+F7T6eWtYGwcZUffHUI+0go8nL6zMS9sGTQ0oeEbxNSlWaQ/DTs4NDmSc4XIrDTWozqUJSoXQ9/+uAj8VBTSa/9mgg0gxAWWBw8kbt0FQYztpeKqsiFVq0ILDF/4+aFJ4rrmfyfVUoaPd4WfUtPefjSW9pRZYpB5D6Pz1c0laU9FddqDnBKyu5EJYdG0RBt4YVXY3451n6i4A9jdEPYpd/vCfPSPeZRB4e6PVISh7caw2HVBwUF0GMVqwUlRZfMV7yi/vn/c7vfN18p8huGaZYKLRVNrXs8PluGi7Gzwl/bYH/n5bH8fy5DwqFllYWL6KRD/HO36Caek3vuufaVXoFGRLYVU2BoLBBjokWK/5lFnHaBVhGF3W1Nn3zFu++TbPTly/boDW2hUAE9hD5idoKWQ5T4kmun8TnM+B2wrQMK8agtwtRbzVW/DGKpusenyBSWCuKyCaxsuRXhADPFIz80JWhvz/VnBJntwVhsw25y3bUs1Kjn4kq3+/XSURO/X7XFTe+l9pYB1aTY2KrF9q+lN0oIDPxgqclCQi5YRrDGh1r5zyLeF2xKHLT0mlywn6WB3auo23dITHN7B1BsO+snQaIn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(6486002)(5660300002)(41300700001)(316002)(70586007)(70206006)(36756003)(54906003)(40460700003)(26005)(107886003)(336012)(2616005)(40480700001)(53546011)(478600001)(6512007)(6506007)(8936002)(4326008)(6862004)(8676002)(2906002)(4744005)(356005)(81166007)(36860700001)(82740400003)(47076005)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 01:33:33.6692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fdb01a7-8c48-4acd-3c5c-08dbc54316b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6644

Hi,

> On Oct 4, 2023, at 04:54, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Tue, 3 Oct 2023, Federico Serafini wrote:
>> Add missing parameter names and make function declarations and definitio=
ns
>> consistent. No functional change.
>>=20
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


