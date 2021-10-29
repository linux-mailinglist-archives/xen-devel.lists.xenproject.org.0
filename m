Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB0F43F855
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 10:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218434.378863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgMoC-0005j2-3N; Fri, 29 Oct 2021 08:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218434.378863; Fri, 29 Oct 2021 08:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgMoB-0005h1-Uy; Fri, 29 Oct 2021 08:00:15 +0000
Received: by outflank-mailman (input) for mailman id 218434;
 Fri, 29 Oct 2021 08:00:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slsI=PR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mgMoA-0005gt-1t
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 08:00:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 812badc1-e1a6-4478-b2c8-fc401658dba5;
 Fri, 29 Oct 2021 08:00:11 +0000 (UTC)
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
X-Inumbo-ID: 812badc1-e1a6-4478-b2c8-fc401658dba5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635494410;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=zWWkMnk0VLcuj6u8zNi1/XhSa7Uo8z3a8pLCxVqD5xQ=;
  b=hhJX8RDtXZdOv0zeCjpJ7lDcIvanGSqYku3HSIEd6CRpnFv8QMZ4fO76
   9xUxCYenJlVqFed4ehXpHOl+WuvG9VwQLi/RJpaTShMpo5XlB5B2ctzB/
   6gf/nJa3HxAdAZYZ5icQbVpjwt/T2oznMhSxrSYs8ZTTepcJC+3c/aRUw
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: T/8uB8y6BHipisv0wYtGeYuKfIHz/Co2nNp1tW8SEMZt++oByQ7OmGZBPtFDP23EaOqqGymL7m
 odcS80RJRHLnhInxT8wNY1D+S4NnH5SQa2kXYxJLFHs66bNtiHN6L9ODMmESmwWoGxl8J+8vjm
 P4kNADzBcpPR30AnH2nP1IDeGmHoToqDkohj/MkN+fXBkX0OejdIe8c24Qk1OgK49f78uwe07M
 JXdKqXc7whOdXdIKb6Cbyklf6SzqMLiZTMT+/s4YUp9NosekdIQUCMOqoTj/nVEPxPAkwl6MdB
 j63S/CVtjgvTBXyVyXEMmydY
X-SBRS: 5.1
X-MesageID: 56652709
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fqblAq7s4I/tw6nmDa4wGgxRtGTBchMFZxGqfqrLsTDasY5as4F+v
 msXCmqHa/mNMGekL9x0bdyw9RgDucXXz99hGQBlriA8Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2N4w2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 4Vg5b6UZSwQN4r+ov40chZyN3BvFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWlu25oRRae2i
 8wxNBhmXBfqWDtzNg0oL64Ojfz2gF2mfGgNwL6SjfVuuDWCpOBr65DhOcTYUsaHTsJUmgCfv
 G2u12b2GBYBL/SE1CGItHmrg4fnnDz5cJIfEqWi8fxni0HVwXYcYDUoUl+8rei8m1SJcdtVI
 EwJ+QIjtaE3skesS7HVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcGUA8E7t/LsIw1yBXVQb5LEqS4k9n0EjHY2
 C2RoW41gLB7sCIQ//zlpxad2Wvq/8WXCF5ujunKYo67xgQpSd6HQ6CD0FH838xaBaeWZH3Qr
 VFRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/yoyD7LOi89Bk7fR0zap9VJlcFd
 WeK4VsJjKK/KkdGekOej2iZMM8t0bT7XersUvTZf7KiibAgKVfZokmCiaOWtl0BcXTAc4ljZ
 v93ku72VB727JiLKhLsGo/xNpdwn0gDKZv7H8yT8vhe+eP2iISpYbkEKkCSSesy8bmJpg7Ym
 /4GaZDXl0kBDbCuO3GNmWL2EbzsBSJmbXwRg5cOHtNv3yI8QD1xYxMv6ep5E2Cao0ilvriRp
 SzsMqOp4FH+mWfGOW23hoNLM9vSsWJEhStjZ0QEZA/ws1B6ONrHxPpPJvMfIOh8nMQ+nKEcc
 hXwU5jZahi5Ym+coGp1gFiUhNEKSSlHcirVbnT0P2FlL848L+ELk/e9FjbSGOA1JnPfneM1o
 qG61xOdRpwGRg94C93RZu7pxFS01UXxUsooN6cRCtUMKkjq7qZwLCn90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXw108TnXGZlimEJ16JXyC0ZUdv6FB3OYB6wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEijvX155ruKV0lWLiKgsi0FIesnKp4hz
 McgpNUSt161hC01P4vUlStT7WmNcCANCv11qpEADYb3oQM30VUeM4fEAyr77ZzTOdVBNk4mf
 m2diKbY3ukOw0PDdzw4FGTX3PobjpML4UgYwFgHLlWPu9zEmv5og0EBrWVpFlxYnkddzuZ+G
 ml3LEkkd6yB8gBhiNVHQ23xSRpKAweU+xCpxlYE/IEDo5JEioAZwLUBBNuw
