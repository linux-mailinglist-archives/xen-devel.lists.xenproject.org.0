Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0159D69E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:26:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391814.629790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQAK-0006BL-P6; Tue, 23 Aug 2022 09:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391814.629790; Tue, 23 Aug 2022 09:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQAK-00068Z-M4; Tue, 23 Aug 2022 09:25:44 +0000
Received: by outflank-mailman (input) for mailman id 391814;
 Tue, 23 Aug 2022 09:25:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxx3=Y3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQQAJ-00068P-W0
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 09:25:44 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50089.outbound.protection.outlook.com [40.107.5.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e7d1816-22c5-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 11:25:41 +0200 (CEST)
Received: from FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::20)
 by DB6PR0801MB1688.eurprd08.prod.outlook.com (2603:10a6:4:3a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 09:25:34 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::a6) by FR3P281CA0017.outlook.office365.com
 (2603:10a6:d10:1d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 09:25:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 09:25:34 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Tue, 23 Aug 2022 09:25:33 +0000
Received: from 63b34b4e394a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9AE00E60-5DA2-4C47-98EE-8EA7D68C9E4A.1; 
 Tue, 23 Aug 2022 09:25:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 63b34b4e394a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 09:25:26 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PR3PR08MB5692.eurprd08.prod.outlook.com (2603:10a6:102:8a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 09:25:24 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:25:24 +0000
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
X-Inumbo-ID: 8e7d1816-22c5-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oQ2FAa/vmvfQ0xcgmSSE0T/ifnxY+ccGN8sz0DJCrIR3UuEQIkEU9JRN9emJRbILi6hk1jEM5OisBksXYyfwzSwhIGPgf6iY2ZTZ17C+GgRiVv9iBDVNFgclzSwhKd5+b58dEjRlHctb74X4ODgeNVUAZlEu3BjFADFAoLsLzvRWFHE7esYBSRW+mJIxWUO9q96UIiRASSdjF6WCD1MC1mj2RR1CRVxjJjJ+dCbOIghJRGxm+PK4AP6Dq+PVY2ucyF8eulGTpo9adDjNWJw2kx1sHTMvJbTwYYKahXvXDru0R17/bfSQYI5CFZPbtRg6JU64nabUbfI7y/1A8TWo7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXnVBSADNa5KkuADvuULYtbYoNmTpuvfn43JswcaVFM=;
 b=NGx5PHrG4VmdcutMnRBO3FIXC+qZb8zJY68qM4KLf+R4JT+lbXoP2olzaFSr8N3fqR4f1PwAvI7g33nJl1go+FApVL79Qf46z8Zz+imHhUdoezHa94SgC5xT0rGd5ke+UhLrlPMQKO1jsVN9cQGbgXNPJteRurYD0wkgm7msiRlkQwzvCK4yMQGFVkMrRUJ15EreqPztQi8ZiSEqlvmFW+FNHuGxci1FKnD9ozLHFfGyYSEghOLZlU666GRp0bcJfcPLVLYxYl+oQcnPSqq2DDcq/ZKPrnMGVppxlpDzdIBJS5zZ9Af9BR6Pu3hbrKe5FKjSgq9kCBL7FQVHF/by1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXnVBSADNa5KkuADvuULYtbYoNmTpuvfn43JswcaVFM=;
 b=A0XAW+VhGRSkNUASxF5SlOprk7NBjG/XAvuaQbZoI+7qLThMi+PFyFSrId70myvK0cxKfVdhRSTSllUwiPgGTVnujy577kPCrgEYNC6Rncyc8yeVLyd+JKRIthvz832FsLHzf+wR0zsmlD+8OvT+MOzEgKweBz4E2erszI0w7xs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1a9de5123068483
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+/Rx4a6AI52X3Q+zpoepeHBVdD9pm4er2dpuBqrn+eoSC5RyHyip+M1doPWc3oT+6Zy5y84sBEFkt9/xrYK72qUG+1xCppPC3t/jI7B87KLdv6ja7gdXbWvH+dfXtB+S14UJ9wflq0FAUASBmy/uobRf5uUtW9a4Co17xtIM+sbV/oLzdmG6m4jQwIADNFKVE9NzgImtwxvfpUVlU5xxj8FppgtinLXbDDLx218j6HQx+POjM+bIWHpBsawwG9VUTOOHbgqqP1Pebyj7zxlmXI0EkSkW5jAx4ETfF/rck/C810rcc26m6f9uOOabp5tsaLaLChrAvICcJyzHXclPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXnVBSADNa5KkuADvuULYtbYoNmTpuvfn43JswcaVFM=;
 b=OSapuQW8feJywd8cFbBdskb4d58pBLWml06Jo32qMTI8aIHNpHFY38V8TJdSv2CyMpEmfQytRbTrlxgkFyIic+D0kViNG6NoFggnxzKSJexP1ESDBR+cBLwP8I6Fa7c/q75CYph+MpLIeLmoW4wGR3xlmpHfki/I1m5/xXwIevJ1q7ZjARB1d0N42wSGZ7hhhjvvt5WeNwbdG9Y0figkzyrpsM7zI2NUxV9EhG8+wtSXEKKBq2IzdVe2K+mGIEGvk4M76hsft5s99RwCwmaMZMU78guylnnwxqINlv9oh9vAL1yjbE6c5aBzG3LyvxzzIXebANq2ny1hcq242d9F7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXnVBSADNa5KkuADvuULYtbYoNmTpuvfn43JswcaVFM=;
 b=A0XAW+VhGRSkNUASxF5SlOprk7NBjG/XAvuaQbZoI+7qLThMi+PFyFSrId70myvK0cxKfVdhRSTSllUwiPgGTVnujy577kPCrgEYNC6Rncyc8yeVLyd+JKRIthvz832FsLHzf+wR0zsmlD+8OvT+MOzEgKweBz4E2erszI0w7xs=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/7] xen/evtchn: modify evtchn_alloc_unbound to
 allocate specified port
Thread-Topic: [PATCH v2 5/7] xen/evtchn: modify evtchn_alloc_unbound to
 allocate specified port
Thread-Index: AQHYs7NT/ePVRG/IfEm3N5HsoShX2K269tWAgAFGT4A=
Date: Tue, 23 Aug 2022 09:25:24 +0000
Message-ID: <00D26226-425A-4FDA-B274-87C73A5AC33C@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <02234e7aab1e8f3d18e5398f1c4745203df77364.1660902588.git.rahul.singh@arm.com>
 <8c439b00-4ceb-0119-fd2e-a7ab240e403c@suse.com>
In-Reply-To: <8c439b00-4ceb-0119-fd2e-a7ab240e403c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 65c44203-b107-4452-9258-08da84e96e8a
x-ms-traffictypediagnostic:
	PR3PR08MB5692:EE_|VE1EUR03FT045:EE_|DB6PR0801MB1688:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lqgCF2bAA9mikKjBGC2CUsYbvgqS0GgBL0YTLRIHNlXbI/lMluk3ryYs/9XMW2mDcMbwwZ3n7YX4nduJ6pP78lt90rAtLKxWxzN2OLdtzJy+YuZh/4beRABGQwoNg25q5IBTOUJ+h6lFK/MMl412Hv+OQfvBpMls00W2ua2WlqMHb1HXvF7kc3pfBzxCSVDR2udatIg4kEuDEREjFY/d9WVsq4UFViUWLQFOtvwGQ3oAr4uEjWmTv8o+YYOtk3/sOSDx1uL7+rd2yymUa77Gkti97dJpKYKdxUFfC4Lzj/S+pueriCzxl2IDXMN++8qeG3W2WgCIcQnz6ndrGK0H3iwakZGeLeW7qk//oafAgLNu0wXDeQXAEcvRcV7T1idub7aoqKFrp7JCM525ZcJmfw1tnKadYwLw+bPw1o5n/4Z3qT7n4yo8315SZCsfvK7lLSfbid+TKSoPwBfU/9RCqwaSPANvv3MCzmEgYhj6c5ir4UB+rExhdHf+c2hOI5LtvYpbnoPDSgv+2/SfcYbAcYOVWZ+OgSpMZCBkfVDuUFL4Ii0ISw60gczoTAL2aIkeIzig2KVmsxAbtoWCGSOIDugezqEov4Dt5q3joCXfd76mTe/5cYthC2bLYXT5W+1Br2zwFuFpvCXB2ENvSQZWHwyYi8pHX5g2EkL42VzDG2tltgzzJO5jgX3qdm9hWh5uGrVsddJq1ks/gCMfApNNHkA2mLy2dYfQ53jSJu8zKyFSSVEjAnKUMrEBYFrnGKi4pDOanT/Y66YhkBJRJChutEuKUmlobqAVSXAxYRcJWNs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(6512007)(26005)(86362001)(53546011)(2616005)(71200400001)(41300700001)(6486002)(478600001)(122000001)(38100700002)(38070700005)(6506007)(76116006)(186003)(316002)(8936002)(4744005)(64756008)(66476007)(8676002)(66556008)(6916009)(66946007)(4326008)(66446008)(91956017)(5660300002)(36756003)(54906003)(2906002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3B536FD3BE48084D9C351812232CFB18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5692
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4c0d293b-5120-4938-e969-08da84e96872
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZHtwhAyty+LEMky6j5dBL85hwLwRjkF4Vuo5gc7U1j8WKxb+Ckwe/8sZIZrceltKDdCb+f5gbT5xkGCx2X7vLKZ9UfDQJxkm/N7i9af1vqXbv7gDtpVFqcltfMb0Z4Rt74lUYIVa7ATE9x6nzbazAr2n02mIGiHVpjGMiJuLpLnunQHcGd/WTytIQebB27CQ8A7nr1aMOeeBOP1Ee5qmOHmv+k6LxR1w1Hf2nrwGXBnuYEzpHqWsOVSKXKruwvokiuc2WzaUtQweKo/GtCEo3pxVjoZlQq1TL8Nf46AmVZ/gYhv0JCfTg6BXgZUuT7ICwDnlSbYGNM/foxXwa0H7JWOlsXowd+D+ZtKdKL40+3ieTB/7mZgcmFCgWc8U9Vo33FvKBE70ANcrkAv8vzosb7dMy9QseEu88UCGQJK273FeyrSjXaZzUXyTAxS0TcCQymLuQo6u6LTi3M7HZRIb1HSn96z42WnYwM50AP1BFskxnSNsWQhhvL7ycr4S8hNpvYkNgIpP9OxKw25LO7J1UXJkfA+HVuF7iukWG12bTr9vELc64vGwchqTtuqPld/ElNme40o9lKxB0fIb8CsLNDNWSHhNFifdryRqQLpgalwRJu/yG3ryjQDbZYS7JBAXGDg8UCa2AIes09mND6vRCNPkKycFLR6FDeBoZS66iRMTcsRrKBNHpsVGhSgbUSxy0ORCEl+M726OkkFqmGryZqcC+3PbyAoYDehZdIx049GlOxeOJk8SRZq1PBNIrt0duQP7CFc1mPVO71je7VdKpA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(36840700001)(40470700004)(82740400003)(70586007)(8676002)(4326008)(86362001)(54906003)(36860700001)(81166007)(36756003)(356005)(33656002)(70206006)(47076005)(186003)(26005)(6512007)(336012)(8936002)(41300700001)(478600001)(6486002)(6506007)(40460700003)(316002)(40480700001)(82310400005)(6862004)(2616005)(4744005)(2906002)(53546011)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:25:34.2050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c44203-b107-4452-9258-08da84e96e8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1688

Hi Jan,

> On 22 Aug 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.08.2022 12:02, Rahul Singh wrote:
>> evtchn_alloc_unbound() always allocates the next available port. Static
>> event channel support for dom0less domains requires allocating a
>> specified port.
>>=20
>> Modify the evtchn_alloc_unbound() to accept the port number as an
>> argument and allocate the specified port if available. If the port
>> number argument is zero, the next available port will be allocated.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> As a minor remark: Personally I'd find it more logical if the alloc-unbou=
nd
> adjustments came ahead of the bind-interdomain ones.
> =20

I will move this patch before evtchn_bind_interdomain() patch.

Regard,
Rahul


