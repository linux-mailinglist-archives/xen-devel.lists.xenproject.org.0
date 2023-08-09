Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9D87761AE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581126.909681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjb4-0008Jr-LO; Wed, 09 Aug 2023 13:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581126.909681; Wed, 09 Aug 2023 13:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTjb4-0008Gk-Hj; Wed, 09 Aug 2023 13:51:34 +0000
Received: by outflank-mailman (input) for mailman id 581126;
 Wed, 09 Aug 2023 13:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTjb2-0008Ge-W6
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:51:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe12::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7f622a7-36bb-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 15:51:31 +0200 (CEST)
Received: from DUZP191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::21)
 by VI1PR08MB10029.eurprd08.prod.outlook.com (2603:10a6:800:1c6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 13:51:27 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f8:cafe::a6) by DUZP191CA0025.outlook.office365.com
 (2603:10a6:10:4f8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28 via Frontend
 Transport; Wed, 9 Aug 2023 13:51:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 13:51:27 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Wed, 09 Aug 2023 13:51:27 +0000
Received: from f6a2c0602c2a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B601A46D-BB41-4652-9D43-B04EB2D1E5F4.1; 
 Wed, 09 Aug 2023 13:50:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6a2c0602c2a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 13:50:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8116.eurprd08.prod.outlook.com (2603:10a6:10:3ec::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 13:50:28 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 13:50:27 +0000
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
X-Inumbo-ID: d7f622a7-36bb-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQNT8PERyXuLdsuD19oU8pXPPzCvFl1yWXLc6ZmLdpY=;
 b=G2KBhp95grLb9w0jfyyjSzMOZNnAoZzU9QDROjJvF1f/7DDtRxqy5qC1h/6aFHpWesB1hHkaxT0ZCKofeDnjq0Ts+1RsUn+GJ2TwdnBWJwCEw3TLmsRvpT0nPNV89WImNzGt9hy6tRzh+RX1uIVUiZ8mEzJUXRUOT9kC5cG3CKI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1525b17b58706906
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPtCBT5Rnpid7iK/ZcGhhlf7Qp4fxjFTGBTm3Ei970N4p1E70Tfr2/SfocY6bnAfaP7j9JBSdt7vPyohxS/eF09kF/6v0M79ztKgQV0P2IbLQ2L2mxcYOmhSmgJA6e2/30SlrBEUkpleq82uDio30MqEcFBooZ8eS414JYc9JB6iACcvyxoszoQnzZ/YoV/snL5pAiFZQPtUdnaumOm+O3IvGkJf2WXoly6ut4hffewSVMzgEe/F74fOgkwuwdtXmRIqs5b1cMoFNPMb+GVaQ+Uthn/b33Bw78b/2/F8csmHRNU7fVzjxFnkjr6fDWa0W9d3w2dxxVIzCJT58oE4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQNT8PERyXuLdsuD19oU8pXPPzCvFl1yWXLc6ZmLdpY=;
 b=Yq/o8+wJpgYcicfD+VY562WIsmbgmU70RicVLYHvyGWA9pUP0t8QSJluJdi8vqZnj9ejykTPJOyNoOkGjLugwtNuQfSlA6YJYguFb3dgFyi31Dni4XETRbwzL3HTioXqwqfAnjfdQXaVeqme2UAwYYRBxKsPpU8GxXf+7pCXuk8mRAEjvwSfkMd895u1cDYm+54csqY+TqU2NEGK3C/OAvpjZty94KGmTKAGcPxoX5QbkSqewF4rLwnPKAJGvpUK6OEIedwPWShPslFEXorEefUPtKjs79aFf8xVpCch/1hVzbH0rIUpw9XPtrmiGxZSdpiZtg1IcDfciAQFwjZcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQNT8PERyXuLdsuD19oU8pXPPzCvFl1yWXLc6ZmLdpY=;
 b=G2KBhp95grLb9w0jfyyjSzMOZNnAoZzU9QDROjJvF1f/7DDtRxqy5qC1h/6aFHpWesB1hHkaxT0ZCKofeDnjq0Ts+1RsUn+GJ2TwdnBWJwCEw3TLmsRvpT0nPNV89WImNzGt9hy6tRzh+RX1uIVUiZ8mEzJUXRUOT9kC5cG3CKI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH 3/8] xen: address MISRA C:2012 Rule 8.4
Thread-Topic: [XEN PATCH 3/8] xen: address MISRA C:2012 Rule 8.4
Thread-Index: AQHZyrEYmlGLQrMXXU2mT8iNskDvw6/h+3gA
Date: Wed, 9 Aug 2023 13:50:27 +0000
Message-ID: <F44603D5-6DB1-4266-AD2A-482AD481E9C2@arm.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <c010bbb270ff3b546d4790487cf973413ca2af26.1691575243.git.nicola.vetrini@bugseng.com>
In-Reply-To:
 <c010bbb270ff3b546d4790487cf973413ca2af26.1691575243.git.nicola.vetrini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8116:EE_|DBAEUR03FT057:EE_|VI1PR08MB10029:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5c3c18-196b-4c73-c6c1-08db98dfba4f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Gl/bhcZALul2f0hbF3VhQybofTByrHnLoFP5kaQo2BBbAiiPZ6Qn94EQtSbNK1Foh4qq2bTtj3bej3AY2rRxJ+LZikbiVvQKLW1rFVSWAFcU5mzTU6xg3HxzHJFHUzIJET61+mKWSV8s1a7IPOeQjw1ypv9xGdBE3RpzAnFHz8vyf9G6SvY3YwOyMPPBKPY0Pl4adIVxkc32c5WioZoA/XUCoof+SvgPHpLHuBzijsliO03ipi/siWcIye9qotOcY6hE5V5WOjIGdNVC3+RAICWu6aVaed9E7CoASIRDtvN+/F4rZnK+JKVORc04IFp6cX9TLuA38ZVEMCqjtIERdUrFftUaFhG6n3vX/0rG5mheoNZsTvFVxINC7T/RyvfZkUQJLOwkzspNZwHWJdfMEA2A3+fLBWBrrmLTjGHW423A+8sWQljfQIw7l24ws39EqTPTMi4rPsuixxUcTZZJUygQDyd2gujP6p6e1yTYqupknJ2kVo+i9i1byc1j07iNGmsb8ihdnD5Yf1/A8MPMldtWI32t+a3A8rK/Og8fHSB0d231KqofzttqHZV0z07RA3K2WBiYNgjyfdkf9cUXBPd/SYHqhf/SzFsO/FrooAqkXLdMhM3M82aEJwEKNOFvNgHR5Ildiz/riRn3ajUqGA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(186006)(1800799006)(451199021)(316002)(83380400001)(2616005)(2906002)(4744005)(122000001)(36756003)(71200400001)(6506007)(8676002)(5660300002)(53546011)(6486002)(38100700002)(26005)(66446008)(64756008)(41300700001)(6916009)(76116006)(66476007)(4326008)(66556008)(66946007)(54906003)(33656002)(86362001)(91956017)(38070700005)(7416002)(8936002)(6512007)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1902852551DCDF469E7FB038272FA202@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8116
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f23349b-5c61-4e43-b9a8-08db98df96c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sakAe8Pya6lKQ2I+KN+oao/3o4bhSYyvrdH/9vdcGcNfM8qkxHAjNS0Wll8yhL8Vzr49AX5Y+FwxuelhjQEfSH96wxLtdDWtORwC1SzuTVAnLnP3OhYXPQbgjTgLHSUDyXFxdtRcUL1iAgRZ160yLeR1q5+4xDAJxLP2VVriw/Jx15moUWz6UxwBsFdxcxvVyAEVEXK/6Z9vD+cjKhDNMlMQ0soOt30ZWDbfgI5RNlTi5tLnkTGzcErgY2p6ncDPk+WOZCdmBM61kYI7jkr/GMGXKloFIKDFdvbxJbIKzfDGeJswpcAvffJogZylNx3NhfnKKwTDHWRq5HJX4x25aevyBBdY2qPHx93dxaIHRPKXqDj7GDWQuwMbCkpyXpU11BCvomJtbBP0VFSpxcTteMEbKse2IRVbb7Sq4KU5efBdnVg4dXl9f19NE8oM97Mecl0GyDzcu0zLas4Z94IqrFMzwGVu7JaxLmNsdzenDxqq2mz229dgPShjL9EL9KJRn1/aYZ88lSaff+kJNAOTvgP9foYxi+je2J6A2ZpjZJZ1tX5TeI0hvUkr7q0Ai0ek4kO6YLgHXTIxIGD5kaQx647JiRnYPGjKJdOX/OlQOCnW8P2EmkhNpLl/z/efGASBCxzHqmoeFGRYt3LodO0766mlrzBr+Ddh4kES0aCcZ/P93uk7CxSFcxjK5GsNRAHIL38l8qw+By/QzV9bxBzOtvIHdCCwMNt99xQC3HPU+gJSjaAmcAloS13MlG+tmyi2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(1800799006)(451199021)(186006)(82310400008)(36840700001)(40470700004)(46966006)(40480700001)(336012)(2616005)(40460700003)(6512007)(36756003)(4326008)(316002)(6506007)(356005)(70206006)(70586007)(478600001)(86362001)(82740400003)(6486002)(53546011)(33656002)(81166007)(54906003)(26005)(8676002)(8936002)(6862004)(47076005)(36860700001)(2906002)(83380400001)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 13:51:27.3507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5c3c18-196b-4c73-c6c1-08db98dfba4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10029



> On 9 Aug 2023, at 12:02, Nicola Vetrini <nicola.vetrini@bugseng.com> wrot=
e:
>=20
> The variable 'saved_cmdline' can be defined static,
> as its only uses are within the same file. This in turn avoids
> violating Rule 8.4 because no declaration is present.
>=20
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> xen/common/kernel.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index fb919f3d9c..52aa287627 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -28,7 +28,7 @@ CHECK_feature_info;
>=20
> enum system_state system_state =3D SYS_STATE_early_boot;
>=20
> -xen_commandline_t saved_cmdline;
> +static xen_commandline_t saved_cmdline;

I see this line was touched by fa97833ae18e4a42c0e5ba4e781173457b5d3397,
have you checked that making it static was not affecting anything else?


> static const char __initconst opt_builtin_cmdline[] =3D CONFIG_CMDLINE;
>=20
> static int assign_integer_param(const struct kernel_param *param, uint64_=
t val)
> --=20
> 2.34.1
>=20
>=20