IronPort-HdrOrdr: A9a23:SKU8hag+lgoDdMeKYBQGw7jZL3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.87,191,1631592000"; 
   d="scan'208";a="56652709"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFjsVNf871TFpU53+r10y+YAK2rM3srXfA9daPk88ZGVxa6WDLq9y+t/KZtAbtf59JPSjyfl48OtTU92KzGSZERjY9sVGprWrUwKYCyTKiD6dc59P9zh3XcFdj9niByGnjUosTS/+Mtup+AB9j1TfThfdtOvv3/swUc08vFshWzGeXKp17se+RHEhsJPqrX7/s8PSczMznqKkiC51a86rtJCtNooxcE4keKgqnPiQcxAubnO1bkBvLmbX+6q6NfDqi41kNoHrPUarWe/NHErABUu9VJm013dOSNfIYbQaZfkxc9oKr46pPxysSiNmIRkB5Xn49IMUTUBq6ncW5AgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvUEsdRgJYEB/Lr3tu6UBykHzl61yOYeLYa1ksZuKj8=;
 b=TP3h+wkVnnS989wntot9zFKAne9UqfZ9pB5aG1FG1Inb2gQO1mNyMuRJf3o4KBfWw/pYu+CedWCvkxasmySkbwXGoz/XAFIjqMWQ/CXTnpZ3gtajsODx5+K9kvL6nINXvGPCWHHNzCHdKQAQsk1MkFcEBr7MHUUAfyTkhLZzlQF4OQgeKkIDXchCHp2woNnsPaCexFHabLFUz5FCeuHpTCjP5hczBJFOoXEvQnihwK9DSsRNC06rtwiI2o74Wz4CCS44GtpFt6MNQBBqUgEH23tRZo5tSsD2t2v7pQZF/gPGU/A+jiN6J/tx8WSQDKha/5UIDd+BRH2bwzidj3D9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvUEsdRgJYEB/Lr3tu6UBykHzl61yOYeLYa1ksZuKj8=;
 b=jYpQlr0Ak+n/jBInYuA8jlYbEO3KajaPHpCBvcoUXEPgUhn3BZExNePWkvnlmkckEBcrJymNZKCEIjye28ktyIw69cW/1+SmXisRdfw82iFZIGcMiLIo6klKD6UNp+QViH82CBP8+LwmZuHzaRk/I9vlY56Tv6lX3Go2bKlHiI4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Date: Fri, 29 Oct 2021 09:59:56 +0200
