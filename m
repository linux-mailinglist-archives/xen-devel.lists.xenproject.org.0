Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9068D74359C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 09:17:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557298.870528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8N8-0001WP-Sy; Fri, 30 Jun 2023 07:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557298.870528; Fri, 30 Jun 2023 07:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8N8-0001UR-QA; Fri, 30 Jun 2023 07:16:50 +0000
Received: by outflank-mailman (input) for mailman id 557298;
 Fri, 30 Jun 2023 07:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ltnP=CS=arm.com=Hongda.Deng@srs-se1.protection.inumbo.net>)
 id 1qF8N7-0001UL-Sg
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 07:16:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1352db43-1716-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 09:16:48 +0200 (CEST)
Received: from DUZPR01CA0136.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::24) by AS2PR08MB9428.eurprd08.prod.outlook.com
 (2603:10a6:20b:5e8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 07:16:39 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::cb) by DUZPR01CA0136.outlook.office365.com
 (2603:10a6:10:4bc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 07:16:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Fri, 30 Jun 2023 07:16:39 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Fri, 30 Jun 2023 07:16:39 +0000
Received: from 3dfd8951f8f9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A3D7A7B-DE7C-4F68-82BA-18594CF8EEC8.1; 
 Fri, 30 Jun 2023 07:16:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3dfd8951f8f9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Jun 2023 07:16:32 +0000
Received: from DU0PR08MB7664.eurprd08.prod.outlook.com (2603:10a6:10:315::5)
 by AM9PR08MB6004.eurprd08.prod.outlook.com (2603:10a6:20b:285::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 07:16:30 +0000
Received: from DU0PR08MB7664.eurprd08.prod.outlook.com
 ([fe80::cb0:4e8d:4db8:a429]) by DU0PR08MB7664.eurprd08.prod.outlook.com
 ([fe80::cb0:4e8d:4db8:a429%2]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 07:16:30 +0000
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
X-Inumbo-ID: 1352db43-1716-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoXiutiUDdcwntf5OsT+/rRYVryZWxjgehEe7Z76IBg=;
 b=U61dMlbl/9TYe6s0ZmSxJhKdJ7faQO9hDZ/zvJBASOBgdLFrqjFx8JfEplb5rTc/uNVQ3SPC2q6CURkyFwutCmW8I+Xh3Vz3EoGf/FMel/oNAEXo6WA3zTRoRxVDLmWs56or8BGGosecQPFQ92VU/fSuDW4cBQo8k1PPolcW7pI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bab314920bbc24cf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ft+ONMk3Wq0xM/fVkS7o3gwA4xoBv3VXk3YZkYfBLXxNBpRWN+71kAcw/izXkhJA/1VYObdixzZ5ce8bhZQvv3pITOLVkEj9/ltN60v7ZsEzc1+yJqE3mbNCzDn0TQuDIzyBHOa5PsJqkJjB3YI+DLoJu1mJlUHSPL2f9P4FHeLqOsiniBZEuQDYW/2d/GDhvumjMHfIrhx0npqzr1beq5CkqL40yBKU8MXoXKIWwIN6cFbCXz0KG+cSUS1rxcMU27hfGftQ9iUsZu23AICeFnI7v9vNK4itGx8m5EUreYxFPCAq2yvEB+DSLYVqpc4YTl2DsDv8su4EjFEL56CLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoXiutiUDdcwntf5OsT+/rRYVryZWxjgehEe7Z76IBg=;
 b=YStMCWu3PP1B9goegtHF3q3EUC0ygaFCsCFqX+hzw0JEocigcDI+72qIqWkKaMjaGfaex2QonPMU9TPW+VN2jQw++asiWX7XHHIUt3VsAkeDVk6D3U7Vi274ABcZq5gOFAHsMbdlMxCLFFtPg7VoUE524sLAgnVoDKpl2YVBQKZV8U7xmHScAUAcSF7iTnXuc1uLtWM5rOkl3cNVlF/R7OMC1/FricZrzJTz2SNzzra6wqDk6gqz9+fPqM3msubWHq1rZcSeFivrcHKSrXRSCp1y1ZDEVMhLD4oBaQKB3cKsLC8P0GxanabLGYbYzg7XXxXp8Jt1/rwHCtEGjaSM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoXiutiUDdcwntf5OsT+/rRYVryZWxjgehEe7Z76IBg=;
 b=U61dMlbl/9TYe6s0ZmSxJhKdJ7faQO9hDZ/zvJBASOBgdLFrqjFx8JfEplb5rTc/uNVQ3SPC2q6CURkyFwutCmW8I+Xh3Vz3EoGf/FMel/oNAEXo6WA3zTRoRxVDLmWs56or8BGGosecQPFQ92VU/fSuDW4cBQo8k1PPolcW7pI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <22f8c911-8dfc-49d6-b707-aed646aa716e@arm.com>
Date: Fri, 30 Jun 2023 15:16:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: vgic: Add missing 'U' in VGIC_ICFG_MASK for
 shifted constant
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20230629221800.1478182-1-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2306291603010.3936094@ubuntu-linux-20-04-desktop>
From: Hongda Deng <hongda.deng@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2306291603010.3936094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To DU0PR08MB7664.eurprd08.prod.outlook.com (2603:10a6:10:315::5)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB7664:EE_|AM9PR08MB6004:EE_|DBAEUR03FT048:EE_|AS2PR08MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e948c1a-3f64-4075-d064-08db7939f2c2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 R2WbyN7+IAKnmqwM1ot/wb629WjoBWxBc4OidnnJ5cbaCg1cuD4m8iZrzUGT0lJGdNPb7+RBeTq4oqH7hIsVm16cbogaFpMhGaPHB4hKjzl5A1IVU9G5bX4YvAzJPjMdCi56nLJdlps6MbZl+TeHOeUkyk4xLTU+hvPwuA+mbOY8hPADSlPEwfrfE05pihl8HbfNeipR69w77b8l3oz1QIZ2XIeSsiy38MVJJYPcuCj1m6CpPnbIuYmzL9LQk7QixnDJ04pjmusFZwfo3vGGpXutxsak9iv6ILNgNI37GJ+E2bM1gvzf2XnF5VpXCOJ3MdStBXUemF5tSk1XXLgtPxAgfwNVMRTJzMlsGKEAi5ERAgvlKo5e8J7f0BpnIZlYLB+49nwB0OQyaqe02lajTYrPipJLTLUVn19g0yWT4oHbDq9UNF5ctnM8vby1JlYL8edkU25wCfbrhWqrgSBoSVYboHVIM1iY4O8fOKQINp8l6pjZs4VDLuQ8EMbSVRvsaOIvnJQQj3BydEcg+T7CKPf8mQlvcRuIO4l0RjyrPCioqvPp8awNJSm3ik0TTL2DQd0OU/mxlPI4BM1OfS2EhZwQdLk39RPKT2u6rSGclm2jQYRqJwrWxqwbxO3/rOaah8Tzb01IzNlpCEUBmdl8qQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB7664.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(2616005)(66556008)(6916009)(66476007)(41300700001)(36756003)(316002)(66946007)(31696002)(44832011)(86362001)(2906002)(8936002)(5660300002)(8676002)(83380400001)(6486002)(6512007)(26005)(186003)(6666004)(31686004)(6506007)(53546011)(38100700002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd65b9ab-5138-4fc7-957c-08db7939ed29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c7Qki6ZJDBXYEF30g9uKjf8uI/OzycY3OSw4KPgA12MTn+ywzeBChNby5PwniWJUgrPOoRcMQCNm0FmKwJY8h3MX/zl3d8vBgQkWqytZiLId7TsRWYaUAUTMKjKjQY0bjvHHnyfmyCI5ktkvaYk/bN+ub+ZQAmJEzghyAf/tX61AnSAYENBVmS+wVJaRX7v/Xvc4j7eE3rSDlhgIeOzRQH3Nd1oDQx9I2v8uFvo8l0dmWs8C1w4oNcP0UQiiW9JZKDqKJgKNt4a+yMf8djD8Z1S5abLK/9XgBo/tPxH3z6mVgzdVJCd18q2fJEYQWwbvZr5K2UjbghvnbRrmppjjlqYBfrUVQZlu7hj8Se/gtFAWocLwn6MNy/P0l1ZLeAuSvKcTIL9hIBo19kEFXobvCv5wEs3wjXl2cqldf3GFEl0yuGufSlHH3be/uoxrXCUrAb2ZKOseaYEfOQbDkrx0bcg9uG+ZLCPFO3IWrVSYdglxH1gni6JSbZGd7bdncgG0vmoQMC3ZCZq52nfVDAqkrxyYR1K30r98seGf7s0v/BnQtlXY32xMozXpBKU9fDGBnNI8axFlzWyIOq6OPfrnQCyzmI9Re5ksoHHUrEVWL4/xs4CBYEjasPRrpL88KblIH60htcDY3rgRICLugol2331yIlUh6SVVmjiYOvhp2lkY4nSo7P13aoWTj8mD6oOvQhmRM0ONg2M3pEnU6iMU6WYXmaWwYOnKV5vvSzC2L7zjsNdUK8dTCsNeCTbVUglyu5qinIRsgoXodK2mT7vT4A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199021)(40470700004)(46966006)(36840700001)(44832011)(31686004)(70206006)(36756003)(70586007)(6916009)(478600001)(316002)(5660300002)(8676002)(8936002)(2906002)(336012)(40460700003)(41300700001)(40480700001)(86362001)(31696002)(82310400005)(36860700001)(6486002)(53546011)(6512007)(6506007)(26005)(47076005)(186003)(356005)(6666004)(82740400003)(81166007)(83380400001)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 07:16:39.5851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e948c1a-3f64-4075-d064-08db7939f2c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9428


On 2023/6/30 07:03, Stefano Stabellini wrote:
> On Fri, 30 Jun 2023, Henry Wang wrote:
>> With UBSAN on some arm64 platforms, e.g. FVP_Base_RevC-2xAEMvA, the
>> following splat will be printed while Dom0 is booting:
>> ```
>> (XEN) ==================================================================
>> (XEN) UBSAN: Undefined behaviour in arch/arm/vgic.c:372:15
>> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
>> (XEN) Xen WARN at common/ubsan/ubsan.c:172
>> (XEN) ----[ Xen-4.18-unstable  arm64  debug=y ubsan=y  Not tainted ]----
>> ```
>>
>> This is because there is a device node in the device tree with 0xf
>> as the interrupts property. Example of the device tree node is shown
>> below:
>> ```
>> ethernet@202000000 {
>>      compatible = "smsc,lan91c111";
>>      reg = <0x2 0x2000000 0x10000>;
>>      interrupts = <0xf>;
>> };
>> ```
>> and this value is passed to vgic_get_virq_type() as "index" then "intr"
>> in VGIC_ICFG_MASK.
>>
>> Add the missing 'U' in VGIC_ICFG_MASK as a fix, and this should also
>> addressing MISRA Rule 7.2:
>>
>>      A "u" or "U" suffix shall be applied to all integer constants that
>>      are represented in an unsigned type
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>
>
>> ---
>> This patch should be based on top of Julien's series
>> "xen/arm: Enable UBSAN support" to test.
>> ---
>>   xen/arch/arm/vgic.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index c61c68870c..97d6f61066 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -358,7 +358,7 @@ void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n)
>>       }
>>   }
>>   
>> -#define VGIC_ICFG_MASK(intr) (1 << ((2 * ((intr) % 16)) + 1))
>> +#define VGIC_ICFG_MASK(intr) (1U << ((2 * ((intr) % 16)) + 1))
>>   
>>   /* The function should be called with the rank lock taken */
>>   static inline unsigned int vgic_get_virq_type(struct vcpu *v, int n, int index)
>> -- 
>> 2.25.1
>>
Reviewed-by: Hongda Deng <hongda.deng@arm.com>


