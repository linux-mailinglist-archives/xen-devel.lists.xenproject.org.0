Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B5E78D3CA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 10:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592756.925574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbG85-0005uG-GR; Wed, 30 Aug 2023 08:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592756.925574; Wed, 30 Aug 2023 08:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbG85-0005rJ-DS; Wed, 30 Aug 2023 08:00:45 +0000
Received: by outflank-mailman (input) for mailman id 592756;
 Wed, 30 Aug 2023 08:00:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI6i=EP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qbG84-0005rD-0d
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 08:00:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5090f7c3-470b-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 10:00:41 +0200 (CEST)
Received: from AS4P190CA0066.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::9)
 by PAXPR08MB7492.eurprd08.prod.outlook.com (2603:10a6:102:2b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 08:00:39 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:656:cafe::95) by AS4P190CA0066.outlook.office365.com
 (2603:10a6:20b:656::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Wed, 30 Aug 2023 08:00:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.18 via Frontend Transport; Wed, 30 Aug 2023 08:00:38 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Wed, 30 Aug 2023 08:00:38 +0000
Received: from d58df7ecceb3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 64E5CB74-BA78-47D3-9D83-D630E973D4CB.1; 
 Wed, 30 Aug 2023 08:00:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d58df7ecceb3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Aug 2023 08:00:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8466.eurprd08.prod.outlook.com (2603:10a6:20b:568::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 08:00:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 08:00:28 +0000
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
X-Inumbo-ID: 5090f7c3-470b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HiX3uDD7Izb+4xNXEWHFxHZWTg2oQubaSWUITMqflQ=;
 b=VLPensUzmZ6pUFIpmMIbok+/BgkQPR370DKwkUZJiwl+k/Po95uTV8Pyn+Wjbt5svyHbiffml4KwCdbSzt3dOs1eShQeH8djz8fZLsF8I8tD+or3qn0MZZCUWS4s5Nekw+souiY02U8KVPk44u0fTvr4qpckMBPb2TF1aoubAgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: af50ce19b3ebbc1b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jL6/jHOsxrC+GKbtVMV4KtXqlHayaK61swwyz4q4vIimt/93q3Vdp1zIg9PfcO9zgPsxHuyeUWE7hcLxZdgGb+5I0Y4z7H1wcqRUrdp5LuleWh7uhd4Vw8i9pz0KBu/YUMPRYZbMkSda9Low/u72G/69kj4YIJc7tSH2aC5xqSz3OYD7vXWamWv4m1FIPQ/H6nuQLTCurBQVwDyf6BAIx1ZnB7I5zaoSd1Fp03AUeyhgFFwGYY2f4rN5hwI5lxOWFpYpw3gc8EL8TBoy9PU5feeTBao93qEb66+d2EYGbn/5qPaKpvvpT7GFWatdAvdzsmxONTsC/w49kSV0BePLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HiX3uDD7Izb+4xNXEWHFxHZWTg2oQubaSWUITMqflQ=;
 b=msYplZAysPG+En1RJ+la3qcvgURKUHYeym6GUlLLaIdEFH0C/vV0txTfdOaoSwXGGm8AYpa8aiPO+OkPL8uUYU4dHqjTzwjrqdhgApQ5FlNVCfP8rU39fNqOwX8njrFJoh9w3hzXe8GQQM6yvhos8P6agruhvnQ9x0d73+w65a3J8TFu6ZrLN403MoDV49fo8IQYEMAFuO+n3PrdTHCw7ZMHkFN539zz0l3Q/YFXjoMXPxs+zWon2afcDlumRA28ir6peRjPfDEZ/Pc8K6kjZCDnNhvwl9XM5KdJVwA3ORnIbGv0Cfh/fHykWZf2acS7FN4vkXYoNKr4jIkMNKX95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HiX3uDD7Izb+4xNXEWHFxHZWTg2oQubaSWUITMqflQ=;
 b=VLPensUzmZ6pUFIpmMIbok+/BgkQPR370DKwkUZJiwl+k/Po95uTV8Pyn+Wjbt5svyHbiffml4KwCdbSzt3dOs1eShQeH8djz8fZLsF8I8tD+or3qn0MZZCUWS4s5Nekw+souiY02U8KVPk44u0fTvr4qpckMBPb2TF1aoubAgI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "julien@xen.org" <julien@xen.org>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>,
	"roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add 14.3 and 14.4
Thread-Topic: [PATCH] docs/misra: add 14.3 and 14.4
Thread-Index: AQHZ2t1QaiF4viv/Cke+tZQgief+irACeLmAgAABJACAAABvgA==
Date: Wed, 30 Aug 2023 08:00:28 +0000
Message-ID: <64ACA853-E0D3-4B56-B79B-C31BF692A936@arm.com>
References: <20230830005950.305085-1-sstabellini@kernel.org>
 <C2070A06-265A-48EC-9A67-34D820B2F94E@arm.com>
 <15551c77-95fa-7c7d-6b6b-d5c42a38caac@suse.com>
In-Reply-To: <15551c77-95fa-7c7d-6b6b-d5c42a38caac@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8466:EE_|AM7EUR03FT018:EE_|PAXPR08MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 287dfa3f-1e53-4f6f-83fb-08dba92f32e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Spo3pbczfhXHq3SCmSYOpD0jJMNFDaCJ/iyvY+WiLKT508KK+Z7Ot09SPoQOB9C+tNjL8Cfwqdi12uj6BKRtw7gqYVhpvQSup+tSi7eSSNTkbCZM8wxJndUpPJzDvQbZ/5LGpMQuGRpJsgezOCIPU0hAfrDEqPgelcQ9H8C/0zmAkPMoj0+NiH24IzNds+ZS30Jcrr8QDvDmwVbS8whlB+o8rJtlhuKODSNyuJsgm0il26F4MMyhnlvg2Qijgp8J7bXFNTLE4AKc3lwKJ+zMqzier5UDHoZ1XAAY5UoEw88qv0OpU93PKmKHhburTc/SP2BmIPo4pqHQ9fURgKg6bD8m25IuZUVFXrbUDfWLclPHCWTPowqUeZIyriJgv42FzGkQ6t51TYWxGEoXD1SndqlXG/bh4/rkbxOQs7smj+KBswjDGduGfnJ88eTa9+QUbCv17K85/MTTKOvfbo2fy1K3WZjt411EaSPLX7QnlZ4EdvmjjJN2CpWM3HRXqTOqICfslfUxJaNT6YqE6rdERwtQGu1val7rjoPJ84HSMO4LbaxDHuCfbDI+Q+PfBw09lPPSEDcKpu8btTVk+Vh1ia94QY+unlqCG+ynq6m+i21q95XniZHhoT1wKtIGRAtCOW/aA4/KuTSyHmkH/TGX0A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(1800799009)(186009)(451199024)(8936002)(91956017)(53546011)(478600001)(76116006)(122000001)(66556008)(6506007)(66946007)(71200400001)(66476007)(64756008)(54906003)(66446008)(6486002)(6916009)(38070700005)(316002)(38100700002)(41300700001)(6512007)(5660300002)(8676002)(36756003)(2906002)(2616005)(86362001)(4744005)(7416002)(33656002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <841C76BF87492940AC5A4C3FE3BF6220@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8466
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b68129a-7864-4626-c6fb-08dba92f2cb8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kINExbusb/UXLUSdmxzMNMwdy8arE7KzPv413c2+oa1PcycXZ0vYa/qlU2KUonMF/88p7WQDfqmr6HsNOmQXuKfuJlmMRclPcVkhtd3DN2smpGlzrygdX7ERiVJbC5tGE4552+p/0xYVqHzCeAJV06G0aA9aaETQjSC6CiEL7LMtnfEcF/YRheZU3IwiBRkJekuCp64oxkJWkqgcUbPWscVbznT2sAl5dMCp6i7XFtwbTEAJ9ZfwKilka81EIZvQtEkldltYcyO6R0HL2Ygh7khETyHx6nDdxf2TIpbPOgUg1Bmj3lNVMf1O1gNbRQHyyu+aTgT6lnQNG8BMUzXAw9WP5DFUlBodFWZlR20lz4+jDPRxJT4fIu8BtDU18M0jOpE4lBSEyunj3Xj9xFRDjuX/7kkBC8Oufl/sMXjZjF+LkRxPWRWyQ+hQoLRWayrfJIALQ7HF2A8Rr8Ra/N+irOXzMSR9Ko3vpoO7bTlFnKUMbxz3WwoNj63FoWRCEv163ZAr5OrWNzMv+EUzEPr5YP0nJUz0CRkC+ufp1U00cI9IyXAuo7DPWyuYctuLe8w94km3oHcl22XlD0A5RaATK8oaYKQOZhbpfWj/nrxN70an4V7B88TirXiVIdKiYh1OTyMTZsrwqZcN7vxYMcPdujsSPMRgRG7j8OBW7knhG5WHpENirs9XnRHpX7bJAHaLBQjwSaluUSTVKJ5Rcrq8d+18j7XdGiQGdcxQba4GE0U=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(33656002)(54906003)(2906002)(70206006)(70586007)(316002)(36756003)(4744005)(40480700001)(40460700003)(41300700001)(6512007)(53546011)(36860700001)(6506007)(6486002)(5660300002)(26005)(336012)(47076005)(2616005)(86362001)(356005)(82740400003)(8936002)(8676002)(6862004)(4326008)(81166007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 08:00:38.4957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 287dfa3f-1e53-4f6f-83fb-08dba92f32e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7492

Hi,

> On 30 Aug 2023, at 09:58, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 30.08.2023 09:54, Bertrand Marquis wrote:
>>> On 30 Aug 2023, at 02:59, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Examp=
le-Suite/-/blob/master/R_14_04.c>`_
>>> +     - Required
>>> +     - The controlling expression of an if statement and the controlli=
ng
>>> +       expression of an iteration-statement shall have essentially
>>> +       Boolean type
>>> +     - Implicit conversions of integers, pointers, and chars to boolea=
n
>>> +       are allowed
>>=20
>> I am a bit wondering here what is remaining after this deviation.
>=20
> Hmm, good point - floating point (and alike) types, which we don't use an=
yway.

So we accept the rule but we deviate all cases that would apply.
I do not think we should do that.

Bertrand

>=20
> Jan
>=20