Message-ID: <20211029075956.1260-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82bcf445-28c7-47a4-89d0-08d99ab21f02
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923F2E12594906B95931C208F879@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Tlrf2XrUY+IlVeXVLw/q8fcHr6cp3njN5an9ibF/8cwixpF3dyHJbUTEi0A9paaucH05hUZW51fmR/dks9TJhOOudMkHMfAsmG3dRiyHUmiva8M3dcr40cOrm1lhaDzSQfrHZI7AgzAM2RISApkWEcQnBjr29eNAR03JLvDSKeLb5IaDZqTOnrHrdGG4qiZCRl28ko33qvdW+Vj0tXN4ZoX+b5zB22uxQ5QFuHTtUm7lrKhTbdsxPcJtxkNqf3ueic2oQ2yONBSOIArU0y6Gobrcza0jMqSr5wXF2lh2IMwAFDxWrkfl/Vj6AUKl3f3YprSj/sOn2W6cWNB+X1KzUeADFk6UBl2o1/yRqHP2dT10q6GSUYhH7s0iQQvG3V1dsyhh8LTqFlGp+SVSSTd6ngU9HQPv9kgA0RorwPuTXilsvdzavpjST7yoUfrb6zv2a1Coq72aKqDawM/ybZF/JMuCafolMmJh1zzP8Ih7Jz93HEc2r3athlrxAicu7ZYqkUg/CsUDrd8bYKAwsj07oeQYnDSLH6aFjN5ApEPGVg0PaLxhHjmCZ8euqE1tyKJOMo6H0KRtq91ASHwlEX4lZ0FVpYkNPEBTIdVGJuqBbTFVhaNCkF6vs1gVqOo6fbGpyESNNFSVh0YLXGA7OHoAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(54906003)(86362001)(186003)(4326008)(1076003)(26005)(6666004)(6486002)(82960400001)(30864003)(38100700002)(508600001)(2616005)(36756003)(956004)(83380400001)(66556008)(6916009)(2906002)(66946007)(66476007)(6496006)(316002)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJsaVZsZXJKR256eDdwTVFSZTM1WktuTmVobmFLa012MkhTN2tsMXFsZDZR?=
 =?utf-8?B?Uk5PZ3VkODVUSG5yQ0k5WGVsNkpZbkE3ako0M1pwYjloYWpBOWFFek85TVM0?=
 =?utf-8?B?cVY2QjlkL01yeXVxNHRzVWVycVF3M25QME5Wd05CNDRobUR0eDIybUFYZjcy?=
 =?utf-8?B?S0E2V3VtQUdPc0I4OVpRRDZJRS9KQXQ5T0dBbFlMT1VwOFdBbEVBdU9UZE8v?=
 =?utf-8?B?UEFhSGsxcjZVU3NYM2dKdWxuOHVDMWI0eWJUa1FFTzJlUEtzUFltaEx3VXY3?=
 =?utf-8?B?VVA4aUtQaVVOY3QrUENucWdMRE04QllUZytkRnlWRWFibFh1TFA0MGllMFRD?=
 =?utf-8?B?N29CWGc2RjllMUd5NWpUV05ia3d2ekZSaXJiZWNkRFBWZmlIMVVWQlVNdWp6?=
 =?utf-8?B?WW1VL05sOVVSM09DcklGc2E0RmxNSVNvODFMYmFDNWsrSFJyYnFMdUt0WHBr?=
 =?utf-8?B?SHNMcENUN0R3ZzBocCtFR1ErRm0xMHhHTE5IUTFhd0plWDhCU3kxTTlwY2VQ?=
 =?utf-8?B?Y21naGpzeG1SZXRWKzhQbWUrOFJYYnRuOEpDQUx6SlhKUFN3UWhvaW9TSnhL?=
 =?utf-8?B?WXd5bWFtbzZoYVowWVBPTnhpM05PaW1ObHpoL0E1VTluamlwbnFNdWsvVzFQ?=
 =?utf-8?B?WkFyV001RS9jQm1Tb0ErRGVnTjNPSDZLVmxGbnpoNVp5SHlqZWZMVmRnY1Fj?=
 =?utf-8?B?THYyVWJia0hMSm9FMEVTSE5EOE5SakFUSzhKZkJHSURJWFZCcUN0b2N1amxZ?=
 =?utf-8?B?UGJ2M1dMbjd5MlphM1ZFTy9saXpTajJoamYzeDRGWkNHWi93WW9UVFpHSWRM?=
 =?utf-8?B?andWQitLYnJMdDRiSW5DeU80QkdibjkvM2xFUm50d0VLWnZ3RmpXVFc4VWQw?=
 =?utf-8?B?M3NkaUVEdWUzT0JBTW5INFIxS3NMbEg4VUFvbW14TDFlTWV4Smh1SVp2aUgv?=
 =?utf-8?B?dUtVL01aTmdEZFk5U1R6dERnSnFTeTRKY3JYWjdnRUZqeEs4dkJmWnNOYlZL?=
 =?utf-8?B?WVpLZXBEQnVHMHE4U3A2Yk9BU1FhSTRqZUpMRTUwMm5zK0lhV0g4cy9FWUNs?=
 =?utf-8?B?R3JJdUZRWGtmM3R4aVp1dnNQMGFFd1pIbFBJSVF0RHFFM3E2ZWtBZ2ZnYTVy?=
 =?utf-8?B?N1FSWFdVWEs1cEp4TFlYV2hHNDkxbjFMbklNL3k0Mk1VN0N1YXFNbHR1QU1S?=
 =?utf-8?B?V0xvSkZyL2RoRmJMSjNVYjlzVFFDVGQ1LzBKRWJrTUhnSWRxZTVoaHhQbWI1?=
 =?utf-8?B?QkxuMitsNFIxYXRiWi8wTUpHaUtnZTBWU3FEUE1GQW1iNDNuZTdoZUY3bjVy?=
 =?utf-8?B?YnVqOC9wb2RuMExzeEVSZ1dOdUh1MWZZWWlvMWxJU20rK0xoQk5LY2gwQmE1?=
 =?utf-8?B?WWxpRzZSZHkySGMzQ3p2VmNzTHlJQTQ3N2I2eExSR000ZDcwWFlpZ3QwVDFJ?=
 =?utf-8?B?dlFUZFhRTUo2VjRLcHBWb1lkSlZqVHZMME95QXBtK000OFFoSjBEcGNOZzFV?=
 =?utf-8?B?YjNKRGZ4UVlsck95UEoxVHJpa0NrMnJsOXFpbnJtb25sMk9NczhqbisxSU4v?=
 =?utf-8?B?Tk9yTmVNbXJDVVNBR3ZqVDM2MDdkdDk3YjFPWHNTMGkwYW91Z09ha1VFSzRn?=
 =?utf-8?B?VG53RnpKSmJMS2N5S3UvNUx6ZDNvNjZGczlwOWlwazVwYVA0SlVESWZSbjJz?=
 =?utf-8?B?dmY5YWJtVmZjVThVUkZZU3pTaXpEbWhtS0xFZDF1Y1lhV05GR0ZpOERkakZn?=
 =?utf-8?B?RlZqOGVJa1FiZ3VkYWo4R3VFeC81Q3l5OWNVbGI1aFVkdHZXSjh0WkxieVFV?=
 =?utf-8?B?ak9xUGdnc0M4TmZ0WXV3dHVUUSt0akF4R2IrZDdJZVJmUWRaV0srUy80VEM4?=
 =?utf-8?B?ME5DYjd4cUkybVN5QjJLc2JNTlhKZ3BrYURVeHhPc01GQ1V0RHI4ODROMm1z?=
 =?utf-8?B?QXRoY3ZWTFdRaUNBZHpQMWd5dWdPR1ByMVFLaUtGb2gvVFZRaXRLbjhWc3JN?=
 =?utf-8?B?cFY4ZG53VWVIUS9qQ2lZRUZxdVBVSXJZZk50WXpjWTIxaDlCVXFmdGdPY3FK?=
 =?utf-8?B?eGxDRXE4Z1FjNUxlU29LMURpUDJZL0ZITWdOS0ZMV2l2OWViT1I3TExDdWk3?=
 =?utf-8?B?b1F3L1VQL0ppSDNtVXgwSTRhTjVtZEthY0VhY0xDRVhvY0xucFJIaWJZMU5D?=
 =?utf-8?Q?TnRdyu81NO6ynVXSZe5yr20=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bcf445-28c7-47a4-89d0-08d99ab21f02
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 08:00:06.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kCu7WB3nNhSVsJfQLPxZQxnjZur3G6SWnbGoL4bx2XwlH50f98PaBtjvG/wYhBjA5Bx63yeoeB1dMQ0STcbew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

