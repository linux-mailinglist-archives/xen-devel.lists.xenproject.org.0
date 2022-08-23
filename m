Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B31F59DA9B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 12:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391863.629868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQR4O-0007xN-RY; Tue, 23 Aug 2022 10:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391863.629868; Tue, 23 Aug 2022 10:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQR4O-0007uJ-Nf; Tue, 23 Aug 2022 10:23:40 +0000
Received: by outflank-mailman (input) for mailman id 391863;
 Tue, 23 Aug 2022 10:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jact=Y3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQR4M-0007uC-WD
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 10:23:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140079.outbound.protection.outlook.com [40.107.14.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6ba5e5e-22cd-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 12:23:38 +0200 (CEST)
Received: from AM5PR0101CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::29) by VI1PR08MB4302.eurprd08.prod.outlook.com
 (2603:10a6:803:fb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17; Tue, 23 Aug
 2022 10:23:34 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::b4) by AM5PR0101CA0016.outlook.office365.com
 (2603:10a6:206:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Tue, 23 Aug 2022 10:23:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 10:23:33 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Tue, 23 Aug 2022 10:23:32 +0000
Received: from dd2f2bce088d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E1F1B824-8F69-450B-AACB-4192F23C4262.1; 
 Tue, 23 Aug 2022 10:23:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd2f2bce088d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 10:23:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB4579.eurprd08.prod.outlook.com (2603:10a6:208:108::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 10:23:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 10:23:21 +0000
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
X-Inumbo-ID: a6ba5e5e-22cd-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FnsbH6e1um8OKDmxHvgHXTRm49Zzj2wKyaC+CK5ciK6s2fXi72grD/ojkBiQDZOEPU05fdExOCOY/Vz/8L/PGshlJOBE6auFJFkSQT8tjIokvzWu6hI3V3qHUaE5LwK6mj9r/RZwfLvco+DtnPblV4yfkReIlVHPecokd5VVmjuZvZS3NL1V2HvoL58QLmao1bT8d39iffJxots3fve8O/gk+Zghh+jraR6YyNOa55AIQGh4kFN/IV4VuZCRCQcQUiBtewQdFpm3qSn2+A83vuMHle/+1+8ka4RbWfIgEwZvQAvicFX+8mBlsgSkLYpV1/XTVHjPM4OGILYltx24EQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iELuM75mf5iXZmKV0l26/7IKfIF6mJ+HI2LEyuwpRiw=;
 b=A2pdQ6U/IHJkDJpYaiV+l/oEwdqLpMgvQ/MGVY1RMFbTE0U5Idm0Whkmgb6hH9ThG9YVtUiz0qtIviEYFFKE4MvYxFjLys48spW3xQfMBXf4LEBuz5UU/jRFuXfaI2OVL5AjipZJiuIWr2F28BPAK658CnGt1u+SgvLapIyBDDFbxuq1+02oFsRNgWg3w18NmUTWGsAuJ70guLhH7XBQmZa1ZNsGZPCCVUPfMwTnLmZzqra5bqW+Gjfzut9LCcKTXGW/Us70OnLynF3W1FbDO/i1MmqcRr+yWbbQKTK6LD9asRKMRi0DoviLt7kCbkuI9svhcuIhy9mNw1Xch9GZOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iELuM75mf5iXZmKV0l26/7IKfIF6mJ+HI2LEyuwpRiw=;
 b=c5zDM8HvhwflMMG3n96uVx1zZDEB8UFSVSFLs971KTz9qczo74dt3l6DcF0rfN9pl9z/rzg8Nus4GpvAyPaoUo+YtG8Pj/3+swEpQoebbok9OSOD0FCuxx9+oHJtY80FpD3ZjLKuwGBbCzCcdOPSrlo/itlRvV0qT3vfyheqZIw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: acb6af35c7b0e1bc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRMo37ccmUsFCR9Gv0oxCytOTiw4RIWVlOHz4dEs+nbEbMOSrnUbLHjvxQ2GBTWPN2AHxmG5TU3A5cVnLsXk+IR4yfJsmumoFbhqaR+EH1a75nvlhiYiCeJQHnby54GomIIL/bI2aJj+BkutWu11mcYPRii+qiz2bOtcWq90OcMFnky8pqiy+zz+lOG7hKZtf/AyctOT9h84N3Y5BsPEuQOLsl0dzMQDTt2D19dFiBebUnn7fqqC9Ncpelg2KWwfsUVtt/Y7sB6Gwu0+4ZcNfwMCLyizE2HWtXSC5sZU6UBrq9E4U307YJuZuw6lpZO8RIBoWxYexnmM917SU76E9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iELuM75mf5iXZmKV0l26/7IKfIF6mJ+HI2LEyuwpRiw=;
 b=N6By0VCQJDhWiA8rG6Ho26gmnzdGB5Jtv0v8t3f0rzf+QcjD8S3MSo3G8OloFuQMHzGmdwXY2dJGhxG6dCA0FMiwry/Tl7UmYAom09S9T2soelakf7faG/M3tARIBBXz2ebpfg+6zJGAIRtvYicef33UW+TIoCu5DP3ET5sQv/ALSPQEuZPAySkcz5OlHhLtN4DJa16zXwK/ixvStbhDedtq5HIq7PYMBYqKoGt5V1+8gCvcUNseoUB3Cb+uUZt+TIo6q53sUQRSOc1BH0wNnrBPvjvIwbjXMHmNB63gc57qBKR16aizpLJfgp1j+iauc9RCUpq2G/xg5KHO5EydmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iELuM75mf5iXZmKV0l26/7IKfIF6mJ+HI2LEyuwpRiw=;
 b=c5zDM8HvhwflMMG3n96uVx1zZDEB8UFSVSFLs971KTz9qczo74dt3l6DcF0rfN9pl9z/rzg8Nus4GpvAyPaoUo+YtG8Pj/3+swEpQoebbok9OSOD0FCuxx9+oHJtY80FpD3ZjLKuwGBbCzCcdOPSrlo/itlRvV0qT3vfyheqZIw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "wl@xen.org" <wl@xen.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: [PATCH v2 3/3] add SPDX to arch/arm/*.c
Thread-Topic: [PATCH v2 3/3] add SPDX to arch/arm/*.c
Thread-Index: AQHYs05lv0KwzVk+1ESH7A+5C12Kg6212p0AgAD71ACAAVN4AIAEJDaA
Date: Tue, 23 Aug 2022 10:23:21 +0000
Message-ID: <AD1F6CD4-5679-4B2E-AA80-0DACD0F09709@arm.com>
References:
 <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop>
 <20220818220320.2538705-3-stefano.stabellini@amd.com>
 <61b01c8b-1f98-e559-f971-f081a25e0b93@xen.org>
 <alpine.DEB.2.22.394.2208191528050.3790@ubuntu-linux-20-04-desktop>
 <f235f6f8-d585-4e24-7fc8-3f2df9240c9d@xen.org>
In-Reply-To: <f235f6f8-d585-4e24-7fc8-3f2df9240c9d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 09e8e228-bb96-4f45-afd9-08da84f18843
x-ms-traffictypediagnostic:
	AM0PR08MB4579:EE_|VE1EUR03FT045:EE_|VI1PR08MB4302:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yTiCBbEipRNwepob6As1czYelqKsD7BLxHXiQh7iAPqsFBvkWy1kaXMLzZAoRottqM++65Mt7jUCMlljDzFlcdUhufxVYFLlhu/IU6dEylM9v1hn04sUISLgHdmtEUaWdLaIF89WQsWbhP+rqhuKhIKsyxBbkQbzUjliCVqBiij921rvBom5F00LcYyDr6ptgALgEr8HeWjZHHHiuqUvCV6mYZjcofo6LW0hMdYgRKhWz3Mn6njm9fNYqvBB7rreiaYwnPVTeA4ETFJ0E6OJOl13gMHiEWg13luQ2Qiwzh3RwXKF7q4PNHmftQUe65VQiHsrpxe7NI6SHfxcROmvaKMKTq4Ujmry3pSmsLhtmrHEMmR2FUNXiFZzIhZs2EdK1TUd0iL81iWX/If5GlLqajv3bhkKLGgfyd2V2BY/hdRPGhG7gHHQ2keRTqoRjMcTHHuHCbXK0XsXF8ZHfdrGyUQjxmgfB6BBWB+CoaMqfPvHW0CnqlETtCMEjBNu0/V1xmhn03ysgTvy5M65nNENIWpoif5cfhnwiylq4XJtpKl/uGbjoJF0rxfoAeeSrqXjm11fKpbr3LPSEYqTVSru/IgpP9NRY2PrCxFjlmTeA2S4YBZA0EOrM+PHIbUZbwla2vZZvIMI2YlMwFdlvjwQJ0NgGBW3G3qc2tVIbemlCtnA+IBYovRc3qutBJCDu60DVhVrZAZusJhHMvKOOe9C8BycuJbs3wwO5rOB7NPo6ehH/QF3VVU/KGnJpF68amciouxbJXvdUwL0mcWa+eKGhEgaZ7190aoYzfM3NU9QPy0rwlojTKhhVpboLJ8Z2HcM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(186003)(71200400001)(6506007)(6486002)(478600001)(26005)(2616005)(6512007)(53546011)(83380400001)(2906002)(8936002)(41300700001)(316002)(7416002)(6916009)(54906003)(91956017)(66556008)(33656002)(66476007)(64756008)(4326008)(66446008)(8676002)(38070700005)(66946007)(5660300002)(38100700002)(86362001)(122000001)(36756003)(76116006)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBF59E36CF7F8F418D9898CD887A47EE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4579
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c137317-6ff3-4b37-66a6-08da84f18121
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	++cJw6qlYECLFOKqDTd0XSDQ3Mgen8CK4qn8/bdXVBOkFmsmslGyzlWE1MlgxkxB1qDwNG2FFEVDc4kmWiQIdWyGATS/utiq+pU8jk9rSB8RI+ca0qeaanURpodi1z6Xga+8IvtCmYni/z2VEFayURdtF87XkvDNt/kX7+yRXvzJl+NxlNzDqn+lLKSlenR/J+dmzNCdH4pifVmhOllC61+wPLOTWkLrQVtxMrsKLvhR2O7L8A2y3tChLhf54ZMNQeofFsABQQ7o19nwCpWYvcduYnOjDve5hfCRyq1FJx6qFopqm+HJIww+MEaRV7Zzp67uXMqlq51PqysuTUQ3VgLXEWUE9rT9XQ2cE7kQBnoCkrTSqpYwSW2a8Js7z/7QLX6i61Ldk9wrOWnBteqknTdn5UMYDN4UUTehxVitJhD5y7Ht/X5NAKoX9LOg1/d+Io8oaqKkQoejZFavSV30t20f9bSIOkFhzzptLU7sLnJiq56Jms6JdZSiOrWcxglHNa0chNklL9+7w35BCIKbMKaDHdKNqS+nidV/G0ar3V44hQQAeHIdrvmiZJQ3fBU9mhb+MAKdDGk53y8R7Exi9KW8m5NHO7p9MuQtxND82pEG+I672Dey8JsbiMtp6KfqttL3uzVa1uyCtOMA67gzm5RCmsD48HQgXt3CVCMEUv7j5IvvcSUaZBBiQPH5KkQHXXLuKg/dOM3fQzXRd/N/7ZCeWDYu6FPGTPvv6PzSi4Lk1/DHeiszrRnEkr0oqtNi2b+QH7520AhfTFhyUjGrhLLRY3w+zADtFFPruW6U5yI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(40470700004)(36840700001)(46966006)(5660300002)(8936002)(6862004)(47076005)(336012)(53546011)(6512007)(6506007)(26005)(2906002)(40480700001)(6486002)(478600001)(107886003)(41300700001)(36756003)(86362001)(33656002)(2616005)(186003)(356005)(36860700001)(81166007)(4326008)(54906003)(82310400005)(70206006)(70586007)(316002)(83380400001)(82740400003)(40460700003)(8676002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 10:23:33.2971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e8e228-bb96-4f45-afd9-08da84f18843
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4302

Hi Julien,

> On 20 Aug 2022, at 20:08, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 19/08/2022 23:53, Stefano Stabellini wrote:
>> On Fri, 19 Aug 2022, Julien Grall wrote:
>>> On 18/08/2022 23:03, Stefano Stabellini wrote:
>>>> Add SPDX license information to all the *.c files under arch/arm.
>>>=20
>>> There are some of the files below that didn't have copyright. It would =
be
>>> worth explaining in the commit message which license you selected and h=
ow.
>>> AFAICT you assumed they were GPLv2 but I am not sure this is correct at=
 least
>>> one of them.
>> My goal is not to change the existing license on any of the files, even
>> if the existing license is imprecise. By what is written under COPYING,
>> everything not explicitly listed is GPL-2.0. I only reflected today's
>> reality. I think it is best if we keep mechanical changes separate from
>> "smart" changes, especially on a series like this introducing many
>> mechanical changes.  More on this at the bottom.
>=20
> I will answer to this at the bottom.
>=20
>>> [...]
>>>=20
>>>> diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
>>>> index f5f6562600..2537dbebc1 100644
>>>> --- a/xen/arch/arm/decode.c
>>>> +++ b/xen/arch/arm/decode.c
>>>> @@ -1,3 +1,4 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>=20
>>> This license is not part of LICENSES. Was it intended?
>> It is: the tag is described as part of LICENSES/GPL-2.0.
>=20
> Ah! I was looking as the list of files and didn't look for the tag. Thank=
s for the pointer :).
>=20
>>> If yes, this should be mentioned in one of the commit message (possible=
 patch
>>> #2) and maybe in CONTRIBUTING (to tell user to not use it for new files=
)
>>> because one could expect all the LICENSES to be listed.
>> It could make sense to say that:
>> /* SPDX-License-Identifier: GPL-2.0 */
>> is recommended for new files.
>=20
> So I was reading through xen/COPYING and we already have something like t=
hat:
>=20
> "Note that the only valid version of the GPL as far as Xen is concerned
> is _this_ particular version of the license (i.e., *only* v2, not v2.2
> or v3.x or whatever), unless explicitly otherwise stated."
>=20
> So nothing to add here unless you want to tell the contributor which tag =
correspond to GPLv2.
>=20
>>>>   /*
>>>>    * xen/arch/arm/decode.c
>>>>    *
>>>> @@ -5,16 +6,6 @@
>>>>    *
>>>>    * Julien Grall <julien.grall@linaro.org>
>>>>    * Copyright (C) 2013 Linaro Limited.
>>>> - *
>>>> - * This program is free software; you can redistribute it and/or modi=
fy
>>>> - * it under the terms of the GNU General Public License as published =
by
>>>> - * the Free Software Foundation; either version 2 of the License, or
>>>> - * (at your option) any later version.
>>>> - *
>>>> - * This program is distributed in the hope that it will be useful,
>>>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> - * GNU General Public License for more details.
>>>>    */
>>>>     #include <xen/guest_access.h>
>>>=20
>>> [...]
>>>=20
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 3fd1186b53..b29bdf3aa6 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -1,3 +1,4 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>=20
>>> AFAIU, the assumption is all the files with no copyright are GPLv2. Tha=
t works
>>> here. But ...
>>>=20
>>>>   #include <xen/init.h>
>>>>   #include <xen/compile.h>
>>>>   #include <xen/lib.h>
>>>> diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
>>>> index 71182575f9..47405e0866 100644
>>>> --- a/xen/arch/arm/domain_page.c
>>>> +++ b/xen/arch/arm/domain_page.c
>>>> @@ -1,3 +1,4 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>=20
>>> .... this file was split from mm.c which is gpl-2.0-or-later. So I don'=
t think
>>> we can use GPL-2.0 here.
>> Well spotted! Effectively this file is now declared as GPL 2.0 only,
>> given what is stated in COPYING. The code in domain_page has lost "or
>> later" with the loss of the copyright header.
>=20
> Yes. This was an oversight from me when I split the code a few weeks ago.
>=20
>> So if there were new contributions to this file after its creation, they
>> would have been GPL-2.0 only contributions, and it would have been
>> impossible to go back to GPL-2.0-or-later without asking the copyright
>> owners of the new changes.
>> In this case thankfully there are no new contributions since the split
>> of the file, so I can fix it by using the SPDX GPL-2.0-or-later tag
>> without problems. I'll do it in the next version of the series.
>> Xen is not saying: "if there is no copyright header it might be GPLv2
>> but you need to look it up". Xen is actively saying: "if there is no
>> copyright header it is GPLv2". Not up for discussion. Given that as a
>> whole Xen is GPLv2, the only possibility is that the file without a
>> copyright header used to be:
>> - GPLv2 or later
>> - dual license GPL and another compatible license (e.g. BSD)
>> Either way, with the loss of the copyright header, the file becomes
>> immediately GPLv2 only.
>> Does it make sense?
>> This is why I think it is best to keep copyright discussions out of the
>> SPDX patches review and limit ourselves to mechanical changes.
>=20
> Yes I agree this series should be mechanical (baring the file that is con=
tain GPLv2+ code).
>=20
> I am putting some thoughts below (they can be split in a separate thread =
if you prefer).
>=20
> This is not the first time this topic is brought up and probably not the =
last as long as we have file using GPLv2+.
>=20
> IIRC from past discussion there are two broads concern with GPLv2+:
>  - We are leaving the choice of which license applies to the person copyi=
ng the code. So if a new version is released that is less favorable to the =
initial contributor, then we have no leverage.
>  - Some companies are rather cautious to contribute code that my be licen=
sed under GPLv3 (would be allowed with GPLv2+).
>=20
> The later is particularly a problem because not many people realize that =
a fair part of Xen on Arm is GPLv2+. I never really understood why we chose=
 that (this was before my time) but this got spread as the existing copyrig=
ht was added to a new file. Admittely, the contributor should be more cauti=
ous. But I would not say this is trivial to spot the difference.
>=20
> I would like to consider to re-license all the GPLv2+ files to GPLv2. AFA=
IU, this would mean we would need to ask the permission for every comapany =
that contributed to the file. Do you know if this was done before in Xen Pr=
oject?

If I am understanding right, GPLv2+ means that someone could relicense the =
files to GPLv3 if he wants which is more restrictive.
Why do you want to move those back to GPLv2 ?

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


