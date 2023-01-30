Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B63680991
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486722.754150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQXL-0000UE-8B; Mon, 30 Jan 2023 09:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486722.754150; Mon, 30 Jan 2023 09:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQXL-0000Qm-4t; Mon, 30 Jan 2023 09:33:15 +0000
Received: by outflank-mailman (input) for mailman id 486722;
 Mon, 30 Jan 2023 09:33:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtRO=53=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pMQXK-0000Qg-82
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:33:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c5eaea0-a081-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 10:33:11 +0100 (CET)
Received: from AS8PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:313::16)
 by DB9PR08MB9561.eurprd08.prod.outlook.com (2603:10a6:10:452::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:33:03 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::ba) by AS8PR04CA0071.outlook.office365.com
 (2603:10a6:20b:313::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 09:33:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Mon, 30 Jan 2023 09:33:03 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Mon, 30 Jan 2023 09:33:03 +0000
Received: from ffd0fb05013f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF066034-C8E5-43B7-90A7-77406A2D7E9F.1; 
 Mon, 30 Jan 2023 09:32:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ffd0fb05013f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 Jan 2023 09:32:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB8840.eurprd08.prod.outlook.com (2603:10a6:102:339::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 09:32:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:32:48 +0000
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
X-Inumbo-ID: 1c5eaea0-a081-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dibFMqZvR7Rnflsae3OShO/SukIWjWcvhwJPpuUDoes=;
 b=GSAmXcY/EjAnxOcb2Bg6edkfvfgA0jodgnCmu2mOF2u8TY+YRcLkETfFz4hRuRTxACGIRXN996bzK40wLlEf8cL3LCJkYNtFf7upO/LSzYzI3OKhm2MkA4CGCdVwFNcbHzhxYWQMApSq/bs+aIkX8008dYTkIDW0q3nqGEj0a3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 577e688602667a73
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+fRq7uniYSxXbb58r5ykywNroaHgPQYc2JcQ2pjDw+N4HyRHygoo07/h7G0AoQLiGjkozoNJGY+vZ3vb9+hu7zBx3GDmaQN+2OmxJo8bO32ZcyN0OTuZi74mEcjglRgsImZkPa8R9Y2nZSkrUmcRnnl/EN2GCit5jARhn3mgatV3FQY64YxIeyMckVOb/sGiIoxNgXC9SuJpVK7yE1MR7+lp2pIF0OPEvMq65p17TDz652gnrVsTZcpGVzzCEzpYlyhp3YsNz4wxdS/D5z1OzWOUvJSaYj0ZCXI6cyR/9Crw9NN7b/OX9zr5gnVBVE6muxHs3wyC9DxxV5w8EmzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dibFMqZvR7Rnflsae3OShO/SukIWjWcvhwJPpuUDoes=;
 b=bfomlTxOic2Yrp1i+FBBrHv5XZMSc7ysrLaykjfpbr0hN6Q6ADPMTfoKeMuYgkOw36N7m6yzhpUgS/dzfGUp9AmCYv94aQJdbKTWZQvzfvC/URlhXWQj7cy2enD3AatRdqGnfr9V+weOYlHgY8qCHsz9nm+Li2Nbg43HuuWnldSoq39jGHuVpmieAl9m14DuAY6X+BeDqP7g8bTuzecvMktnTEK87Z3kOfiL0/CCgi+hu6eumD4Jo8Etg4x2qwMrevZAFw/GdqHkQLvuiIZxW8nuJi2FAqMDWdlcjTSxA/AMm6HXugFN2PVcFrXbgKgiB0S7xTF1HBEPNqbHgJYsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dibFMqZvR7Rnflsae3OShO/SukIWjWcvhwJPpuUDoes=;
 b=GSAmXcY/EjAnxOcb2Bg6edkfvfgA0jodgnCmu2mOF2u8TY+YRcLkETfFz4hRuRTxACGIRXN996bzK40wLlEf8cL3LCJkYNtFf7upO/LSzYzI3OKhm2MkA4CGCdVwFNcbHzhxYWQMApSq/bs+aIkX8008dYTkIDW0q3nqGEj0a3U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
Thread-Topic: [PATCH] Add more rules to docs/misra/rules.rst
Thread-Index:
 AQHZMP/Bwov1pLqo70y7UrD5jvL/DK6waZaAgAByqQCAAAyrgIAAJGIAgADVWICAALcHAIAD/qYAgAAhQ4A=
Date: Mon, 30 Jan 2023 09:32:48 +0000
Message-ID: <2733D8BE-CCA5-4322-BB9B-1D4318378525@arm.com>
References: <20230125205735.2662514-1-sstabellini@kernel.org>
 <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com>
 <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop>
 <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
 <alpine.DEB.2.22.394.2301261041440.1978264@ubuntu-linux-20-04-desktop>
 <db97da84-5f23-e7ed-119b-74aed02fb573@suse.com>
 <alpine.DEB.2.22.394.2301271016360.1978264@ubuntu-linux-20-04-desktop>
 <03ce9f48-191e-b1b5-a3b2-8b769aa8feeb@suse.com>
In-Reply-To: <03ce9f48-191e-b1b5-a3b2-8b769aa8feeb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB8840:EE_|AM7EUR03FT037:EE_|DB9PR08MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: fc96b988-9b91-42f8-a404-08db02a4fc58
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mGTI8XNGt2UpkkuWB23M+2g/ZipL/2psnK8c1lcYoZU9uGwx2wMO+FAkWSOVYon1STaMrgKsjTYWIhfweQmlzvJ3bl5UMTcmj4fQ8hpH6iW7zwuM6b97uttr7+ihc/5+Bnk8M7BuEeO20jup+rUAyH/6Vz8rz9j1E9XO2ztf4qVTY0+1JriPbQm2dWkX1Bxj/bCs0IPmZxi7vQYKBjRktfMSbuzCFSteLsT6J6c4isYJCgiivTENV88LIer5o+To79WZ3xsdnLWm8nGOIYEmZ/VSxZwsAad4QVGZGMe0OOfnBi2F3dCqD0X2JsDFe7bC3Mnla5t7SGAcyvIsdYsKHyc/1klYcgow71I/+cUCxwinLm3mAznueXOFZLS9K1D7nihGtBRwq+Zn+Cwni02BigvuG0EV/rtVWYf77wW416BYIjjXd+US5t/DxJ/6pvIp6d3IP6c022axiGdpSNUX9z3OG3VhG3PMipVCvXbGr31xgreF65ctuLlXMItgLEmAijJVkqo3HsM5FFN54veaKDFkZgNdGjiJ4HuQptGZtELWKc7UjmY/YG6gK+M9wqOi8mPzalmx0ft7BI26xeLJSvH5B1bIuWkqmM9pMw8O4b0StYWmy+vHGkQ+/mVCOuuXsqlt+2XPT/rtFCllfgYuSW+DCjNzhUjuIm0IRl/SsTJGmT57X7z34Kd7mxzAzpZIULw17o2uRRFSJ70yGWCrg1Q6u+4RWf8s8IRGRYDVOkE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199018)(478600001)(71200400001)(6486002)(2616005)(41300700001)(26005)(6512007)(186003)(6506007)(53546011)(54906003)(316002)(4326008)(76116006)(66946007)(83380400001)(38100700002)(122000001)(6916009)(66446008)(66476007)(8676002)(66556008)(64756008)(2906002)(5660300002)(91956017)(36756003)(86362001)(38070700005)(8936002)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <743C82DB9D84E3459A25006AFD85DE2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8840
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	182a65f5-dba7-43dd-11d9-08db02a4f35d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rv/LEfJ5fWJXM0UYfU86mU6nd5yIfH/qtRZaRIgfCklBsEHDWTq+/tZDXXj8ObNbUOXAi1LEdZze0CtmV0ESh3CVWhyOPE7X3trc81rPRiKNWNIyKCnRFYtE/ceqzlszJqYmoONcAHHTvCX0gD+kXHTLAAAaU5CznTvleHSm/MTpxCXQS8LAoOuUktd0/U3pUjQpiwWiYpTIjmeV1uDqxHJzeYF/JtsZHJaOQelo8ppK2Pj/KyaabKBCbRA0OeL1Pfy277QSmswtVIYrUsPW/cnxBZ5JeicQTfDv1u2oQcZTIR5K0eAXE/3EpZ+Tdp8MvIyOjZgR1GG9RJPmR6s9LoE+Sd1L3dS+aJiqQJON4eLpzWfznovplO5enEmfGWRJgtGbFQpm7tv2dUcYJQhXFiny5Nwd7ppBgjmzAvZnL8/BxTh3HA4+93e4/NJDNL8AAlBywy9WF75expXzJEg2Lb8lF315/w3BNRfmx/wYvgINQElu+M12f7JUvjbDu/vJ7DtQlKTXjrXR+Q9azejGwP6rl3qCwDpUMn8eakvPVTSv3mwzh69VuFXnMklL+hlnwEbqTktDVEtOqtEGojpdKCQF5o+OYqIQm7JrMddRTvGgBKwo74S3F0//7TleZRRY09T253dK8Yy9YZ796gEM6N+O1FDoj2al/RTUbh7oejP0va6d+GfLc6TDh72xhqTnTNRyeg1EP6SgOL0JJiGnJw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(46966006)(40470700004)(36840700001)(41300700001)(86362001)(83380400001)(40480700001)(336012)(2616005)(47076005)(82310400005)(356005)(36860700001)(81166007)(82740400003)(316002)(36756003)(54906003)(8676002)(4326008)(70206006)(6506007)(53546011)(70586007)(33656002)(6486002)(26005)(6512007)(186003)(40460700003)(478600001)(6862004)(8936002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:33:03.4148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc96b988-9b91-42f8-a404-08db02a4fc58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9561



> On 30 Jan 2023, at 07:33, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 27.01.2023 19:33, Stefano Stabellini wrote:
>> On Fri, 27 Jan 2023, Jan Beulich wrote:
>>> On 26.01.2023 19:54, Stefano Stabellini wrote:
>>> Looking back at the sheet, it says "rule already followed by
>>> the community in most cases" which I assume was based on there being
>>> only very few violations that are presently reported. Now we've found
>>> the frame_table[] issue, I'm inclined to say that the statement was put
>>> there by mistake (due to that oversight).
>>=20
>> cppcheck is unable to find violations; we know cppcheck has limitations
>> and that's OK.
>>=20
>> Eclair is excellent and finds violations (including the frame_table[]
>> issue you mentioned), but currently it doesn't read configs from xen.git
>> and we cannot run a test to see if adding a couple of deviations for 2
>> macros removes most of the violations. If we want to use Eclair as a
>> reference (could be a good idea) then I think we need a better
>> integration. I'll talk to Roberto and see if we can arrange something
>> better.
>>=20
>> I am writing this with the assumption that if I could show that, as an
>> example, adding 2 deviations reduces the Eclair violations down to less
>> than 10, then we could adopt the rule. Do you think that would be
>> acceptable in your opinion, as a process?
>=20
> Hmm, to be quite honest: Not sure. Having noticed the oversight of the
> frame_table[] issue makes me wonder how much else may be missed in this
> same area (18.1, 18.2, and 18.3).

Hi Jan,

I think I recall the frame_table[] issue but I was looking into the eclair =
reports to
understand it better and I was unable to find it, do you recall where the t=
ool was
complaining for the 18.2 related to the frame_table[]?
Any notes or link is appreciated, maybe we could speak with Roberto to unde=
rstand
It better, because I checked with Coverity and I was unable to link finding=
s of 18.2 with
the symbol frame_table[] (however I might be a bit lost in all the macros).

Thank you.

Cheers,
Luca


>=20
> Jan