Introduce a new domain create field so that toolstack can specify the
maximum grant table version usable by the domain. This is plumbed into
xl and settable by the user as max_grant_version.

Previously this was only settable on a per host basis using the
gnttab command line option.

Note the version is specified using 4 bits, which leaves room to
specify up to grant table version 14 (15 is used to signal default max
version). Given that we only have 2 grant table versions right now,
and a new version is unlikely in the near future using 4 bits seems
more than enough.

xenstored stubdomains are limited to grant table v1 because the
current MiniOS code used to build them only has support for grants v1.
There are existing limits set for xenstored stubdomains at creation
time that already match the defaults in MiniOS.

Note that when using the default grant version the specific max
version in use by the domain is not migrated. Any guests should be
able to cope with the max grant version changing across migrations,
and if a specific guest relies on a maximum grant version being
unconditionally available it should be specified on the configuration
file.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
Reviewed-by: Ian Jackson <iwj@xenproject.org>
---
NB: the stubdom max grant version is cloned from the domain one. Not
sure whether long term we might want to use different options for the
stubdom and the domain. In any case the attack surface will always be
max(stubdom, domain), so maybe it's just pointless to allow more fine
grained settings.
---
Changes since v3:
 - Expand commit message re xenstored stubdomains.

Changes since v2:
 - Drop XEN_DOMCTLGRANT_MAX - it's unused.
 - Rename max_grant_version field to max_version in the grant table
   struct.
 - Print domain on log messages.
 - Print a message if host has more than 16Tb of RAM and grant v2 is
   disabled.
 - Add a TB macro.

