Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA67AA688
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 03:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606671.944666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjV0P-0006xD-Aa; Fri, 22 Sep 2023 01:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606671.944666; Fri, 22 Sep 2023 01:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjV0P-0006uj-6C; Fri, 22 Sep 2023 01:30:53 +0000
Received: by outflank-mailman (input) for mailman id 606671;
 Fri, 22 Sep 2023 01:30:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aXRy=FG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qjV0N-0006t5-IB
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 01:30:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8636d9c-58e7-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 03:30:48 +0200 (CEST)
Received: from AS9P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::23)
 by PA4PR08MB7460.eurprd08.prod.outlook.com (2603:10a6:102:2a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 01:30:46 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::d5) by AS9P194CA0019.outlook.office365.com
 (2603:10a6:20b:46d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Fri, 22 Sep 2023 01:30:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20 via Frontend Transport; Fri, 22 Sep 2023 01:30:45 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Fri, 22 Sep 2023 01:30:45 +0000
Received: from cd7590275c0a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 487F3CE4-CE74-406C-87CB-FD924DAA8702.1; 
 Fri, 22 Sep 2023 01:30:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd7590275c0a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Sep 2023 01:30:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5328.eurprd08.prod.outlook.com (2603:10a6:803:13a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 01:30:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 01:30:36 +0000
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
X-Inumbo-ID: a8636d9c-58e7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+WsQJ+PBJm+W9JYsD8tDKoIcVxsXAFEaZYWIMcTypc=;
 b=KZGZ7I5+4azJC+nv+2NETL0BeNTRmmljV4b9cfGaJyqAOHgLH6CI2spXUrJ1NxzOAB3vQTm0Bsqjc6Zpl2sf1R2IX/lyU3F+OtHzSm/niNvIjpADm9ZHeK9dkvMDr60Ux4AMFg6gtF/Y9F6L48KRfzg3ob92HMaO4dmyOWkLUeM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d59b2d05c2fd3d49
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+mT+ubCO7SR2ED4GCB60mMmlo58Atv+ytxdH1prtjrNq0uFNWGQA3frBBIZ68oaUWD7hslPkPhSC1h+7T6ChWRR+dxWoKj1vNb7BJ1thI2hpru5dQFDtQx6R5jGFVRIEbnsTzQNceDaUT6S2DypoilvJUzRbNtsGQyevWxWZRVmPsyQxMu+yKf59er5pwx59sWX/cP9lTD0WD29Pp/21W7u7rufdXtYHTOcjIHAu3znoPlfLehe92SrXdSl71VO/97WhAiFeqBMssPwS/tuTUz6Yc1YPy16j6n/XlSd2dL6ATZLY+xWcz9bC+Pp0d7I0qZVq4Bpj2PebvyUGblHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+WsQJ+PBJm+W9JYsD8tDKoIcVxsXAFEaZYWIMcTypc=;
 b=OQ0Bhew8MqUkF+7gXGKOV8v69lbgcbOZEdwbQQOztSV2Se2byKPRzBQgmdkOv8wuPq4VHN2Id6ewgskqBJTsMpCb0ShKgPwmna129npHSQP7W+i3LYWvOjBiUpSvaB3c7uAouAg/labrQ92EldmmLmZpoMfsaT7nymEfOXqc/6kJ4IVja6J+t64A4GQclNbJZY1OmHgm1VT8VDScsDk7/9q/TdVnUKe8PTyxuBN9DpnpZc6jttGvLxAiVtakN81lM7pn+idT0+OI677amUYUZIQFDkptK6W3VyQGvU8n2aTuJEh9SLZO7uiF79eVEG+vdd3aOYz3hxEUdwEI5GOZWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+WsQJ+PBJm+W9JYsD8tDKoIcVxsXAFEaZYWIMcTypc=;
 b=KZGZ7I5+4azJC+nv+2NETL0BeNTRmmljV4b9cfGaJyqAOHgLH6CI2spXUrJ1NxzOAB3vQTm0Bsqjc6Zpl2sf1R2IX/lyU3F+OtHzSm/niNvIjpADm9ZHeK9dkvMDr60Ux4AMFg6gtF/Y9F6L48KRfzg3ob92HMaO4dmyOWkLUeM=
From: Henry Wang <Henry.Wang@arm.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v2 2/2] credit: Don't steal vcpus which have yielded
Thread-Topic: [PATCH v2 2/2] credit: Don't steal vcpus which have yielded
Thread-Index: AQHZ7IaORUrMbawngUSqIrYhJSNv+rAmD6wA
Date: Fri, 22 Sep 2023 01:30:36 +0000
Message-ID: <36C4D18B-89A0-4B29-80AF-289C41B08E97@arm.com>
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
 <20230921122352.2307574-2-george.dunlap@cloud.com>
In-Reply-To: <20230921122352.2307574-2-george.dunlap@cloud.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5328:EE_|AM7EUR03FT054:EE_|PA4PR08MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: dba0f324-63a5-4d1b-5e96-08dbbb0b8b2c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nCR3NvV0U/9LhG1CcVx5vmOLseyUeRbQmz5GREN5lK1tOfPQVsSehlGo6i4vEroXhn3EEf65422mlWHOcQsaWaTGGYWrMuU1FNZqz0edyRZ6P64rLYzEPCO11hUczDCXIKdXi8wvPgVPj0qkqhrYsSc0MDxNbKFHbtd8haqWWu60DZGls7ZCQ4ZDMuMnyNJC27LY9zJ7hMDzZK9Zh273A59yF2f+NmMVZbCqL2AbYED7oPPOURkHQ+vTk5YXG864+kbs3YK5B/heaRg8SDJKDska08CmrGzeHleyzy52etDNWpIDANsIx99tvFNiOy/FiiRwD46eVpUJNrLB/PG6oC4bYOM5yK8tYksGrWH2iW+3E5147E5j0ffN57+Ua6lQf5LXWeSKjy5t2m/b0zAtuLT4kVx9D27qd2BnUD6H3aZsp93EhfzguURhyr7lD/yctJUFzAdSQRlSwoWQ6nMB++eh98GxRzgsi/1bQLhOzxxjBifWB3JXZG5MzfjiiYIQuA27Fq2TAVmx4vaBqOmHVeeeYt6EEwYWsnh60E9hebKTy8MO98rvh6T57RC5elCUqSTpOl6HzMfc6sFgMQwm0f0RB0GvxpjgBRPELGWgkmhqw5fYqRk9ULusrEAeg+aDkgM67aBjXk1Ng15s3c1rhg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(2906002)(316002)(5660300002)(54906003)(76116006)(4744005)(26005)(41300700001)(6916009)(66556008)(91956017)(66446008)(66946007)(64756008)(66476007)(478600001)(4326008)(8936002)(8676002)(71200400001)(6486002)(6506007)(53546011)(6512007)(38100700002)(2616005)(86362001)(36756003)(33656002)(122000001)(83380400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2A4590D597FBC74C9B2A8C4B039E907F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e454db36-5320-4d73-31fd-08dbbb0b85c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	StNXLmSxxvQlLDiDA6NyxSCvk4oSvkqPCrXXdCHzfl7XLrvuwIN864b6Pf9UTSkLQ/ngrcMeqqDREwjj4rOyArhen4+kSkXT5GROOgNUZtqf+wKkxQWyMP0AwiWKo2fMAu60uRiiEbGyCxwJZcQ1O7pxGUP2s5j/h8xF7c3EmQEvPSAOy92QdC308R5sx6LSVD8EQxvIvjMPxZ7KAZmsEhhLplzsJCC4ESZfjk22LjefVe+QboOMMfZbOQv4qJq6J1cPIFEBem9gk0bzMXoMdF2xHEiZogjPBvFzkPrp7QW4mOYqhUeBc37/kmQ4I+iMNR7I4ot3Y0abivU0n7MDQeELewGIvc66b4K3o5XE8Ra02WHQsAo1HZei6EwBXmnDhuQIu9hnwh0l9CwG5cyiIs865+4ZCsWDsSAF4vigLihJY/RYmllEY+iUgCNZ2pJ24owIV0nkQ01EGUByZwj/v8+Xn/xGf0+iIT40mvmAKCyrLan+sS+mf5e6JtKt/UJncPJ0ST3z/yPMEajBvswBssleZVSIjz17g73desBzebN2cUVWtuBubGNWBRBoVC69xlgIzydOnWVaGPUVADYh+sP8r5MoMa6KHp4LSM+IHv0qGBTSL2+GPweav2Dumc6c3ar8JpuKVFl8AoY7lcGAgOEcm4upEV4cNFcN8FsBaN+DamqAVXvWpUQP4ocjn6CPswqsLO+JmBOOhcZh9cljOXdm3v+2fndaxgVH9UE6f/J8uJnl1eZsVfYREeAGt7M2jwX+S0UU87K9txEvWoPV/Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(82310400011)(1800799009)(451199024)(186009)(230921699003)(46966006)(36840700001)(40470700004)(53546011)(26005)(336012)(478600001)(6506007)(6486002)(6512007)(2616005)(47076005)(83380400001)(107886003)(2906002)(4744005)(5660300002)(4326008)(6862004)(8676002)(70586007)(70206006)(54906003)(8936002)(316002)(41300700001)(40460700003)(81166007)(36860700001)(40480700001)(36756003)(33656002)(86362001)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 01:30:45.6407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba0f324-63a5-4d1b-5e96-08dbbb0b8b2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7460

Hi George,

> On Sep 21, 2023, at 20:23, George Dunlap <george.dunlap@cloud.com> wrote:
>=20
> On large systems with many vcpus yielding due to spinlock priority
> inversion, it's not uncommon for a vcpu to yield its timeslice, only
> to be immediately stolen by another pcpu looking for higher-priority
> work.
>=20
> To prevent this:
>=20
> * Keep the YIELD flag until a vcpu is removed from a runqueue
>=20
> * When looking for work to steal, skip vcpus which have yielded
>=20
> NB that this does mean that sometimes a VM is inserted into an empty
> runqueue; handle that case.
>=20
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

