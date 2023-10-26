Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931457D7F86
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 11:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623620.971633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwdT-0002gy-Qt; Thu, 26 Oct 2023 09:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623620.971633; Thu, 26 Oct 2023 09:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvwdT-0002eq-My; Thu, 26 Oct 2023 09:26:39 +0000
Received: by outflank-mailman (input) for mailman id 623620;
 Thu, 26 Oct 2023 09:26:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMne=GI=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1qvwdR-0002dZ-Nb
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 09:26:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c25a7599-73e1-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 11:26:36 +0200 (CEST)
Received: from AS4P192CA0038.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::7)
 by GV1PR08MB8571.eurprd08.prod.outlook.com (2603:10a6:150:83::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 09:26:06 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:20b:658:cafe::a7) by AS4P192CA0038.outlook.office365.com
 (2603:10a6:20b:658::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22 via Frontend
 Transport; Thu, 26 Oct 2023 09:26:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.0 via Frontend Transport; Thu, 26 Oct 2023 09:26:05 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Thu, 26 Oct 2023 09:26:05 +0000
Received: from 57ba27468200.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C5EBE758-B711-445F-8A60-C1C73A8B5870.1; 
 Thu, 26 Oct 2023 09:25:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57ba27468200.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Oct 2023 09:25:58 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS1PR08MB7588.eurprd08.prod.outlook.com (2603:10a6:20b:474::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 09:25:56 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::7076:8afd:7afd:f9e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::7076:8afd:7afd:f9e%6]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 09:25:56 +0000
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
X-Inumbo-ID: c25a7599-73e1-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OUpcsAy2JZcZRdBT4rBrPntr+IJg2TYEjU6YJU+mVs=;
 b=ryPlI31uD9VbyMRDVmQ7e4ktkm1lz8GGpnTLciYkfUoFUmyqbq2KOqUxa8Jo1zMGeM7X5gnq5fXjI1oWTnaRjK58iWo58jshcJN+y/ReWR+/jdPG/Us4zYVQTqj9eTiBscR1aXtrzK6K9f/rsBWfcK5db8Mjv+rIWEGy0i3itJU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09d05039b540a7b6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSBhBazPp6SM+ie5rOr+vBBCR9U90PC6y1Vub14+CjrA5gfU8HpD7rEQBdCv0/E3RkhgjlW71FtoDROYfiq8aorlWDLrFxu7fQS3ayrT9D2vazakGA8xcyBfWozyz0fScsGv+GipriSZJQjABcmS53Ue5tpon+FEM6o0txyYtdKg2xg0D0HP2zs4nelCbcZI6lSOVXC8alakKtC+gtURcI8P4JnXbvs3ENuuHHzyjv4yhOUX1+MwxA5qJPb0wVX0hW1vSfnl/bLphIW52lBVNyW+MctlRgN+MiJftvf6lAqfrFztEyl11rq1h+jtwR382V+nA+ay/12OCYhX8r9fxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OUpcsAy2JZcZRdBT4rBrPntr+IJg2TYEjU6YJU+mVs=;
 b=dNvOBoH8K5wFl3byThasiWlmTCSKXOv8LghQYRMeBK0HskNMwnV/ay1Z9mYl1J00Zk3GyLazLDBJThVSJJ6SQCakY8G3SFCoQJ3SAmcAdRV0kI31eh0fHsu6k2zNKrZfDILRb96R9lQSVRksd76Hkc2m1rZl/tnD6jdKWv52GVo7MrAMExYjcEJMycpvCz3UMvkeNBseKAqHqh9KYNRWaZMs+HiceBXq5TPEziIiJ9kHgCc3jRliKp2o5rtDrWBsVoEcQ/h1CpsLcRKtxl5ltGi1XhArNyrlNLGUi74AjWkZhRRTEVOKMjX2mkhy2aWIlMpwMRdwCu8InVVZD9OZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OUpcsAy2JZcZRdBT4rBrPntr+IJg2TYEjU6YJU+mVs=;
 b=ryPlI31uD9VbyMRDVmQ7e4ktkm1lz8GGpnTLciYkfUoFUmyqbq2KOqUxa8Jo1zMGeM7X5gnq5fXjI1oWTnaRjK58iWo58jshcJN+y/ReWR+/jdPG/Us4zYVQTqj9eTiBscR1aXtrzK6K9f/rsBWfcK5db8Mjv+rIWEGy0i3itJU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <27a09231-be82-4fa0-89e9-7d2b3f1c4940@arm.com>
Date: Thu, 26 Oct 2023 17:25:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/4] arm/vgic: Move get/put irq to a wider scope
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
 <89ca664d00a3cdcf3f68d8ae0c4a6c7b76965120.1698225630.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <89ca664d00a3cdcf3f68d8ae0c4a6c7b76965120.1698225630.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|AS1PR08MB7588:EE_|AM4PEPF00025F9C:EE_|GV1PR08MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 00706f02-a3f9-4d05-b54b-08dbd60594a0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HaMzSnL8T24SXFmFIK8kMYWzIaEhNSPWyqFZZxCBnjZfFXJif57C47IUk6uxbHV8skNB34gJ5t8GWFbqq6/c+ZN2rFNTaeVu3uDmF3D7wNayZqRCfqeL1FbJS2hRMgk5RmhpLLYtADIuZb/+9ceFLV9h/RRHM4tgAA6EQ7prNz0C/IdXmNrl6KKNVsY8KvBQltyQA+0AYSlzPe/95rM4MSGt7aGGkBhoGZgKHdECSzR9Y337yvFRWlGcvjbeanJC6eitY37VQChKZ0d/G9Rk9bZ/Tyxr2PjUGncHolRhj9NIxM/0tvb0Am3yjvd/d7wC2KMsUrY69hGYD291zbYaued9/V3Yvm5pK7eSLfV0FGrd3shEEVeGReGgJsZ8s3C6px1pg0iIjawO3apdSukr7rTY8AEX99+PfZ5+OWb1TuGcH0/RYNzHmEuKhj36f+pwHM+i61xzuhsYW7F9sTsq7hfCzdToybdmoxk/oj3Wru344cmhXoYFffCssbDj7Ybdgfx1X9CXgGT/Br8dHSLozM/8ATv2ybs6tawyATLXNyr5GqFkuF5aRhz7M9K+y/FNGcFQEqm3jLOIV2rhTo6NhJ2ikaqB/gzx0bWsts84JxlM7dGLdZlJB0n0nrCxm7Lxf+Gqw1w/0jDto2VhLpG5vQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2906002)(86362001)(38100700002)(41300700001)(6506007)(54906003)(110136005)(316002)(66476007)(66556008)(6666004)(478600001)(6486002)(6512007)(53546011)(83380400001)(31696002)(5660300002)(36756003)(4326008)(2616005)(8676002)(8936002)(66946007)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7588
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6500c083-484c-40e9-e469-08dbd6058e9e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LktVeWYl8T1bnOetIYdHyXDyY6LR/CJFag0SVMLF72w4dTNmiqRWp984TnaSXQFRfHBkYRb9fxIIMWrR5l3q7awM8qc4oHtobXBM7JmWmE2/qZSktpNWSdy1kAtsLOlw1g9Yuaj6at9B27ab5ANYnOL9GRwj6JfCBCRU+KSiNFqR28URoZdeaFPE7Hp6F1EeWQWI9B4Dd9k7LivSlQlmMfLDkripcTyxHR0LOcNrIJ0CM84rvwTtV3wyU9Pda8LNMlBGMhaI97ydgTsaWfUwzVKFSyixleFtSikIk61FGybUlyfyZuwxzEocCyK4oa9S7TvXnVHbATpmpWlFwXww47OqYDsEZ3Hdt7oxWAWmsAXGLC7Rdzz+ULok4x8BnrooWFETNvNS936++KhwkmI0WTOOQNpQ9Zq3pTrakY74nf4WNjMpmhPsf+JLe4tapGNTsZwuO/T8RNPXUyv3nvoDtqwQDk0tq14dQh5dW0B6Iy1qWFSjiFLrX02L23ndTlEK8b/uwnIuUTviNeZFQ3u+E22hsa58l94Fc9NSgqPoVgYofwg6Oq7RZGuip95fSGlFJ7mR3Fy1Sn82ThVoJG8SRxaAgJYmcN7aUXg+DAeCVXY5r4QYOKsW/PPANtIGTPmn2jQn7qyjCu5xY0D+qk3rdsH+POuH6+YagopZ7MISNfcg3PlhHIlUPzKPUGzXOj6jlHJcyApej2rygBZ+eZ++L8KL7omF4ypxzrKSQ6TboDGlpEvELC7KKKhnlt7ZVl7u8vJ/MCW8Js2rYRVBkrldvw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(53546011)(6666004)(478600001)(6506007)(107886003)(2616005)(70206006)(70586007)(54906003)(6512007)(110136005)(36756003)(31696002)(86362001)(6486002)(36860700001)(336012)(47076005)(83380400001)(81166007)(82740400003)(26005)(356005)(41300700001)(8676002)(8936002)(4326008)(5660300002)(316002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 09:26:05.9329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00706f02-a3f9-4d05-b54b-08dbd60594a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8571

Hi Mykyta,


On 2023/10/25 18:13, Mykyta Poturai wrote:
> We will need GICv3 code to access get/put irq to inject LPIs for new
> VGIC similar to how the old one uses irq_to_pending now. So move
> get/put irq to the same header file.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/include/asm/vgic.h | 6 ++++++
>   xen/arch/arm/vgic/vgic.h        | 3 ---
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 922779ce14..7216ce82b7 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -387,6 +387,12 @@ void vgic_sync_from_lrs(struct vcpu *v);
>   
>   int vgic_vcpu_pending_irq(struct vcpu *v);
>   
> +#ifdef CONFIG_NEW_VGIC
> +struct vgic_irq *vgic_get_irq(struct domain *d, struct vcpu *vcpu,
> +                              uint32_t intid);
> +void vgic_put_irq(struct domain *d, struct vgic_irq *irq);
> +#endif
> +

When we move the put/get here and protect it with the CONFIG_NEW_VGIC, 
will the irq_to_pending also become invalid?
Similar to:
#if CONFIG_NEW_VGIC
struct vgic_irq *vgic_get_irq(struct domain *d, struct vcpu *vcpu,
                               uint32_t intid);
void vgic_put_irq(struct domain *d, struct vgic_irq *irq);
#else
extern struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq);
#endif

If so, subsequent changes to this file will be confusing. Can we add a 
wrapper header file and include the specific vgic implementation header 
file through the CONFIG_NEW_VGIC macro?

Cheers,
Wei Chen

>   #endif /* __ASM_ARM_VGIC_H__ */
>   
>   /*
> diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
> index 534b24bcd3..c6bc3509a5 100644
> --- a/xen/arch/arm/vgic/vgic.h
> +++ b/xen/arch/arm/vgic/vgic.h
> @@ -45,9 +45,6 @@ static inline bool vgic_irq_is_mapped_level(struct vgic_irq *irq)
>       return irq->config == VGIC_CONFIG_LEVEL && irq->hw;
>   }
>   
> -struct vgic_irq *vgic_get_irq(struct domain *d, struct vcpu *vcpu,
> -                              uint32_t intid);
> -void vgic_put_irq(struct domain *d, struct vgic_irq *irq);
>   void vgic_queue_irq_unlock(struct domain *d, struct vgic_irq *irq,
>                              unsigned long flags);
>   void vgic_kick_vcpus(struct domain *d);

