Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0735B0529
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401724.643634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVv9X-0001ZJ-1L; Wed, 07 Sep 2022 13:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401724.643634; Wed, 07 Sep 2022 13:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVv9W-0001X2-UF; Wed, 07 Sep 2022 13:31:38 +0000
Received: by outflank-mailman (input) for mailman id 401724;
 Wed, 07 Sep 2022 13:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVv9V-0001Ww-2P
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:31:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d72397-2eb1-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 15:31:35 +0200 (CEST)
Received: from AM6P192CA0070.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::47)
 by AM8PR08MB5651.eurprd08.prod.outlook.com (2603:10a6:20b:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 13:31:34 +0000
Received: from AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::2e) by AM6P192CA0070.outlook.office365.com
 (2603:10a6:209:82::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Wed, 7 Sep 2022 13:31:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT031.mail.protection.outlook.com (100.127.140.84) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:31:34 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 07 Sep 2022 13:31:33 +0000
Received: from 74df6654d7e8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83336736-D6E1-48C1-A743-8AACFE48E2CD.1; 
 Wed, 07 Sep 2022 13:31:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74df6654d7e8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:31:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB8645.eurprd08.prod.outlook.com (2603:10a6:20b:55c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 13:31:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:31:25 +0000
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
X-Inumbo-ID: 64d72397-2eb1-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O5+ILeZm0MiAzA77IlkaFeUJ8r+B3amUhCVkViRVwmSxj8oKDOJb3fNcqA7/Zks7HTnUlVr71BNPNISaOxkZe/jn6do/aexoUsJRLG1uehfaOJs4GgBzVjxBEqnQvfPqN6E25CGFordtDNu/TybOI5JS90Nx9rhhbujJ8y8gNuyyNm4+kimAevS8lu7IrH455UdSE7OUou6X2MWusECWGeSwdhCmaTyO/ASd9Cw1FVOjk8Asaje4RJsNrS3mIHl2PaITKMJumYGSQXf/xypYETb7KQRqgSrumWSklJ8g8ZR4/Vk3ilrjXK57LDwJZETQJgE6bp1t5euZgupIlCKgHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHbEvZg2VmQdh1TU0dT7zEuTcLScvMknWkhUXNuEiuo=;
 b=NevV0C6fihSC6sDB+0uzwWNeliUNdpUYrPwr41unYYnabMIb1xyMhzu4kklL2cGrJ0v3pfQ/nHg8ABqsY22bkOJPwbWD9t3RnS6sLcXXUSboe27FD1I+tEbHoVYhBYWK4z8+R18CeTp7QCUzgWscqHnySgxQt948SDV8UWWcz0k4WqlJfjRHCGdXrxZkCuk2AKZx82iTIYDXKJFL4VOFfuYZmNk2fXR9aj4LuCB048+1lXOxcm3Oj06byggtlysyvW2kmLZcaGxA3tzWw1srrjf9tezt0B5efAcSE9EqMpIFk2hF/h2Ezz/lMVHdrCRyTVxHnFt/NEy/ZDwgsJATNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHbEvZg2VmQdh1TU0dT7zEuTcLScvMknWkhUXNuEiuo=;
 b=eBQSSC1sZglpN9Zx1dM9jqFyGnDfecnXaU0ITvEbTldWqS22OUUBuFqjQs627CkdtizAq5nmhhpZVtzqeUcpUktFqaQHc80tyfaGZhJ9oL8aTSro6OPyUngloVe0+kIQZK210jOpyxXxeU8hdJBxrPw19CHGfvJ7s33M21p2+3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3405c64fb6bc4c22
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf9r0MKZwLDtieSCsaGuf8Zdxltb3nUmcXCze5s+yp9HvRS5FhyQV1oqpALFCQNdk9pbf62/tftx8lkxCoN0tc2Z58BqKbjDNqNqn7BsLX5dXWT1iYH4j7oaP6P8ft+kt8lJUWuxTU9vVSvvolgTYpsFThTmsnyJtwvuhJjyzr1bf22HzZNqhXVCodIvbV9b8FVmPIosZNoX5XiejaBjstmANG9BOHMtn/47dNtizauPAxNQmpDxAdceM7S1EYXsg2bUysHHRLE9r/0rET0aOeZ3EGJjz9NGnTX41mIUG44q0Uylq+lnsX1TQHsKIggN+oLFpUtu7bcJMhNu2Mlefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHbEvZg2VmQdh1TU0dT7zEuTcLScvMknWkhUXNuEiuo=;
 b=AZnPD06TGcjXTbIONoZA5wYeBKsW29gPFCTALQjSGEJi2vYfgZqtY/0WbjZZDXPW/j9xT/l85maZuS1Uy6lhR2Afab/l2Qv/kWyqncbY/fpc2noqbCD59kF4To5YLtdOrhF46xP7wDMp4iFX1OqE/iNNWRcQ/xFSmk9ogirW/94fkb8yFiLzG+bngkJzRf0hte1fyNIx118KQVfcVrTwGrNySBQB2kDUZAC6IOAEP9HgBl9kWVEFiZWskLkcEgzXqlp75Cfp39Utg4HLb6CKQ9oHZItTioApmUgUHE26LAXmb5ELO67+shI/1pF0QKEMnKxYYc4JVL7ui5x7irVpHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHbEvZg2VmQdh1TU0dT7zEuTcLScvMknWkhUXNuEiuo=;
 b=eBQSSC1sZglpN9Zx1dM9jqFyGnDfecnXaU0ITvEbTldWqS22OUUBuFqjQs627CkdtizAq5nmhhpZVtzqeUcpUktFqaQHc80tyfaGZhJ9oL8aTSro6OPyUngloVe0+kIQZK210jOpyxXxeU8hdJBxrPw19CHGfvJ7s33M21p2+3o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v4 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYwqqLAtgrk5Z7CEC9g3vN92mek63T3yeAgAASqwCAAAJsAIAAAq2A
Date: Wed, 7 Sep 2022 13:31:25 +0000
Message-ID: <749F6AF5-9BB2-4693-AD97-67BD79D0A6F4@arm.com>
References: <cover.1662548825.git.rahul.singh@arm.com>
 <d1db7461eb4ae3f9423814877c5ab6d946dae4e7.1662548825.git.rahul.singh@arm.com>
 <a7576b0c-2134-1778-7751-375cd4c02554@suse.com>
 <06E1E4AB-5DA1-4AC4-9452-9507C2B75E81@arm.com>
 <bdfa302c-4f0e-4442-1af7-8d730bb7f627@suse.com>
In-Reply-To: <bdfa302c-4f0e-4442-1af7-8d730bb7f627@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8875982e-51f4-497f-8c86-08da90d54847
x-ms-traffictypediagnostic:
	AS2PR08MB8645:EE_|AM7EUR03FT031:EE_|AM8PR08MB5651:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ak6hWFjCgCSHHWtrnhrwkhn2M4iBZv6CrDKkd2t4L7NktW57h0CTRjxQRohnkscYWBtXwcBFqvWMATfxdSIU0HCRCOzn5IN1U5Gi9lq4wu1GUHtGEs/oHCgGaZ1YhppgmVwWxqXeWvBN9qik6ppxXyVnzOuRGxaF+YBO8180L/mQAtF0nBwfAvgnLgApbmIrEPh3DsvWWl33r1mtaGhPY3TdyFKbPSXneL+QQeROH+lTt3BeqDFP7M8TDO8Bv19M3vWO64WXL0pS/FfKXk8XMijdM8M/11ojKjmhu6BuCm3gUnaR2qnMd7ao3crcVBrvkWL02aEwJikzUJy4WaTuPGbOa6XFrcUzqV4fDuFzWViEFegejPg9IXGTS2DIa0A6z5ITAMh/L3uxpnDgwFVxckIsjYnKzbhMvYidPwUpq6xmVgz4W4hCO1rKqIHgw8O/R3qdv51KsgZ9Cqrd+455WTdz8XP/1+YyK80J4mEu2r4VSvMH5/CjabLjJXyXzVOo9LJjzsiwKd4ijBwFVMG1ShQ+yWqV53L7ymbIGCec1MWi03OQv6Q4vGqcUbIhXlRldlBzkseWCo0NsGYk+BMM00O2RL4UbBu8Rzd4WYNJcw3B0O6J1kc1J16b439kmYBvMblbNzQtJ5aS4qaYBKR/WVNAdDb99ifg5Ydd23ckTrqcWbAOeZV7RK3Xzhn7PU3FJupjdTPHus7F75eiHeUjguXW6PoFmwca5eyHe0lvCg+dUuUi/gs4N2B7j0jQ1TbTssR1rM/kk71GM+xZePzo5nyLcpo8iCvnZQySU9Z8lf8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(6506007)(6512007)(478600001)(71200400001)(41300700001)(26005)(54906003)(6916009)(316002)(38070700005)(6486002)(38100700002)(186003)(122000001)(2616005)(86362001)(4326008)(33656002)(53546011)(76116006)(91956017)(66946007)(8676002)(66556008)(66476007)(66446008)(64756008)(8936002)(2906002)(36756003)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D9F19C7DFC94B94897C860E3F9234569@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8645
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d638226-3aab-4c3f-92cc-08da90d54306
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jFdmo30PzBM5WT4wKpEaCVjgXAG9f9XMFQld2TN/zQf3V4zMVeuCykH38IsrOEUOVUFUSAaJ++Z8OZT5WRBmgPhHYU47pNXPLJx4pAg5c1QRAlw6ldZD0ovzcTUNRb/95uuMOOoZwvy8EW6ffNGMad3Rl5nUrCwx0WmOspcM+LzDUEPSOt3G6ucoPAa/zxsnlUITflb7CQy96BhtUYZVJSEKjTpjGMdXEqulQpFKHmljgUgr028Z83waH7zbwcKV0/bXE3GnIlC09ivJ7B3jYUUNSTKy3RX3c2x/5u/2h92O+Q6U4p+bb9hy3lqK7WUQzGUIdDLQ/1uELcAOFMzuUdBe/IwTc3anpg6kwEmW7t9T/B6LwEnzeMhnWfO0kzV2c53nwCWxX6CxA2VZgtGUHp12dzb98T3zkedGuROQMtNJlXyMgtvAFRcN7dxtekU43G3xpkVswRZAApl6u7mmzdyYV6gO9eK6wMDSzXSevdN3USOaGxOE1YFtN4PTfkMoiYNgLrxqAXjRTDCs5hgc6m/kfMzV3N/DUTJPoa66he/VEGJMeQTYw64Ge4E4IeV8MvwSYnXQ3Iwl2tm3ba5HvANe+A7bknYqf1VGMIeSOCILP3xZhRPIkGoQC7tAk9lfUuJMP2V5UEpY0lOaagbbv8JArwVk4BCf2AJm0460HFK/aZ+43daYUsrMo4bGR9EiuJ4AmPqLvrBTUy3OTGT/W625WKkj88tJMkz64yXuRuwkGFzSpMtv1A7yK+Wg07TVbQt6uj9py6vKwRC9jsQMZw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(40470700004)(46966006)(36840700001)(81166007)(336012)(186003)(4326008)(2616005)(6486002)(316002)(70206006)(36756003)(47076005)(8676002)(54906003)(70586007)(82310400005)(86362001)(53546011)(2906002)(6506007)(41300700001)(26005)(40460700003)(6512007)(478600001)(5660300002)(6862004)(36860700001)(82740400003)(40480700001)(33656002)(8936002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:31:34.0803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8875982e-51f4-497f-8c86-08da90d54847
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5651

Hi,

> On 7 Sep 2022, at 14:21, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 07.09.2022 15:13, Bertrand Marquis wrote:
>> Hi Jan,
>>=20
>>> On 7 Sep 2022, at 13:06, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 07.09.2022 13:09, Rahul Singh wrote:
>>>> is_memory_hole was implemented for x86 and not for ARM when introduced=
.
>>>> Replace is_memory_hole call to pci_check_bar as function should check
>>>> if device BAR is in defined memory range. Also, add an implementation
>>>> for ARM which is required for PCI passthrough.
>>>>=20
>>>> On x86, pci_check_bar will call is_memory_hole which will check if BAR
>>>> is not overlapping with any memory region defined in the memory map.
>>>>=20
>>>> On ARM, pci_check_bar will go through the host bridge ranges and check
>>>> if the BAR is in the range of defined ranges.
>>>>=20
>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>> ---
>>>> Changes in v4:
>>>> - check "s <=3D e" before callback
>>>> - Add TODO comment for revisiting the function pci_check_bar() when
>>>>  ACPI PCI passthrough support is added.
>>>> - Not Added the Jan Acked-by as patch is modified.
>>>=20
>>> Hmm, I don't see any change to the parts the ack covers (x86 and common=
),
>>> so please re-instate. I'm not in the position to ack Arm changes; thing=
s
>>> would be different for a Reviewed-by without scope restriction.
>>=20
>> This might have been clear for you but your ack was not mentioning anyth=
ing.
>> As the newer version is modified anyway, we remove it.
>=20
> An ack can only ever apply to changes to files the person offering the
> tag is a maintainer of. Hence there's rarely a reason to scope-restrict
> it. As opposed to Reviewed-by, where someone may indeed have reviewed
> only part of a patch.

Distinction of scope handling between ack and R-b here would require to che=
ck
in the MAINTAINERS which parts are in the scope. Maybe explicitly putting t=
he
scope with the ack could be useful here.

>=20
>> But I understand from your answer that your ack is still valid for this =
version.
>=20
> That's correct.
>=20

Thanks
Bertrand

> Jan


