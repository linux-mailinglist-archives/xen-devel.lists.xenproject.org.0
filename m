Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D189644AA85
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 10:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223813.386708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkNM1-0006P5-II; Tue, 09 Nov 2021 09:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223813.386708; Tue, 09 Nov 2021 09:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkNM1-0006Ma-F2; Tue, 09 Nov 2021 09:23:45 +0000
Received: by outflank-mailman (input) for mailman id 223813;
 Tue, 09 Nov 2021 09:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wW2L=P4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mkNM0-0006MU-85
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 09:23:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bab0659a-413e-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 10:23:42 +0100 (CET)
Received: from DB6PR0501CA0027.eurprd05.prod.outlook.com (2603:10a6:4:67::13)
 by AS4PR08MB7432.eurprd08.prod.outlook.com (2603:10a6:20b:4e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 09:23:40 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::e4) by DB6PR0501CA0027.outlook.office365.com
 (2603:10a6:4:67::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 09:23:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 9 Nov 2021 09:23:39 +0000
Received: ("Tessian outbound 2bb1f94ba47e:v108");
 Tue, 09 Nov 2021 09:23:39 +0000
Received: from d9aa2671ea87.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17DF6259-FEF3-4675-942B-ACC2CDD3213B.1; 
 Tue, 09 Nov 2021 09:23:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9aa2671ea87.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Nov 2021 09:23:29 +0000
Received: from AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 09:23:25 +0000
Received: from AS8PR08MB6808.eurprd08.prod.outlook.com
 ([fe80::3d99:b3e8:1c0:6fcd]) by AS8PR08MB6808.eurprd08.prod.outlook.com
 ([fe80::3d99:b3e8:1c0:6fcd%9]) with mapi id 15.20.4669.010; Tue, 9 Nov 2021
 09:23:23 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0050.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13 via Frontend Transport; Tue, 9 Nov 2021 09:23:23 +0000
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
X-Inumbo-ID: bab0659a-413e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+LiQdzyQQpvVn4ryd7LFItxGV6ZzLB5MwHHA38ze7s=;
 b=z6tbpJw8o7CK/BP2+gP6xk4qchlN+EHnAIOqanAexj79oCVkVtsgNlutH45UvG7rwbOgUN7nvVFY1tGzicfbd6ac/9jgcVkPivrT87/I82MPLFEqxtGDP0VWleeL+vnu09nMZwGaBHNFiaXb+rzuzlNCq4p+8TaKMe0SEVxaDy4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30f74906000b6162
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKcVrwKdQF4VrjOrst/EbZmjdyi1bXd1AgD/N8jIJO5AfK+TUgma3gBl6pcW92pqHOo00m/fPlYxyY1Az4PzXi5tycGPQ+ZRgBrcX2CZShuZ957vOByFjWlQcGPCUdWXAler5V8bUvbQ01qOhSG4wCbqIMSaKU/9P/1Q1v2z9YbINHw4urJvXHhA1QgoIPPz+Y6JpRS3UCCtLe/VNvwES7NGEh5pllreXvtqVA0i3kogS4LiCniodG/VAO4xUnEV+nDXjwLhkWWv2wkC1iMPevI2d0vbF7RJAZUmRzvc2qJtxI7A+Q6CXE1ucph1zVK0dntI5LSI8Fg7XhRzwmNMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+LiQdzyQQpvVn4ryd7LFItxGV6ZzLB5MwHHA38ze7s=;
 b=m4R6A2nIlEEQmuUcSemc09NjlWj3kztxMZx8KyHoHsU/iE9nV/e9Lr7TtgOe8a79PIFA9N3BdhL4hYCCzv8O6w5yiNxQlfVngsxkW4N93Cf0E0tfj54ee+euw4j8uv/qUARfMvQxcWf3Fuk7gFFn8t3UTNoGqRb8XJuI/rUBrykm3p17e50TuoRk8C/whzpGHUkRDzrzqZaV/WINK9EEOvM/UGxjlgP8I7QbtM8qn4L4tIIVC5jZHBhNkphbLu9JNB/YfNZE/+cHgqa1IzakpQ3JaSxXwGr0fKQORBygw9Mx7N0w9ph1iQp7sBdmBHSFQ6ugFIsr6UWM8EXsdHexbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+LiQdzyQQpvVn4ryd7LFItxGV6ZzLB5MwHHA38ze7s=;
 b=z6tbpJw8o7CK/BP2+gP6xk4qchlN+EHnAIOqanAexj79oCVkVtsgNlutH45UvG7rwbOgUN7nvVFY1tGzicfbd6ac/9jgcVkPivrT87/I82MPLFEqxtGDP0VWleeL+vnu09nMZwGaBHNFiaXb+rzuzlNCq4p+8TaKMe0SEVxaDy4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
Date: Tue, 9 Nov 2021 09:23:16 +0000
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A756250-0011-480C-B64B-C6FAF5008E12@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::14) To AS8PR08MB6808.eurprd08.prod.outlook.com
 (2603:10a6:20b:39c::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91fadf71-9730-41c1-1533-08d9a3629db4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:|AS4PR08MB7432:
X-Microsoft-Antispam-PRVS:
	<AS4PR08MB7432F5A0232356CD5B5D10ACE4929@AS4PR08MB7432.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IHHZ3LFH9BebxjXHgbTiAUOt0pc75CneKo9OZgNrDI2y3LfA+IjMKuahpsl9FzzWbfcixxEzVaDBepYnuo/xF+zrER59HEN2D1u8lQBl4YsvoT/aLh+l42zZSKVBW9roqIqYfblv5SxTnli/yHlcQxZfMD/UbqlMnbVubyZSto3SZisTxaitmrTucdLEIaK49aHg5YltG9PB7Avpx9AcpUeYz2+jBcW3GDI8AY76AgExRr2HlwZk3N0HYAghqF40esuoEJMmV5GjMPf8COsFqji5CrGwumJYreCJbkCVuf+p4seqSrQTWT3zeCTXfmsuENkjNXG6jaiHuc14bJYPys73ngrI2af+O+BHmNKSSKUAr6USvX9Ptwy9eWMymR4W0M3hkQARyXSMnh0N8Gt0+9MRotTYXSoiBTEugTSbaKBuyAGbZlxBRLcq+wmKJ1PaJQ2LyzuFGwO2JeDbPqnBNvwurXrJ8ujEXpSsXyjqhLD3RvVe7U8uLxHKsbhnnT3wv0G6HuCwSZcfpCQNBtZ3DdZr0sWROMjCfPrsImmcv8hnTPvIQNkHx/xaAhU0VX/I2BxOOcuwMW5NBMT06yzoC3TbqbwDOoApjhv7zMOJILpF1UZycgcEagOnDIk6W9uvAwsFSSz0jdkkvwC/e/tNHyl3wftVr3+fvErt/nEmiChgz2AI0GzB6sLqDScXZKB3sPoW1K8FmeNEzzeEmNhqmxljZdePOmysj7ZcvXv4ZeE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6808.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(4326008)(83380400001)(44832011)(38350700002)(8676002)(66476007)(8936002)(6512007)(30864003)(508600001)(956004)(86362001)(66946007)(6486002)(66556008)(38100700002)(316002)(110136005)(2906002)(6666004)(52116002)(54906003)(33656002)(36756003)(5660300002)(186003)(26005)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5afe9e43-ec56-4106-c242-08d9a36293f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5uG0DyAF2W8tcSPWP6Qp3uHYUCXi8zBqEx5AU7Kjx7Q9Ou45P1KVY2TgdUoLu4R6MwEmEtlG/4knGdJTAiPFHqwg1I7QgeMvua9dT1mKUY1Qf4/UjrQSXdn4F58d0ANgVKT89YChsBN7Qa3hQG7pu09SbhlRUXSAqBgChocFSLq1ury+fh7yhOK9ulpwTZkFqsPVHZi0SxzDLOCVD7Y/bpUxpPsHa0kR0Mc4+epFOhAHW3PdxK8QKfXpb1b0GTLjfMZEUd9mi4MdsrNN1gxzLaknl1UiWkbRnwdxuYhA471GOxycLrz3X/dLvavT4J3rHueQuvD635mygdXx+92nzkLBcwbVLDnA8UdSgmRGEHJZ44/H4d8rxwBoVhuyEWxGQU/SEGGMMMDny8LCb/8ke7xNQ+A27cL9DSndFFrlOkndlP4yLoLxaI3B1lAmihcGlIBWPh+Ufe49oYMt6Y2JUP8LrOHy02rTAMDle8al7jgRi7zv7wql7BAr4CjCO564eQbkGpvjZC/EKP6z5cIMTFebPqHyi/4DgQVurRjKbbXYXb74UMJcwciTdmLJlurul7yx51z5N2jUhGCdmT977CkDvZt3sZrw78i1txNYRe1FGmIyN27w5TZxULtmy596PmxxVVp2tgvI3RrwWh2Uun4lwy0GbnhMjDdJbWy0fAc2MsfDjp2Kv4a5PDAgAIBai5927saSr+e6KsWeEXk6dA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(336012)(6486002)(70206006)(47076005)(356005)(81166007)(316002)(54906003)(2906002)(26005)(82310400003)(110136005)(4326008)(70586007)(8676002)(956004)(83380400001)(8936002)(36756003)(2616005)(6666004)(53546011)(6506007)(6512007)(44832011)(30864003)(33656002)(36860700001)(5660300002)(86362001)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:23:39.7503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fadf71-9730-41c1-1533-08d9a3629db4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7432



> On 9 Nov 2021, at 02:11, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Mon, 8 Nov 2021, Jan Beulich wrote:
>> On 05.11.2021 16:33, Stefano Stabellini wrote:
>>> On Fri, 5 Nov 2021, Jan Beulich wrote:
>>>> On 04.11.2021 22:50, Stefano Stabellini wrote:
>>>>> On Thu, 4 Nov 2021, Luca Fancellu wrote:
>>>>>>> On 4 Nov 2021, at 21:35, Stefano Stabellini <sstabellini@kernel.org=
> wrote:
>>>>>>> On Thu, 4 Nov 2021, Luca Fancellu wrote:
>>>>>>>>> On 4 Nov 2021, at 20:56, Stefano Stabellini <sstabellini@kernel.o=
rg> wrote:
>>>>>>>>> @@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_no=
de(EFI_FILE_HANDLE dir_handle,
>>>>>>>>> * dom0 and domU guests to be loaded.
>>>>>>>>> * Returns the number of multiboot modules found or a negative num=
ber for error.
>>>>>>>>> */
>>>>>>>>> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>>>>>>>> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_ima=
ge)
>>>>>>>>> {
>>>>>>>>>   int chosen, node, addr_len, size_len;
>>>>>>>>>   unsigned int i =3D 0, modules_found =3D 0;
>>>>>>>>> +    EFI_FILE_HANDLE dir_handle;
>>>>>>>>> +    CHAR16 *file_name;
>>>>>>>>> +
>>>>>>>>> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);
>>>>>>>>=20
>>>>>>>> We can=E2=80=99t use get_parent_handle here because we will end up=
 with the same problem,
>>>>>>>> we would need to use the filesystem if and only if we need to use =
it,=20
>>>>>>>=20
>>>>>>> Understood, but it would work the same way as this version of the p=
atch:
>>>>>>> if we end up calling read_file with dir_handle =3D=3D NULL, then re=
ad_file
>>>>>>> would do:
>>>>>>>=20
>>>>>>> blexit(L"Error: No access to the filesystem");
>>>>>>>=20
>>>>>>> If we don't end up calling read_file, then everything works even if
>>>>>>> dir_handle =3D=3D NULL. Right?
>>>>>>=20
>>>>>> Oh yes sorry my bad Stefano! Having this version of the patch, it wi=
ll work.
>>>>>>=20
>>>>>> My understanding was instead that the Jan suggestion is to revert th=
e place
>>>>>> of call of get_parent_handle (like in your code diff), but also to r=
emove the
>>>>>> changes to get_parent_handle and read_file.
>>>>>> I guess Jan will specify his preference, but if he meant the last on=
e, then
>>>>>> the only way I see...
>>>>>=20
>>>>> I think we should keep the changes to get_parent_handle and read_file=
,
>>>>> otherwise it will make it awkward, and those changes are good in thei=
r
>>>>> own right anyway.
>>>>=20
>>>> As a maintainer of this code I'm afraid I have to say that I disagree.
>>>> These changes were actually part of the reason why I went and looked
>>>> how things could (and imo ought to be) done differently.
>>>=20
>>> You know this code and EFI booting better than me -- aren't you
>>> concerned about Xen calling get_parent_handle / dir_handle->Close so
>>> many times (by allocate_module_file)?
>>=20
>> I'm not overly concerned there; my primary concern is for it to get call=
ed
>> without need in the first place.
>=20
> Exactly my thinking! Except that now it gets called 10x times with
> dom0less boot :-(
>=20
>=20
>>> My main concern is performance and resource utilization. With v3 of the
>>> patch get_parent_handle will get called for every module to be loaded.
>>> With dom0less, it could easily get called 10 times or more. Taking a
>>> look at get_parent_handle, the Xen side doesn't seem small and I have
>>> no idea how the EDK2 side looks. I am just worried that it would
>>> actually have an impact on boot times (also depending on the bootloader
>>> implementation).
>>=20
>> The biggest part of the function deals with determining the "residual" o=
f
>> the file name. That part looks to be of no interest at all to
>> allocate_module_file() (whether that's actually correct I can't tell). I
>> don't see why this couldn't be made conditional (e.g. by passing in NULL
>> for "leaf").
>=20
> I understand the idea of passing NULL instead of "leaf", but I tried
> having a look and I can't tell what we would be able to skip in
> get_parent_handle.
>=20

Hi Stefano, Jan,

> Should we have a global variable to keep the dir_handle open during
> dom0less module loading?

I thought about a solution for that, here the changes, please not that I=E2=
=80=99ve just built them, not tested,
Would they be something acceptable to have loaded_image global?

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 458cfbbed4..b4d86e9f7c 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -44,17 +44,17 @@ void __flush_dcache_area(const void *vaddr, unsigned lo=
ng size);
=20
 static int get_module_file_index(const char *name, unsigned int name_len);
 static void PrintMessage(const CHAR16 *s);
-static int allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
+static int allocate_module_file(EFI_FILE_HANDLE *dir_handle,
                                 const char *name,
                                 unsigned int name_len);
-static int handle_module_node(EFI_LOADED_IMAGE *loaded_image,
+static int handle_module_node(EFI_FILE_HANDLE *dir_handle,
                               int module_node_offset,
                               int reg_addr_cells,
                               int reg_size_cells,
                               bool is_domu_module);
-static int handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
+static int handle_dom0less_domain_node(EFI_FILE_HANDLE *dir_handle,
                                        int domain_node);
-static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
+static int efi_check_dt_boot(void);
=20
 #define DEVICE_TREE_GUID \
 {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0x=
e0}}
@@ -647,11 +647,10 @@ static void __init PrintMessage(const CHAR16 *s)
  * This function allocates a binary and keeps track of its name, it return=
s the
  * index of the file in the modules array or a negative number on error.
  */
-static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
+static int __init allocate_module_file(EFI_FILE_HANDLE *dir_handle,
                                        const char *name,
                                        unsigned int name_len)
 {
-    EFI_FILE_HANDLE dir_handle;
     module_name *file_name;
     CHAR16 *fname;
     union string module_name;
@@ -686,12 +685,11 @@ static int __init allocate_module_file(EFI_LOADED_IMA=
GE *loaded_image,
     file_name->name_len =3D name_len;
=20
     /* Get the file system interface. */
-    dir_handle =3D get_parent_handle(loaded_image, &fname);
+    if ( !*dir_handle )
+        *dir_handle =3D get_parent_handle(&fname);
=20
     /* Load the binary in memory */
-    read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
-
-    dir_handle->Close(dir_handle);
+    read_file(*dir_handle, s2w(&module_name), &module_binary, NULL);
=20
     /* Save address and size */
     file_name->addr =3D module_binary.addr;
@@ -711,7 +709,7 @@ static int __init allocate_module_file(EFI_LOADED_IMAGE=
 *loaded_image,
  * for the reg property into the module DT node.
  * Returns 1 if module is multiboot,module, 0 if not, < 0 on error
  */
-static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
+static int __init handle_module_node(EFI_FILE_HANDLE *dir_handle,
                                      int module_node_offset,
                                      int reg_addr_cells,
                                      int reg_size_cells,
@@ -744,7 +742,7 @@ static int __init handle_module_node(EFI_LOADED_IMAGE *=
loaded_image,
     file_idx =3D get_module_file_index(uefi_name_prop, uefi_name_len);
     if ( file_idx < 0 )
     {
-        file_idx =3D allocate_module_file(loaded_image, uefi_name_prop,
+        file_idx =3D allocate_module_file(dir_handle, uefi_name_prop,
                                         uefi_name_len);
         if ( file_idx < 0 )
             return file_idx;
@@ -811,7 +809,7 @@ static int __init handle_module_node(EFI_LOADED_IMAGE *=
loaded_image,
  * in the DT.
  * Returns number of multiboot,module found or negative number on error.
  */
-static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_ima=
ge,
+static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE *dir_handle,
                                               int domain_node)
 {
     int module_node, addr_cells, size_cells, len;
@@ -842,7 +840,7 @@ static int __init handle_dom0less_domain_node(EFI_LOADE=
D_IMAGE *loaded_image,
           module_node > 0;
           module_node =3D fdt_next_subnode(fdt, module_node) )
     {
-        int ret =3D handle_module_node(loaded_image, module_node, addr_cel=
ls,
+        int ret =3D handle_module_node(dir_handle, module_node, addr_cells=
,
                                      size_cells, true);
         if ( ret < 0 )
             return ret;
@@ -858,10 +856,11 @@ static int __init handle_dom0less_domain_node(EFI_LOA=
DED_IMAGE *loaded_image,
  * dom0 and domU guests to be loaded.
  * Returns the number of multiboot modules found or a negative number for =
error.
  */
-static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
+static int __init efi_check_dt_boot(void)
 {
     int chosen, node, addr_len, size_len;
     unsigned int i =3D 0, modules_found =3D 0;
+    EFI_FILE_HANDLE *dir_handle =3D NULL;
=20
     /* Check for the chosen node in the current DTB */
     chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
@@ -881,13 +880,13 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE =
*loaded_image)
         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
         {
             /* Found a node with compatible xen,domain; handle this node. =
*/
-            ret =3D handle_dom0less_domain_node(loaded_image, node);
+            ret =3D handle_dom0less_domain_node(dir_handle, node);
             if ( ret < 0 )
                 return ERROR_DT_MODULE_DOMU;
         }
         else
         {
-            ret =3D handle_module_node(loaded_image, node, addr_len, size_=
len,
+            ret =3D handle_module_node(dir_handle, node, addr_len, size_le=
n,
                                      false);
             if ( ret < 0 )
                  return ERROR_DT_MODULE_DOM0;
@@ -895,6 +894,9 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *l=
oaded_image)
         modules_found +=3D ret;
     }
=20
+    if ( *dir_handle )
+        (*dir_handle)->Close(*dir_handle);
+
     /* Free boot modules file names if any */
     for ( ; i < modules_idx; i++ )
     {
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 8fd5e2d078..1a91920e8a 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -121,8 +121,7 @@ static char *get_value(const struct file *cfg, const ch=
ar *section,
 static char *split_string(char *s);
 static CHAR16 *s2w(union string *str);
 static char *w2s(const union string *str);
-static EFI_FILE_HANDLE get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
-                                         CHAR16 **leaf);
+static EFI_FILE_HANDLE get_parent_handle(CHAR16 **leaf);
 static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                       struct file *file, const char *options);
 static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *name=
,
@@ -145,6 +144,7 @@ static void efi_exit_boot(EFI_HANDLE ImageHandle, EFI_S=
YSTEM_TABLE *SystemTable)
 static const EFI_BOOT_SERVICES *__initdata efi_bs;
 static UINT32 __initdata efi_bs_revision;
 static EFI_HANDLE __initdata efi_ih;
+static EFI_LOADED_IMAGE *__initdata loaded_image;
=20
 static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdOut;
 static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdErr;
@@ -169,7 +169,7 @@ static void __init PrintErr(const CHAR16 *s)
 }
=20
 #ifndef CONFIG_HAS_DEVICE_TREE
-static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
+static int __init efi_check_dt_boot(void)
 {
     return 0;
 }
@@ -441,8 +441,7 @@ static unsigned int __init get_argv(unsigned int argc, =
CHAR16 **argv,
     return argc;
 }
=20
-static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_i=
mage,
-                                                CHAR16 **leaf)
+static EFI_FILE_HANDLE __init get_parent_handle(CHAR16 **leaf)
 {
     static EFI_GUID __initdata fs_protocol =3D SIMPLE_FILE_SYSTEM_PROTOCOL=
;
     static CHAR16 __initdata buffer[512];
@@ -451,6 +450,8 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOA=
DED_IMAGE *loaded_image,
     CHAR16 *pathend, *ptr;
     EFI_STATUS ret;
=20
+    BUG_ON(!loaded_image);
+
     do {
         EFI_FILE_IO_INTERFACE *fio;
=20
@@ -1134,7 +1135,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
 {
     static EFI_GUID __initdata loaded_image_guid =3D LOADED_IMAGE_PROTOCOL=
;
     static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUID;
-    EFI_LOADED_IMAGE *loaded_image;
     EFI_STATUS status;
     unsigned int i, argc;
     CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
@@ -1240,7 +1240,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
         gop =3D efi_get_gop();
=20
         /* Get the file system interface. */
-        dir_handle =3D get_parent_handle(loaded_image, &file_name);
+        dir_handle =3D get_parent_handle(&file_name);
=20
         /* Read and parse the config file. */
         if ( read_section(loaded_image, L"config", &cfg, NULL) )
@@ -1332,8 +1332,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
          */
         if ( argc && !*argv )
         {
-            EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
-                                                       &file_name);
+            EFI_FILE_HANDLE handle =3D get_parent_handle(&file_name);
=20
             handle->Close(handle);
             *argv =3D file_name;
@@ -1371,7 +1370,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *S=
ystemTable)
     }
=20
     /* Get the number of boot modules specified on the DT or an error (<0)=
 */
-    dt_modules_found =3D efi_check_dt_boot(loaded_image);
+    dt_modules_found =3D efi_check_dt_boot();
=20
     if ( dt_modules_found < 0 )
         /* efi_check_dt_boot throws some error */


Cheers,
Luca



