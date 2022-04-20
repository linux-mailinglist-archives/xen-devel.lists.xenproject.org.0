Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3E507E79
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 03:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308548.524350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngzZ8-0001zP-NI; Wed, 20 Apr 2022 01:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308548.524350; Wed, 20 Apr 2022 01:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngzZ8-0001vt-Jl; Wed, 20 Apr 2022 01:55:34 +0000
Received: by outflank-mailman (input) for mailman id 308548;
 Wed, 20 Apr 2022 01:55:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vn5Q=U6=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngzZ7-0001vn-40
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 01:55:33 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5005c64-c04c-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 03:55:30 +0200 (CEST)
Received: from DB6PR07CA0083.eurprd07.prod.outlook.com (2603:10a6:6:2b::21) by
 AM9PR08MB6130.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 01:55:28 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::e4) by DB6PR07CA0083.outlook.office365.com
 (2603:10a6:6:2b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Wed, 20 Apr 2022 01:55:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 20 Apr 2022 01:55:28 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Wed, 20 Apr 2022 01:55:28 +0000
Received: from 01d66172b896.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F94CD320-86B6-402A-B416-82BA2C634761.1; 
 Wed, 20 Apr 2022 01:55:21 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01d66172b896.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Apr 2022 01:55:21 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR0802MB2398.eurprd08.prod.outlook.com (2603:10a6:800:af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 01:55:19 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 01:55:18 +0000
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
X-Inumbo-ID: f5005c64-c04c-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT0Zyj6iMhdTStnZmYDJbpUXMnxE8HAHQ1pHsAwbroc=;
 b=GkbNs4Jl+6b0vfH1yLj187rFTk5ir01VHJqqdClVmTYmkH9yyeKrKkCFj1Nqp3aYDkLBwCg/G8uZ/EHZjJ4/AM2Tk29LNH+VJ5JxWHCmRsimGrYURlkxz5TGUwFQhdMQCw/GkVsNLelYcPlJEVNiKFOcEhd62RkS7K4ig3Z7F4Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4ccd73e9dbb3119
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiNPWJHnjaBTkzXV8L7WPcaE2tu2MYqfdbcBgejzocQAPLLtiRg+ShRdzRaQ0I7TANG1Cz1URw2w2kqS/mJXdkTKCNHSAW2wIVRMVVpUM00IULyImv4SvHPTU0eqB83+jEbtRYBkC+PT3Y4MSzxSKgyewE2koZo0nBTwaJYzbpmQ3YscKbPb0QqXlnqUAse6SJ1hU1asFJXZXAC73YJ/KGIs+uC99pHRPizjYzjNhLWoynVw1nuRGbOxe7f0xCxmuoyJk/zW+RuJjaDPqv0/KDqbFAvJhwLmiYq10j2ZSxicsYL+xhl9zu0E3+MYel/xVbllu7qH66E9ijWVxlB+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT0Zyj6iMhdTStnZmYDJbpUXMnxE8HAHQ1pHsAwbroc=;
 b=oPVHKRYqsktDVoVPGPq1asJ0YqRk1e/M7odqEshdYl45qJKVQbQhTpghsg6Nvjh85FIbi8cOF+ZBF68yTrAFsQwRX8YS0/eHwbUzryb6YDB2UyB2PQkxZu5c9NRJ7jqP7fWPvu7ddNN/P11MxzNIYgXATBB8O8aQC2yu3ZQK/X33bvil9nR0LnV9fjuw/+OONt3L4xrHS/DRkHuWKOS583OnSoSrQ6wxks4YtiO+OLSBhKRGQqI1vO9VMF+F0BaahT7Lx4j+QPR4Ngbd/wQutoEc2GvPmFOwUE1j1Kur/BzS0xZU/pWGbrK4yj4cNFy+7RqWLPeh4hGCzvjKYOjAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT0Zyj6iMhdTStnZmYDJbpUXMnxE8HAHQ1pHsAwbroc=;
 b=GkbNs4Jl+6b0vfH1yLj187rFTk5ir01VHJqqdClVmTYmkH9yyeKrKkCFj1Nqp3aYDkLBwCg/G8uZ/EHZjJ4/AM2Tk29LNH+VJ5JxWHCmRsimGrYURlkxz5TGUwFQhdMQCw/GkVsNLelYcPlJEVNiKFOcEhd62RkS7K4ig3Z7F4Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <5e7ded0e-36f6-2a0a-4dab-30d39e649c05@arm.com>
Date: Wed, 20 Apr 2022 09:55:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Problem creating domU guest on arm64
Content-Language: en-US
To: Marco Cacre <marco.cacre@gmail.com>, xen-devel@lists.xenproject.org
References: <CAGHctbYx6sspA__OmKyumU+WkhzEsDpLstyhRDM9Kbc696Co7Q@mail.gmail.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <CAGHctbYx6sspA__OmKyumU+WkhzEsDpLstyhRDM9Kbc696Co7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::30)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3dfdbc7b-f9ac-4657-bca3-08da2270d836
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2398:EE_|DB5EUR03FT026:EE_|AM9PR08MB6130:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6130DC069B48C24F01CF34DF9EF59@AM9PR08MB6130.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /fyiE+H8JFWxjB8Srai7QXJgqprA7xA+U2RBKTXPZCJLikMQ3m4FVrEkjsbFqUMx9bGdP0a+Z/0VaBjlkRWvEs4aRu7xO8B7QrRB3hkgVQrs4jZj/He1OU6cN2WBF7ZX1JLUZieBxhcdUf0rMK8gRECf06/Iiag9VVVEL3P0z1RvNgoO9UeAiFM3K92fa2Q1nEa3kwkyk866va+pLMwlX9Bp8Q26Coh+jD9JzUGASKPev6YtEckkw635ZoeiNSGAAAbWsstr+0xKx7Ls4mled48HI8O/gGQZtN6sdHWhyXsJ/dUUEEWbvNz2bK3ZrqTmSRGf9ffhlmXRhP7miVrgDurfOiGOliZUAhsrhFx3Hy7NtrzwXYDPkOxhcVVt7t3tbmGjr4s9OweymIvuEljigGFEo8nTB5r1OL5DMMO3TbVKijPxNO5KHbHE5VlWnNazSDCdHBF5MYyLzdnfNWYl34pROLY2IMnWG2SflRHkSaxXlaIo7Yx6pQ3scYP/S2Cw24gA+h63U00znDxKmpdYQNnZgzyQELIaj11H+OWimukaCgcTgyf/a59CCSKMRheK/xMUo7Jddho9GkPNlcvoDFbxreZ7LILNScvnWv+Xt7BCjk6My7m8+VRCHUwWGfSGukhNFaXwaM07nLaetKDkNR9bajliptSwR3iZjMLw3jgdosjKr/4fSQKWqxYPemUxiuopsTgMMxQQEnYnFH271l0m56t2ho78FA9JbaNmfZUA4DYRTETTbKfrHoii1gAn
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(2616005)(8936002)(38100700002)(5660300002)(2906002)(53546011)(316002)(66556008)(186003)(6512007)(26005)(6506007)(6666004)(6486002)(66946007)(31686004)(508600001)(83380400001)(66476007)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2398
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6242ea6-0ea4-43d3-ba5b-08da2270d244
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xbsa5tFIM6y+ZmHPClYDMgVWKjqDKIPhnNecm1CVL1dLO0K375I5nd+7MivjfS4+6gqT5j1EEa2vebxvpSeqYzUfg73QkIWGgFLLgIqflzZ4JKULQW/KLwkSQp6KOoYnRolHkfGPau9yK34phuDY5BpBUzQgC0UEC1WqBXXQ3Bx4XFo/7yusDhFehJNiJDYGxP93JXjrpcRNwJR9R9Mxeag7FW5Pz+AHUT5pI7Q9nNpvoG8bj2L8yFDCOKnr675FSyxrwqHWkJnMcfbbXYVakjZ6NPi+w9Dgiux/YSKsMc3046RQ2l8W4WzEBC1dwaHDSaDGQWiozoDIpH9msrrw+uVEIHufa5aPFbPzj8X4ElLlMXGEsnLRJ1a15YuNOIvEWxiSB6yh30bDWUaBUcNfWWODK8Lvbo1ZoVbBcmZfrA0CWwrAVjglYhBJqGWgvyckC9JPDwhtTx/hWE5k6G55E6vVWAgrgUDgZDRqephRf3EPejgcQS1qGvIcEw0amsT/h76jRwc+hlUHxM4YhIsQpAEGrseSO1yNIQ8a1tdUItNhkiasAJoDEN0a8a/7e5v+pb16y2RGFrLzaGvQnVA0yLWFLM/FiUWEQDM8M9tQ6DUAcCbwY2kijLFzod8sUmq9bN/r5WFHSVhU9iOu6Goy30eUYzcfYLhDKa2YLLpiJGm8znxN91+xLntgPkRNOPgBYSZvLZSIMkUYfDBSEA4hKA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(336012)(8676002)(70586007)(36860700001)(53546011)(31686004)(47076005)(186003)(6512007)(82310400005)(26005)(70206006)(2616005)(356005)(2906002)(8936002)(6506007)(316002)(83380400001)(31696002)(6486002)(36756003)(86362001)(81166007)(5660300002)(6666004)(40460700003)(508600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 01:55:28.5493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfdbc7b-f9ac-4657-bca3-08da2270d836
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6130

Hi Marco,

On 2022/4/15 18:56, Marco Cacre wrote:
> Hi all,
> 
> I'm facing always the same problem (described below) trying to create a 
> Xen guest domain on rockpro64 (arm64).
> 
> I have successfully built uboot, xen (4.14.4) and dom0 linux kernel with 
> xen tool stack, these two last starting from buildroot (with linux 
> kernel version 5.15.33 and xen toolstack version 4.14.4)
> 
> These are the process of Xen:
> 
> 177 root    /usr/sbin/xenwatchdogd 30 15
> 203 root    /usr/sbin/xenstored --pid-file /var/run/xen/xenstored.pid
> 208 root    /usr/sbin/xenconsoled --pid-file=/var/run/xen/xenconsoled.pid
> 214 root    /usr/lib/xen/bin/qemu-system-i386 -xen-domid 0 -xen-attach 
> -name dom0 -nographic -M xenpv -daemonize -monitor /dev/null 
> -serial/dev/nul -parallel/dev/null -pidfile/var/run/xen/qemu-dom0.pid
> 
> and the drivers loaded as a module:
> # lsmod
> Module                  Size  Used by    Tainted: G
> xen_netback            65536  0
> xen_blkback            49152  0
> 
> Xen and dom0 Image boot up successfully, at the end:
> ================================================
>  >xl list
> Name                                        ID  Mem VCPUs State Time(s)
> Domain-0                                    0  1024    2    r-----    4000.3
> 
> # uname -a
> Linux rockpro64 5.15.33 #3 SMP PREEMPT Fri Apr 15 11:01:37 CEST 2022 
> aarch64 GNU/Linux
> ================================================
> 
> when I try to create a domU domain I have problem with disk backend, I 
> have made several attempts trying with different domU linux and I always 
> get the following error :
> 
> ================================================
> Parsing config from ./alpine_xen_domu.config
> 
> libxl: error: libxl_aoutils.c:539:async_exec_timeout: killing execution 
> of /etc/xen/scripts/block add because of timeout
> libxl: error: libxl_create.c:1608:domcreate_launch_dm: Domain 2:unable 
> to add disk devices
> libxl: error: libxl_aoutils.c:539:async_exec_timeout: killing execution 
> of /etc/xen/scripts/block remove because of timeout
> libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain 
> 2:Non-existant domain
> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 
> 2:Unable to destroy guest
> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 
> 2:Destruction of domain failed
> ================================================
> 
> The last try was with alpine domU linux with the following config:
> ================================================
> 
> # Alpine Linux PV DomU
> # Kernel paths for install
> kernel = "/home/xen/vmlinuz-virt"
> ramdisk = "/home/xen/initramfs-virt"
> extra="modules=loop,squashfs console=hvc0"
> # Path to HDD and iso file
> disk = [ 'format=raw, vdev=xvda, access=w, target=/data/a1.img',
>          'format=raw, vdev=xvdc, access=r, devtype=cdrom, 

Have you tried to remove cdrom from your DomU config? I am not sure
cdrom can work well for Arm without device model.

Cheers,
Wei Chen
> target=/home/xen/alpine-virt-3.15.3-armv7.iso'  ]
> # Network configuration
> vif = ['bridge=br0']
> # DomU settings
> memory = 512
> name = "alpine-a1"
> vcpus = 1
> maxvcpus = 1
> ================================================
> 
> thanks a lot in advance
> Best regards
> Marco

