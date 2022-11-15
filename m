Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D48A629334
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 09:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443810.698573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ourCq-0001s4-Kl; Tue, 15 Nov 2022 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443810.698573; Tue, 15 Nov 2022 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ourCq-0001p9-H9; Tue, 15 Nov 2022 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 443810;
 Tue, 15 Nov 2022 08:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=30Ns=3P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ourCp-0001p3-M7
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 08:22:07 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe13::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9689c079-64be-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 09:22:05 +0100 (CET)
Received: from DB9PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:1d9::8)
 by DU0PR08MB8205.eurprd08.prod.outlook.com (2603:10a6:10:3b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Tue, 15 Nov
 2022 08:22:02 +0000
Received: from DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::1b) by DB9PR02CA0003.outlook.office365.com
 (2603:10a6:10:1d9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Tue, 15 Nov 2022 08:22:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT031.mail.protection.outlook.com (100.127.142.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Tue, 15 Nov 2022 08:22:02 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Tue, 15 Nov 2022 08:22:02 +0000
Received: from 64be351efc58.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CAAD31E-BF0E-4F00-B712-53BAC1465370.1; 
 Tue, 15 Nov 2022 08:21:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64be351efc58.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Nov 2022 08:21:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV1PR08MB8668.eurprd08.prod.outlook.com (2603:10a6:150:86::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Tue, 15 Nov
 2022 08:21:48 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5834.007; Tue, 15 Nov 2022
 08:21:48 +0000
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
X-Inumbo-ID: 9689c079-64be-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FI/sR39bA1hnhzgdPp8tH+L9WZgmMiO3pYo1Kog+KG36nR+yCfVkdKNRw7hDO3ixYf4wbEbEKvORoQadOiRuDeDTHLPxyh8mbdOrQhxYeRNT5T4F+uchf+4api67PRSAH63YQ/++4K9GDw99uyb9zqsDNriMpW+kT18aSYNd3sfMEGrpJScXFNuz/XVU24V38OoGWfvCEPALOefFmWfos/+4MqRqsQQeOWA9eKy+TJg8ePsYiJ2YW2thaJc+XYlF8l7v70QHMFYkqNdco1YyeQdX5GrXN2u6ZEi02oshcX+9ILvg7kcqq3JXlg0x8FY+V5aAS5zPIM+gzmdu1I3WIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuN8PeRhwU2sDVpej8Ojp7v/QgD8TvryK79101JFIY4=;
 b=MoAcd+e6UHHKy1goFFznPdSebdC+i5Azkez8kQuU0kzBeo+5UvNfO6Ulx2xGa2gtRt9FB37LJP73zwSxHDFCYoHnexN1vOkBt7onbTIQjTQdcFJoe0qUG9bfoVvg3T6wx3v4bxjCnsNzJKjx67hTheccsq4MRaGjIST0DNhkEwRqGMsgvsEHeDWD2lvhupJqAtvjjJMV0mTC283lylpomZ2L6WQ0BaW6Z6pI/ayoLrpTJm7NOXhx3ymiZ0x527HtUEdm8NuiwTIqMfhszOEutztiVwinGVzKmOKLvIvtTnG4hvK5+hMBGjPjrg+cmXxhTIOpKgPvjO2ymP7wLM+bEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuN8PeRhwU2sDVpej8Ojp7v/QgD8TvryK79101JFIY4=;
 b=CMOkFWz2cnj4f2CPHQZjhy0GnFrnrv5GMiO8WmnpxPOX+JQt09zhFF0jPNt/2We3eHRczhL+s4GlopBi7icLorl8haO8m5brj/jh23Ta6c8qaIBlvQlATy0cnUIC+Tc+O5HDqxyfUETZO2femjI6uS1KCAIeNTbKhTPGm1+rtUs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 051da04accd6d662
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkgjPh2mjnS6mOMiTqfpGqGttX96d2gr49dYpFddE0fUpkknUlE55LDFfSFWDPvNKRIr2drS4Ta/VbQfMTI9Vqoki8ih+3qi9Znu2t5d1oNNTr0fotjiC1/cIg8NMPNTSstCUUrGThQZnVDxUKpjB9uDf/bjz5lBdtFxT2tvJA6AWt+vct5b4VjvaqOru2jeE0f4rHx0o7EWSgMQnugTUHys8jRRoo5SKg0XdPI5xz+njtS5hRIbxx5n74QmyWCVX3+M/ivSF9j1XEBRXWm6LBOk5a7Q71vtiNLK1vABekjdqmNBOLhd+3PCAQXrhzl7+ABW6QzNg2OgIufVrDQeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuN8PeRhwU2sDVpej8Ojp7v/QgD8TvryK79101JFIY4=;
 b=bXt0BX1aZtjTfnwjW5/cBJvLngJGBJy0ColF8EWeDK8dnkidt5uFhYmLJlrmD8Cxn7tGkdy/3A2hotH4o4wDtNf4R7rt2UlbIAUugYPXPpaMKzG9GvT9yzGtB3wFV6VQ0QSMvwk/ubgxnC46vJrHIBM8VO/Tph/taLWbIt9u7HEDOZT+sT1nYiODvWxpHeSTERGJlIQMs/AYPrg/voOtehaRowJhDeukNTcfUTMOpuIEFUgZXpLSKeY6Vi5GaN4rpkZXWAw9U0ZEk7u5AZIAWx+ZUl6UwArMFkMY8/AkxZV32qOh0d/sTnmOdvPknoEyihpya8RsofKoLzSWtFWmcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuN8PeRhwU2sDVpej8Ojp7v/QgD8TvryK79101JFIY4=;
 b=CMOkFWz2cnj4f2CPHQZjhy0GnFrnrv5GMiO8WmnpxPOX+JQt09zhFF0jPNt/2We3eHRczhL+s4GlopBi7icLorl8haO8m5brj/jh23Ta6c8qaIBlvQlATy0cnUIC+Tc+O5HDqxyfUETZO2femjI6uS1KCAIeNTbKhTPGm1+rtUs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <6918f382-e818-dd37-4088-4d73613d72bd@arm.com>
Date: Tue, 15 Nov 2022 16:21:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v6 03/11] xen/arm: disable EFI boot services for MPU
 systems
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-4-wei.chen@arm.com>
 <a85280bd-de4c-a6e5-c0c3-a4272b6f6af7@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <a85280bd-de4c-a6e5-c0c3-a4272b6f6af7@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|GV1PR08MB8668:EE_|DBAEUR03FT031:EE_|DU0PR08MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6b8130-6113-47c4-99f5-08dac6e27904
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aTyvtD32dYlG9mLhlrSo1FrasqYFU445S3jqyk8X6yGLwGW12VuEf3NSFByzNz1Bsf/diW3zpd977s62FMUVvAoAhbzmQbXViYBLtW1T4DJzKAh3k5d3vX/CwRbtQHMuxEnBpXx04qr+jjs2dnkIL/SLnoy58mw3HU6M8uN23xYidcbJooPzYeoL6bIFIhFkIq+Sn2Qo8klAszZN6YLczOLyKpxWqs+1J2nJZ44Q5WUVOkWVlu8fdbcm6WqWNtwgdF+JlGEMb4gDilx9TROT1VdLWMYajQqqYn/Yafj3TiNgt9tiC+UQVQnAwJ4N+QKmTa/kZc6dOSbcTXe7DOVjOYWWmjlbu+iZDIQLTRG/o54GNVx0iJtrYHQuTRFZijXAhsbvzlR141NIEgOBcPosWA1SRkUO9HIvLLIk4lLFsk5ymKIv0BQkLG6ZC8V0jrEVRA3TBWngBDtlqOfEP3aNzQ5OIdBY5qBbzXzqZjMhuMoPxWg1Zym1fQEEy2Zwiyv+rBUIHJwyIMyJ7emZ1vXerUfXStsLxNcyybjXku0BMJ9+3idZrza+Rjjr/YUhlOPfYY3GNEB9PNlqXKFnER1sPef6FBMJoAPMCMiwjFWGdUgFEuYNYqsCUbxsa0USuTz/afVnGdW5/vdqOtNM4VGaAPL+oL73wK8fnbt+8yx3nNYnadAE0nqUx5UE9JUNQZ+FCW6Xnby9l4QrabY5D1KM7HkGj81oQB5TEYehOLmUUoX5f53ZlGEhESQlMS3o2ktlFprNI7kupjAzNMv4B0vGbXlI0/jXeeiUZymn3Ta/aLc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199015)(26005)(6512007)(31686004)(6666004)(6506007)(66556008)(4326008)(6486002)(38100700002)(316002)(8676002)(478600001)(66946007)(54906003)(41300700001)(66476007)(5660300002)(4744005)(31696002)(8936002)(2906002)(53546011)(86362001)(2616005)(186003)(36756003)(66899015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8668
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ab27712-2c3f-4116-f249-08dac6e270a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5WLy56n7z6p8ERtqx5E8Uit6lI/XpqP3+bMRsxc3NYprTy1WshB3/XgVOSmMKmH9KAcP9xmtYJu/mrv9PB8he9yNkYDhrn43pJJqjbBm6Q8BAfYl/EIAZkDPM8mDK8AY3fThl8hGlQm9Gs8qG1D1k7Y/0O9ayrnVk6J7sJEbiKbFZCgf7ufZdgBbmhhMC1lptkeRdQkw1malkjW13oAAZxNBNCe/SM9+WaYTbOb//HHCtaFdOEqSrHNfzLJgakj1N0hwL0ptzkoSKfxyzNmqoMWLqGPPIYA27LWu5HeftXg6fn5C2qnlverc0HoZnpsJPOKwAM10r5DnyyKXGyvA1ZTw0x3pASQs030WZcmZEuJMprIlv2MU+Ca1XAr9tzluaUrYf+pV7eJSkBlg1M52gtcMseBRtbWIhX2i5vG3+gf7Liu5Cak5s1ptHh+3baNqbbZtvUyL18QmE3NP5AQgTGcHTOxj+DoNAtNojOaMZnYjzaets/MW2fQSIfnWPoxAd3dpifyFAXRYCdTE2sYucyEgD+Og7N84tMGAc38336KO6uHqNdDyAO0psn32T7jYZCaC9Mi6m/mF2XmRdCo9KEKglm6GcNgUdIs2j6Q0dN06n86Hi4Uunexd1PsmtlwnXo4gX7Rw1LtBGI0Xhpn/cisU/i6K17M8AyNsfykXOSCoBc59RkBufe8jB1lv+lM1VeV3rCMnC26OJC/uYjaFOFBFwdtqhSzrtzb4BMY2RhY+rFZAqorAGVK2dDxE8+cntSZse57oLDEHraJdd2ojeXzIxLcxIGBakAhOd7voxWM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(47076005)(31686004)(54906003)(316002)(66899015)(36756003)(53546011)(6506007)(107886003)(26005)(70586007)(6666004)(8676002)(4326008)(70206006)(8936002)(40460700003)(5660300002)(6512007)(4744005)(2906002)(478600001)(6486002)(336012)(40480700001)(2616005)(186003)(82310400005)(31696002)(356005)(36860700001)(41300700001)(86362001)(81166007)(82740400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 08:22:02.1443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6b8130-6113-47c4-99f5-08dac6e27904
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8205

Hi Julien,

On 2022/11/7 3:12, Julien Grall wrote:
> Hi Wei,
> 
> On 04/11/2022 10:07, Wei Chen wrote:
>> Current EFI boot services support of Arm64 could not
>> work well for Armv8-R64 system that only has MPU in
>> EL2. That is because EFI boot services may need some
>> relocation support or partial PIE/PIC support.
> 
> I am a bit confused with argument. We have nothing in Xen today to deal 
> with relocation/partial PIE/PIC support. So what is the exact problem? 
> Is it because UEFI can load Xen anywwhere?
> 

Sorry, I had missed this comment. Yes, you're right we had
tried to boot Xen R82 Image from EFI loader, but it failed.
UEFI loader will load Xen to a random address, which is
not supported by Xen R82 now.

Cheers,
Wei Chen


>> But these will not be supported in the initial stage of
>> porting Xen to MPU systems. So in this patch, we
>> disable EFI boot services support for Arm MPU systems.
>>

