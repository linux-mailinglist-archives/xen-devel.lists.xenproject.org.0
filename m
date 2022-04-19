Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF5507658
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 19:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308417.524168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrSs-0007cB-9G; Tue, 19 Apr 2022 17:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308417.524168; Tue, 19 Apr 2022 17:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrSs-0007aI-5B; Tue, 19 Apr 2022 17:16:34 +0000
Received: by outflank-mailman (input) for mailman id 308417;
 Tue, 19 Apr 2022 17:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mE7q=U5=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1ngrSq-00071I-Cp
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 17:16:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c62a21-c004-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 19:16:30 +0200 (CEST)
Received: from DU2P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::32)
 by DB8PR08MB5292.eurprd08.prod.outlook.com (2603:10a6:10:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 17:16:26 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::5d) by DU2P251CA0028.outlook.office365.com
 (2603:10a6:10:230::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Tue, 19 Apr 2022 17:16:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 17:16:26 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Tue, 19 Apr 2022 17:16:26 +0000
Received: from 199cbda7e914.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 347864DC-4C5D-422D-92C0-253F77777B7C.1; 
 Tue, 19 Apr 2022 17:16:15 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 199cbda7e914.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Apr 2022 17:16:15 +0000
Received: from DB6PR0801MB2022.eurprd08.prod.outlook.com (2603:10a6:4:76::15)
 by AM5PR0802MB2499.eurprd08.prod.outlook.com (2603:10a6:203:a1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 19 Apr
 2022 17:16:13 +0000
Received: from DB6PR0801MB2022.eurprd08.prod.outlook.com
 ([fe80::556f:106a:aa3:42f6]) by DB6PR0801MB2022.eurprd08.prod.outlook.com
 ([fe80::556f:106a:aa3:42f6%3]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 17:16:13 +0000
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
X-Inumbo-ID: 73c62a21-c004-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgBLaVZfZ3OyeXxYBvIGjlWj29KWJyZKTKiIU+VO6JE=;
 b=llaF3P0BWSeqqvVlupuIzUvvnuXILUyG3D3MOTeG4HXFyhqqA72NCMu3ubAxjM/gHNtQHR2SvCK6tK+OMjRNIKp/qw/Vpgfj+L1r8lhh+g2C1c3paFwPCe5GPL96ttO2CuMoTXK//KMryZJGMq3FVRSqNbVHukYuKW9HtBhB9Sg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f841434df4a7b64
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZI2JicU/Kw78PS42z2wDnyYJNg1ITlSCWS0z9uCocr0T8rBcAmtRKk82PNulQEKCyf5loVUrJlLnowkUgbVsVgrL5mvHegbHs36JvxeDk5W/Mpf0RfkTG2iki+JpkWR+O7jpPwiozc+qr2SZzla/8SJrNva/vPDmXCkL5G/ySV1yILw1cPyKXj902Fe1jxl9Nb0GzR3QaGhZeDb2u4xAf9DkcqiuX/TaJrU9szNeatsjET6Zvz8zXXrjkcb5u7pddYG+UMOexEOL2rlJQo8XYMOmMH7Bl+RZ/7+dYw1qAIc+3IuST+i4syj87bYj0RNH2t7iXfANx147ggLDh2UgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgBLaVZfZ3OyeXxYBvIGjlWj29KWJyZKTKiIU+VO6JE=;
 b=kFiyTCjanf0BGOs9kR4ohlD20rrPNvoQxDXsHtwm76azpDmf9X11rNgRDMCQGrDi5E2s9V/BmvLn1O2UEHN7MRZ0K/QISp4GGrh7m8Gcy3VThBQGC7tLnkogjhSdnKeoG+qBnN/DZywQZyjC9i7fgQE58WKhA5LgsYnYQQmo23oSNvk3jJ2iaaNBVGQH0vIS9xbRGkMqgoGgj4k6+HsZl7T5MX+ALdZYppP4UmChY6wnoT9BgmQ70mHg4BbP/094MbDVPDhA+K2+jf9zKqyhhl2HLOXMmtBIzhyGZmjHxy2WzszglMZYf0HhtSpr8w0ZOBzgqAIaKu9c4NhqLN+FIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgBLaVZfZ3OyeXxYBvIGjlWj29KWJyZKTKiIU+VO6JE=;
 b=llaF3P0BWSeqqvVlupuIzUvvnuXILUyG3D3MOTeG4HXFyhqqA72NCMu3ubAxjM/gHNtQHR2SvCK6tK+OMjRNIKp/qw/Vpgfj+L1r8lhh+g2C1c3paFwPCe5GPL96ttO2CuMoTXK//KMryZJGMq3FVRSqNbVHukYuKW9HtBhB9Sg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
Thread-Topic: [PATCH] xen/evtchn: Add design for static event channel
 signaling for domUs..
Thread-Index: AQHYPsy9MfyfmFhecEGJuSNYyusIgKzm3KwAgAAMjACAA7tUgIAEF8cAgAjoaQA=
Date: Tue, 19 Apr 2022 17:16:13 +0000
Message-ID: <076C6D09-C0DA-41BD-84CA-AD595B5AF0A2@arm.com>
References:
 <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2204081649370.3066615@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2204081837410.3066615@ubuntu-linux-20-04-desktop>
 <D24074F6-E6CF-440A-9E9B-A10783C273D7@arm.com>
 <alpine.DEB.2.22.394.2204131657200.3066615@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204131657200.3066615@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cc238e1a-0435-44f3-49f9-08da22285603
x-ms-traffictypediagnostic:
	AM5PR0802MB2499:EE_|DB5EUR03FT032:EE_|DB8PR08MB5292:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5292239CF7C5E342913AE27DFCF29@DB8PR08MB5292.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oRBW7W3e5x/smorS+bNP9Kwe0dz2HQw6CI/eNwViNfzzsHlqfqQxDPPTC9r6eRNQQFrr9TwB4+KObp45NWUHvK6SXDA8GusbGiXPMBld0NfV0F7c3HROo5dILsAh03llGd2n60Qw9TUjNtTVQdC2HkvxI0l3OKCtfS9uLuU1ieuBPoRTakLSPxSeZFZg9Kl0T7L6V4LB92gpINK+z3n6Vl+++ZDHkxtDVmjWgW9EOxXHeiwkRNMPcXPttB6ndqDF5mvQ0zjVCY/dn2E7jLBxh0d4/xAON2qcU5lxNf4I+zCQDeceDfXmVnWwVCD1xY2A3bN7/57ljwYsKIHyLC8E385VxEOG9AyNHasi620PcF9uqF5IzlEaG7xY0JIG+hhO7saLxgc9p74c+ugCyuvnm/6n+5IoVU8HUVHFvOTdxXUVMLOjWloA8g5uqeP+F/qbxGzHSQq5OcN3aHyjTif7E77Ojx0puF0iNOXN8wuyCv4qMBkcBR31LQhIBpyfjaNRCQNudbkj41h13rE8KyWzSBuL5YPQnQb+/Hk7zqs7ZCPmLHsMsPgk8tOFZ+rA43QjYHicwYTz+mLYz2z+xzyWPg1Dqh65Xr1fsTtmSjwH81G+zjShTf7jACYAzsfS8htvhd5yEqO40t2og5YCGjkBm/yOzPg579KsXOTOQ/wNuwrrDSQ5f1jihJR/HPzU77LOx0tA8qTV5Imn2OCfSoBNXAyr7zWD2myul4GW0rk2LCkEJB6AhoeCXqjK2Z1jQ4VjEJ10cA/3C4hzsGQ99hCg7ssc1sIHHI1lUrMnE4IAvWwDTP9PMbPsZI3cKGM0KShzy6Do3yAPLY6ryahFH0NTNQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2022.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(76116006)(66946007)(66556008)(4326008)(91956017)(66446008)(66476007)(64756008)(8676002)(6486002)(966005)(26005)(6512007)(71200400001)(508600001)(6506007)(53546011)(316002)(2616005)(186003)(6916009)(54906003)(2906002)(36756003)(33656002)(86362001)(8936002)(5660300002)(122000001)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <742A4116076DA54A87BC7166E2D6933E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4aedbfbe-c50e-4de8-786d-08da22284e5e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	urTPMHDf+xHLBVCpX9TlfjTuKAcututXoF52zAk4n3gFf7KQP/+0+xTT4MpJWRlNWSl947gZH63x4RHJPx21fRj2fxvapj7WMwy+7Tb2bbpfuKyvFMSPoTfj7b7aT8he1nAagLdmuJpuW94RBeojYP3e22Qqiv7Su4YtPUTOQoSg/cMiY4YoL6AOxs80lgVYHFyzeIKXq/Qyo9uPfHXe25NcKvo6JVjE9Qu31RPyNjht6aLOYNBXjxt2if2eQH7rppv15AyVgBIqXD+pLqc4n6EPWcpKrxl5nKt743eIdC3gw7tK9eaE+8bkq0zieeJDxLCSjpu/qiKOc76ewZhvGiB/qdos8YAhXfEQlRMfeYj9x1MPJ63oVZ3+dZSHR/MNcupngwSphRvcex8rvQmnd/DIK5KYQ8uQ8SWVQrI36WbFxljkpKQ0bOxsoZSx98ZPNhE3te60EAQ4ffNH/S+0Yz9l7tQ+aPH3E98mcLaKUCqDUJxjeEjEu+nTjwQKfYpyc798rEfsO+HtjcJrgLVd5Y945evnlLPUXqy+cnypSZe8j2r1f6cXXPBitrwrdAzL9mYuhrYunAJp/CzlY9AVTUTqs7S8lYlX1jLBvPs1RzIt+2BOX0Tkm36J9Q5/TJ+SVsigViiET6txtYkeObF19Heh5aymzd3H6GmrbNU/a9etUoX+ox3zLIoSGSKRj7uB4JdSXbvxuSbMokeW+defpw+r7J04P8NvJZqjRhCKJYl71QC0Md1Y4UJUx9OBfbMpI2jpqgoVPlyGa7bfrlIKUA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(54906003)(26005)(47076005)(336012)(186003)(40460700003)(82310400005)(86362001)(2616005)(5660300002)(36756003)(4326008)(8676002)(6862004)(966005)(498600001)(8936002)(6486002)(70206006)(6506007)(81166007)(6512007)(33656002)(2906002)(356005)(53546011)(70586007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 17:16:26.3282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc238e1a-0435-44f3-49f9-08da22285603
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5292

Hello Stefano,

> On 14 Apr 2022, at 2:14 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Mon, 11 Apr 2022, Bertrand Marquis wrote:
>> What you mention here is actually combining 2 different solutions inside
>> Xen to build a custom communication solution.
>> My assumption here is that the user will actually create the device tree
>> nodes he wants to do that and we should not create guest node entries
>> as it would enforce some design.
>>=20
>> If everything can be statically defined for Xen then the user can also
>> statically define node entries inside his guest to make use of the event=
s
>> and the shared memories.
>>=20
>> For example one might need more than one event to build a communication
>> system, or more than one shared memory or could build something
>> communicating with multiple guest thus requiring even more events and
>> shared memories.
>=20
> Hi Bertrand, Rahul,
>=20
> If the guests are allowed some level of dynamic discovery, this feature
> is not needed. They can discover the shared memory location from the
> domU device tree, then proceed to allocate evtchns as needed and tell
> the other end the evtchn numbers over shared memory. I already have an
> example of it here:
>=20
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2251030537/Xen+Shar=
ed+Memory+and+Interrupts+Between+VMs
>=20
> What if the guest doesn't support device tree at runtime, like baremetal
> or Zephyr? The shared memory address can be hardcoded or generated from
> device tree at build time. That's no problem. Then, the event channels
> can still be allocated at runtime and passed to the other end over
> shared memory. That's what the example on the wikipage does.
>=20
>=20
> When are static event channels actually useful? When the application
> cannot allocate the event channels at runtime at all. The reason for the
> restriction could be related to safety (no dynamic allocations at
> runtime) or convenience (everything else is fully static, why should the
> event channel numbers be dynamic?)
>=20
> Given the above, I can see why there is no need to describe the static
> event channel info in the domU device tree: static event channels are
> only useful in fully static configurations, and in those configurations
> the domU device tree dynamically generated by Xen is not needed. I can
> see where you are coming from.
>=20
>=20
> The workflow that we have been trying to enable with the System Device
> Tree effort (System Device Tree is similar to a normal Device Tree plus
> the xen,domains nodes) is the following:
>=20
> S-DT ---[lopper]---> Linux DT
>                L--> Zephyr DT ---[Zephyr build]---> Zephyr .h files
>=20
> S-DT contains all the needed information for both the regular Linux DT
> generation and also the Zephyr/RTOS/baremetal header files generation,
> that happens at build time.
>=20
> S-DT is not the same as the Xen device tree, but so far it has been
> conceptually and practically similar. I always imagine that the bindings
> we have in Xen we'll also have corresponding bindings in System Device
> Tree.
>=20
> For this workflow to work S-DT needs all the info so that both Linux DT
> and Zephyr DT and Zephyr .h files can be generated.
>=20
> Does this proposal contain enough information so that Zephyr .h files
> could be statically generated with the event channel numbers and static
> shared memory regions addresses?
>=20
> I am not sure. Maybe not?
>=20
>=20
> It is possible that the shared memory usage is so application specific
> that there is no point in even talking about it. But I think that
> introducing a simple bundle of both event channels and shared memory
> would help a lot.
>=20
> Something like the following in the Xen device tree would be enough to
> specify an arbitrary number of event channels connected with the same
> domains sharing the memory region.
>=20
> It looks like that if we did the below, we would carry a lot more useful
> information compared to the original proposal alone. We could add a
> similar xen,notificaiton property to the domU reserved-memory region in
> device tree generated by Xen for consistency, so that everything
> available to the domU is described fully in device tree.
>=20
>=20
>    domU1 {
>        compatible =3D "xen,domain";
>=20
>        /* one sub-node per local event channel */
>        ec1: evtchn@1 {
>            compatible =3D "xen,evtchn-v1";
>            /* local-evtchn link-to-foreign-evtchn */
>            xen,evtchn =3D <0x1 &ec3>
>        };
>        ec2: evtchn@2 {
>            compatible =3D "xen,evtchn-v1";
>            xen,evtchn =3D <0x2 &ec4>
>        };
>        /*
>         * shared memory region between DomU1 and DomU2.
>         */
>        domU1-shared-mem@50000000 {
>            compatible =3D "xen,domain-shared-memory-v1";
>            xen,shm-id =3D <0x1>;
>            xen,shared-mem =3D <0x50000000 0x20000000 0x60000000>;
>            /* this is new */
>            xen,notification =3D <&ec1 &ec2>;
>        }
>    };
>=20
>    domU2 {
>        compatible =3D "xen,domain";
>=20
>        /* one sub-node per local event channel */
>        ec3: evtchn@3 {
>            compatible =3D "xen,evtchn-v1";
>            /* local-evtchn link-to-foreign-evtchn */
>            xen,evtchn =3D <0x3 &ec1>
>        };
>        ec4: evtchn@4 {
>            compatible =3D "xen,evtchn-v1";
>            xen,evtchn =3D <0x4 &ec2>
>        };
>        /*
>         * shared memory region between domU1 and domU2.
>         */
>        domU2-shared-mem@50000000 {
>            compatible =3D "xen,domain-shared-memory-v1";
>            xen,shm-id =3D <0x1>;
>            xen,shared-mem =3D <0x50000000 0x20000000 0x70000000>;
>            /* this is new */
>            xen,notification =3D <&ec3 &ec4>;
>        }
>    };
>=20
>=20
>=20
> The good thing about this is that:
>=20
> - it is very flexible
> - nothing to do in this series, except switching to the
>  one-subnode-per-evtchn model, which we called 2) in the previous email
> - there were good reasons to use the one-subnode-per-evtchn model anyway
> - the xen,notification property can be added later without issues, after =
Penny's series
>=20
> There are a couple of ways to implement the xen,notification property
> but we don't need to discuss them now.
>=20
>=20
> Short Summary
> ------------
> I think it is fine to only introduce the Xen device tree binding for
> static event channels without domU binding, but I prefer if we switched
> to using proposal 2) "one subnode per event channel".

Thanks for detailed explanation.I just did the basic implementation of the =
2) proposal and
it looks simple and not very complex as I thought earlier.Therefore I am ok=
 to switch to proposal 2).

If everyone is ok with the 2) proposal I will send the v2 of design doc aft=
er fixing all the comments.

Regards,
Rahul