Changes since v1:
 - Introduce a grant_opts field and use the low 4 bits to specify the
   version. Remaining bits will be used for other purposes.
---
Cc: Ian Jackson <iwj@xenproject.org>
---
Posting this patch alone as I think allowing to control transient
grants on a per-domain basis will require a bit more of work.

Release rationale:

We have had a bunch of security issues involving grant table v2 (382,
379, 268, 255) which could have been avoided by limiting the grant
table version available to guests. This can be currently done using a
global host parameter, but it's certainly more helpful to be able to
do it on a per domain basis from the toolstack.

Changes to the hypervisor by this patch are fairly minimal, as there
are already checks for the max grant table version allowed, so the
main change there is moving the max grant table version limit inside
the domain struct and plumbing it through the toolstrack.

I think the risk here is quite low for libxl/xl, because it's
extensively tested by osstest, so the main risk would be breaking the
Ocaml stubs, which could go unnoticed as those are not actually tested
by osstest.
---
 docs/man/xl.cfg.5.pod.in             |  6 ++++++
 docs/man/xl.conf.5.pod.in            |  7 +++++++
 tools/helpers/init-xenstore-domain.c |  1 +
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_create.c      |  3 +++
 tools/libs/light/libxl_dm.c          |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  7 ++++++-
 tools/xl/xl.c                        |  8 ++++++++
 tools/xl/xl.h                        |  1 +
 tools/xl/xl_parse.c                  |  9 +++++++++
 xen/arch/arm/domain_build.c          |  2 ++
 xen/arch/x86/setup.c                 |  1 +
 xen/common/domain.c                  |  3 ++-
 xen/common/grant_table.c             | 28 ++++++++++++++++++++++++++--
 xen/include/public/domctl.h          | 10 ++++++++--
 xen/include/xen/config.h             |  1 +
 xen/include/xen/grant_table.h        |  5 +++--
 20 files changed, 95 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 55c4881205..21a39adb70 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -580,6 +580,12 @@ to have. This value controls how many pages of foreign domains can be accessed
 via the grant mechanism by this domain. The default value is settable via
 L<xl.conf(5)>.
 
+=item B<max_grant_version=NUMBER>
+
+Specify the maximum grant table version the domain is allowed to use. Current
+supported versions are 1 and 2. The default value is settable via
+L<xl.conf(5)>.
+
 =item B<nomigrate=BOOLEAN>
 
 Disable migration of this domain.  This enables certain other features
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index b48e99131a..0a70698a7c 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -101,6 +101,13 @@ Sets the default value for the C<max_maptrack_frames> domain config value.
 Default: value of Xen command line B<gnttab_max_maptrack_frames>
 parameter (or its default value if unspecified).
 
