Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB150FB30
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313758.531483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIeU-0006ZH-1Z; Tue, 26 Apr 2022 10:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313758.531483; Tue, 26 Apr 2022 10:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIeT-0006Vu-U5; Tue, 26 Apr 2022 10:42:37 +0000
Received: by outflank-mailman (input) for mailman id 313758;
 Tue, 26 Apr 2022 10:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BNuI=VE=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1njIeS-0006Vm-LQ
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:42:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9568683f-c54d-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:42:35 +0200 (CEST)
Received: from AM6P192CA0050.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::27)
 by VI1PR0802MB2205.eurprd08.prod.outlook.com (2603:10a6:800:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Tue, 26 Apr
 2022 10:42:31 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::b) by AM6P192CA0050.outlook.office365.com
 (2603:10a6:209:82::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Tue, 26 Apr 2022 10:42:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 10:42:31 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Tue, 26 Apr 2022 10:42:31 +0000
Received: from a0d89235cae0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88B32DFD-2546-4D97-9D78-87E720E2570D.1; 
 Tue, 26 Apr 2022 10:42:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a0d89235cae0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 10:42:24 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VE1PR08MB5261.eurprd08.prod.outlook.com (2603:10a6:803:10d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.16; Tue, 26 Apr
 2022 10:42:23 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:42:23 +0000
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
X-Inumbo-ID: 9568683f-c54d-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RucakaD6zxeQsL+/ALY/nGZ2tuEUDf2kwPjWX19/T+COnxtAMe7ISXU8VnQ4hiTrHNUsE9T8io4r89rrf5UOHuD4OO9ryU2xgLwgL2rkpHVzz4eHDQ5VI48NmLpRd3CxbER1M0Pi9GqCzh49WtJJxbHX/evxyFc1AogbsiT1MSNN901KP5IqpmlFZ6RC4QJTiEGfNHbMlrGzmzkJAhtvzn3nsXP76IyFcMcVpIqR1pSsU50U6ycEQj8iu/TxukHaSgQ5yDol6XOc0Mgn3U0xia1maXrw+5dwnl6KUjQOd4MeAq0W5eaehSfO2DcSrBFNEI0MCO29CYZOAWgwUdXqAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOOZTuLcj0JpB7z4ygWsT6hFRft+aPwJKGfkraf1cM4=;
 b=hwE4vqH4pNa30Aabi3HUWVdz1YJpqeZHz7bY2tiuCkm6uXoLfx7BOb0w7bmsBdX82tB/uRC8GWpPp1R7wYj3bqzID0VsxUeVJ3hjpYzQ4m1iOcUlc+DhN+G6hRcCWSvGjVFhy0EL/s5xBh0V67fdtJVqLAm3xVRYKyQrswDJAivHcn8gKA6I/4efGBnDSG8aO1YHyPwIe2g2FrbWTCUwVCASnQp+RjL8ceTcn/doXFnD2BOywomO5KpSar9jzFgT8Z5z3xyTGPbYmo1LpHQjoQFeitUXl+H1ZROKOg9DQERQsox9uIVMKHrIpLCvYh/fapWaRSiIHNFGcSMeg4dTig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOOZTuLcj0JpB7z4ygWsT6hFRft+aPwJKGfkraf1cM4=;
 b=cEfvDZK0Mor/sASckSM7s2P3X+aUNcEzSmEmXS/GRQDhfAqTv1L7ZX8VqNrpdQwaG8tvdoswlko55cTxRX2Xt51ACwbTg9gRREdawo+bAJSRFT0SAoZJEdYIoHOkZ6ozuh7Mh2FzRGOSML3JC6II9ex0K50ubmV+lABRGUm8DlE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8726107b3360404
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGMI8j5NuRfCyKyG4b1dXXanr3pne4Xmx6G4InvMpwG4Mnix9JBtgOGcSbMBKHvb8R77R9Bqctwnnu3BQGzIrYBhf/4iTBmryFTneKcBniGVNOVV8jCWpIfe9AGli1hBmDs8DrjtvPNeSa/22pTBPp3JM9JznMVDOkRYGatu7A4AFv7T37XPV+2XCDwBQlMTturh295OCMm4uAXc1arKCcdY+hSHELbvgVN+KwSnNwMR8BogoX1Op5PrFhur5xTYqbyIbiq6zqVaI9N1NIwT8sRxJ83oTHky0GwDwT9T4bxCds7NVgmv7WbyUwdVrwlhuQJjB7aHd5WVrtOxH2sRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOOZTuLcj0JpB7z4ygWsT6hFRft+aPwJKGfkraf1cM4=;
 b=REy/3bKIAuOgn43QNXPkOL0ICOkBJQtMx5OgT51NkZrBrPDS04UHyCPh3KO4wkytAbpme+/T5qttA9wmD+i0u8qmafIa2EOQyT+no2bbZ7OWWTkFQf1Rj2aqdIcWeNYZi+ZKH/mGSQZdvIPWOwhjRgiZWukuWRoSjFvtVQhSq2XBoiZk+aE2to+HZUKOxkkw8AhJ1WMX/DWf36RBZsQIrb9bwuMMh1wAC+iGs0BnA2uMbPoHzPlkkK66ydtaiXNGgtNj0poS7oN4jcjtLneT15aKoEpBnrSefTC5VmqRSj6yHgUP+bOkUTXc+Z39K3WRF7rrOs+3o+2j/9iy5nHDNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOOZTuLcj0JpB7z4ygWsT6hFRft+aPwJKGfkraf1cM4=;
 b=cEfvDZK0Mor/sASckSM7s2P3X+aUNcEzSmEmXS/GRQDhfAqTv1L7ZX8VqNrpdQwaG8tvdoswlko55cTxRX2Xt51ACwbTg9gRREdawo+bAJSRFT0SAoZJEdYIoHOkZ6ozuh7Mh2FzRGOSML3JC6II9ex0K50ubmV+lABRGUm8DlE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <86c88329-ddca-a566-ddb9-e50917b8ba80@arm.com>
Date: Tue, 26 Apr 2022 18:42:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 09/10] xen/x86: use paddr_t for addresses in NUMA node
 structure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-10-wei.chen@arm.com>
 <8a966300-e3a7-64db-b8dc-cb8386b2d11a@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <8a966300-e3a7-64db-b8dc-cb8386b2d11a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 72477d30-4e93-45af-07cd-08da2771777a
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB5261:EE_|AM5EUR03FT035:EE_|VI1PR0802MB2205:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2205DFCDB51FBF34D5250B679EFB9@VI1PR0802MB2205.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Kr7MoyI4kBiSPp+7pVlmZXDXq2VE5B3BzQVmBiDCfWeMfLuCazlNtfo5bPVcqMNX4teuWsamDdnuRPvDKHOthwlcBDCZTUyaWeWZCOraYw3Y2ZYtFdR6L5cLRi/atGumkxYhLBSZMQrG2GDemLVbNFrOVADg4LJ1faA1lO0CvDM+YcJhWeZbQ5p/v3NOfrEssCy0nSx4MZndU/QIKvPT/6OiAzpma3YH6RT4U2J6o4pYGoNF6f3S1KaHqu8UyTE6UuVtg9AiqriMRZpK7BGdNdzF2EztpfseZ5ZyBCr5Y9X4300FGTh6AVG3c4YzaUUNRCgjh3rK8IIbmpKA0uxJeu5AVEey7Fa9HQVfvAGxXyBrYJ7bicBGMVM913UQOILFwl3dnYOzj3+2kP/d7A78oK3RZhZ9gXrfxF1H9RXrVOOKt+bzf5lPyQ9mvKZRGVxGOCkBfqFnx6nW5USI0CGWdZ8Qa0odj8+dIPrwpBSOj4GqOV8eu/+9SuTL9gzulMzo4/I+Jl4CwtRjSg9d9fqgSpFR1e613wnih2i9rODNOxSEZOMAln5YLmnMAwZE+Mk7KbOeBey8/y0vW6yNbUdHvJFQbrwkO7dOWFTXnLY1ROfqrkniFP9GRmMIb4nWnE+CiK8FiOOtIEC3Yz/jaRsaCYKwvFEGXSGasKWPyF5kDDWecrBMQbbQvwcwLkYotTKHL2gTeufvmdZw+0lND1pQDwCTXvLJGaoTfay3KTyh/qc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(8676002)(186003)(66476007)(4326008)(5660300002)(66946007)(36756003)(38100700002)(31696002)(6506007)(6666004)(26005)(6512007)(53546011)(316002)(6916009)(86362001)(54906003)(2616005)(6486002)(2906002)(31686004)(8936002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5261
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9fdd53ac-0de3-4f8f-8da5-08da27717261
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aEfeMYcWurAXkGD0aaMtbG6UM+hgSSmX0Pt4Q/R2jx3QIaiImyJB4n0RPOHjgVOzDJNfUL2qBJv+fvisz+GKRPH1+YRi+Jg6NEV83LVX/SPMvfpWIXSNMRVf03XAODGUkzncpRXe2oXIxWXSBFI+3bOL/lq4jFBkldJP9BxSNAfPvYW9A9oM81aLgrGOj/shfEnxixhGO4YsL0lGTUEyohS+Bon91Z+cma/h92UTVuJF6Fl7f3WJZsKqzj51mQZAnrKEOtGD+0KVwf0+X4taEP2asEimsRdtAZQPemycxJIiz8dehYxdqrbW/+6cV8gIGEyhOs8twzs+ZXPLEdNaXnx/MnfmrC/X++Mep+jBOOUBbfBhpqTFE0E+KHG6HNpYRRIQSsa6nDaGD3wxMoGUYRZQ4en1Co43zs2+InqDFtj0ZUiFeVnIPdy4ukmSWb1sVReyi+9RV2ESZM+30x98QBqOIMfKFWyiy/uY8d1pcGS7UZIqoL22Cc+8QTkhfUFx7+hDVoKqg8Rq1UqapcLrsH5RzW6k2Yh7+QDawVRNYrfGaYbmjnlqTlLuGmKTx0NwnxddkW0jvgSMiWFnxU2sIrSLWE6ujMMZR/J+ezGFQHx7mHodtWL3WcVhh46yBGsxRrJNTeX1bDeePyAvC2ULzNwZdH41SB680Cgc/GAoS1oXXzOSs5WAY39vMsX3zzGmkSfRFh1qpnWOc3dUhoJW0Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(6486002)(54906003)(186003)(508600001)(8676002)(36756003)(70206006)(70586007)(4326008)(6862004)(86362001)(356005)(31686004)(31696002)(2906002)(8936002)(2616005)(47076005)(26005)(336012)(5660300002)(82310400005)(40460700003)(36860700001)(6666004)(53546011)(6512007)(316002)(6506007)(81166007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:42:31.5016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72477d30-4e93-45af-07cd-08da2771777a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2205

Hi Jan,

On 2022/4/26 17:11, Jan Beulich wrote:
> On 18.04.2022 11:07, Wei Chen wrote:
>> v1 ->v2:
>> 1. Drop useless cast.
>> 2. Use initializers of the variables.
> 
> Would have been nice if this was extended to ...
> 
>> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
>> index 680b7d9002..2b3a51afd0 100644
>> --- a/xen/arch/x86/numa.c
>> +++ b/xen/arch/x86/numa.c
>> @@ -162,12 +162,12 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
>>       return shift;
>>   }
>>   /* initialize NODE_DATA given nodeid and start/end */
>> -void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
>> -{
>> +void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
>> +{
>>       unsigned long start_pfn, end_pfn;
>>   
>> -    start_pfn = start >> PAGE_SHIFT;
>> -    end_pfn = end >> PAGE_SHIFT;
>> +    start_pfn = paddr_to_pfn(start);
>> +    end_pfn = paddr_to_pfn(end);
> 
> ... these as well.
> 

Ok, I will do it.

>> @@ -218,9 +219,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
>>       memset(&nodes,0,sizeof(nodes));
>>       for ( i = 0; i < numa_fake; i++ )
>>       {
>> -        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
>> +        nodes[i].start = pfn_to_paddr(start_pfn) + i*sz;
> 
> Please add the missing blanks around * while touching this line.
> 

Ok.

>> @@ -489,7 +489,8 @@ int __init acpi_scan_nodes(u64 start, u64 end)
>>   	/* Finally register nodes */
>>   	for_each_node_mask(i, all_nodes_parsed)
>>   	{
>> -		u64 size = nodes[i].end - nodes[i].start;
>> +		paddr_t size = nodes[i].end - nodes[i].start;
> 
> In numa_emulation() you use uint64_t for a size; here you use paddr_t.
> Please be consistent.
> 

Ok.

> Jan
> 