+=item B<max_grant_version=NUMBER>
+
+Sets the default value for the C<max_grant_version> domain config value.
+
+Default: value of Xen command line B<gnttab> parameter (or its default value if
+unspecified).
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 6836002f0b..7cd1aa8f7c 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -88,6 +88,7 @@ static int build(xc_interface *xch)
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
+        .grant_opts = 1,
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2e8679dbcb..8621161845 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -514,6 +514,13 @@
  */
 #define LIBXL_HAVE_VPMU 1
 
+/*
+ * LIBXL_HAVE_MAX_GRANT_VERSION indicates libxl_domain_build_info has a
+ * max_grant_version field for setting the max grant table version per
+ * domain.
+ */
+#define LIBXL_HAVE_MAX_GRANT_VERSION 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 5a61d01722..431c569dd2 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -607,6 +607,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .grant_opts = b_info->max_grant_version == -1
+                          ? XEN_DOMCTL_GRANT_version_default
+                          : b_info->max_grant_version,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
         };
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9d93056b5c..9a8ddbe188 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2320,6 +2320,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
     dm_config->b_info.max_maptrack_frames = guest_config->b_info.max_maptrack_frames;
+    dm_config->b_info.max_grant_version = guest_config->b_info.max_grant_version;
 
     dm_config->b_info.u.pv.features = "";
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 608d55a456..ce856febe5 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -519,6 +519,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("max_grant_frames",    uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_maptrack_frames", uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
+    ("max_grant_version",   integer, {'init_val': '-1'}),
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index addcf4cc59..d3eacfba6e 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -84,6 +84,7 @@ type domctl_create_config =
 	max_evtchn_port: int;
 	max_grant_frames: int;
 	max_maptrack_frames: int;
+	max_grant_version: int;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 0a5ce529e9..96e5d14643 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -76,6 +76,7 @@ type domctl_create_config = {
   max_evtchn_port: int;
   max_grant_frames: int;
   max_maptrack_frames: int;
+  max_grant_version: int;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index ad953d36bd..1e60925069 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -188,7 +188,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_EVTCHN_PORT     Field(config, 5)
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
-#define VAL_ARCH                Field(config, 8)
+#define VAL_MAX_GRANT_VERSION   Field(config, 8)
+#define VAL_ARCH                Field(config, 9)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -198,6 +199,9 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
+		.grant_opts = Int_val(VAL_MAX_GRANT_VERSION) == -1
+			      ? XEN_DOMCTL_GRANT_version_default
+			      : Int_val(VAL_MAX_GRANT_VERSION),
 	};
 
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
@@ -251,6 +255,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
 #undef VAL_MAX_EVTCHN_PORT
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index f422f9fed5..7564ff323b 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -55,6 +55,7 @@ bool progress_use_cr = 0;
 bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
+int max_grant_version = -1;
 libxl_domid domid_policy = INVALID_DOMID;
 
 xentoollog_level minmsglevel = minmsglevel_default;
@@ -219,6 +220,13 @@ static void parse_global_config(const char *configfile,
     else if (e != ESRCH)
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (!e)
+        max_grant_version = l;
+    else if (e != ESRCH)
+        exit(1);
+
     libxl_cpu_bitmap_alloc(ctx, &global_vm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_hvm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_pv_affinity_mask, 0);
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30192..cf12c79a9b 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -282,6 +282,7 @@ extern char *default_colo_proxy_script;
 extern char *blkdev_start;
 extern int max_grant_frames;
 extern int max_maptrack_frames;
+extern int max_grant_version;
 extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index c503b9be00..117fcdcb2b 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1431,6 +1431,15 @@ void parse_config_data(const char *config_source,
     else
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (e == ESRCH) /* not specified */
+        b_info->max_grant_version = max_grant_version;
+    else if (!e)
+        b_info->max_grant_version = l;
+    else
+        exit(1);
+
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0167731ab0..faeb3eba76 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2967,6 +2967,7 @@ void __init create_domUs(void)
             .max_evtchn_port = -1,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
+            .grant_opts = XEN_DOMCTL_GRANT_version_default,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -3074,6 +3075,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version_default,
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b101565f14..b5b6c75447 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -750,6 +750,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version_default,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8b53c49d1e..0c7052c770 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -678,7 +678,8 @@ struct domain *domain_create(domid_t domid,
         init_status |= INIT_evtchn;
 
         if ( (err = grant_table_init(d, config->max_grant_frames,
-                                     config->max_maptrack_frames)) != 0 )
+                                     config->max_maptrack_frames,
+                                     config->grant_opts)) != 0 )
             goto fail;
         init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index e510395d08..f94f0f272c 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -53,6 +53,7 @@ struct grant_table {
     percpu_rwlock_t       lock;
     /* Lock protecting the maptrack limit */
     spinlock_t            maptrack_lock;
+    unsigned int          max_version;
     /*
      * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
      * values are invalid.
@@ -1917,11 +1918,33 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames)
+                     int max_maptrack_frames, unsigned int options)
 {
     struct grant_table *gt;
+    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
     int ret = -ENOMEM;
 
+    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
+        max_grant_version = opt_gnttab_max_version;
+    if ( !max_grant_version )
+    {
+        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
+                d);
+        return -EINVAL;
+    }
+    if ( max_grant_version > opt_gnttab_max_version )
+    {
+        dprintk(XENLOG_INFO,
+                "%pd: requested grant version (%u) greater than supported (%u)\n",
+                d, max_grant_version, opt_gnttab_max_version);
+        return -EINVAL;
+    }
+    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&
+         max_grant_version < 2 )
+        dprintk(XENLOG_INFO,
+                "%pd: host memory above 16Tb and grant table v2 disabled\n",
+                d);
+
     /* Default to maximum value if no value was specified */
     if ( max_grant_frames < 0 )
         max_grant_frames = opt_max_grant_frames;
@@ -1947,6 +1970,7 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     gt->gt_version = 1;
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
+    gt->max_version = max_grant_version;
 
     /* Install the structure early to simplify the error path. */
     gt->domain = d;
@@ -3076,7 +3100,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         goto out;
 
     res = -ENOSYS;
-    if ( op.version == 2 && opt_gnttab_max_version == 1 )
+    if ( op.version == 2 && gt->max_version == 1 )
         goto out; /* Behave as before set_version was introduced. */
 
     res = 0;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 51017b47bc..0ec57614bd 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -89,14 +89,20 @@ struct xen_domctl_createdomain {
     /*
      * Various domain limits, which impact the quantity of resources
      * (global mapping space, xenheap, etc) a guest may consume.  For
-     * max_grant_frames and max_maptrack_frames, < 0 means "use the
-     * default maximum value in the hypervisor".
+     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
+     * means "use the default maximum value in the hypervisor".
      */
     uint32_t max_vcpus;
     uint32_t max_evtchn_port;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
+/* Grant version, use low 4 bits. */
+#define XEN_DOMCTL_GRANT_version_mask    0xf
+#define XEN_DOMCTL_GRANT_version_default 0xf
+
+    uint32_t grant_opts;
+
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
 
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index b76222ecf6..37b42c756a 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -81,6 +81,7 @@
 #define KB(_kb)     (_AC(_kb, ULL) << 10)
 #define MB(_mb)     (_AC(_mb, ULL) << 20)
 #define GB(_gb)     (_AC(_gb, ULL) << 30)
+#define TB(_tb)     (_AC(_tb, ULL) << 40)
 
 #define IS_ALIGNED(val, align) (((val) & ((align) - 1)) == 0)
 
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 41713e2726..fe6225346f 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -36,7 +36,7 @@ extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames);
+                     int max_maptrack_frames, unsigned int options);
 void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
@@ -67,7 +67,8 @@ int gnttab_acquire_resource(
 
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
-                                   int max_maptrack_frames)
+                                   int max_maptrack_frames,
+                                   unsigned int options)
 {
     return 0;
 }
-- 
2.33.0


