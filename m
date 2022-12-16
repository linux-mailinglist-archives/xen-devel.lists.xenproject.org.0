Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5305C64EADE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464461.722924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DR-00082k-2K; Fri, 16 Dec 2022 11:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464461.722924; Fri, 16 Dec 2022 11:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DQ-00080D-Tg; Fri, 16 Dec 2022 11:49:24 +0000
Received: by outflank-mailman (input) for mailman id 464461;
 Fri, 16 Dec 2022 11:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p69DP-0004Iy-Mc
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id accc2341-7d37-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 12:49:21 +0100 (CET)
Received: from mail-dm6nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Dec 2022 06:49:13 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5833.namprd03.prod.outlook.com (2603:10b6:806:114::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 11:49:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 11:49:10 +0000
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
X-Inumbo-ID: accc2341-7d37-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671191360;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iN+POd6iucM0FuIyOncCIlDCt+Sf6dLn+TRP+YnCtpQ=;
  b=bgpKKMRQ9LX2Bgwnf6DAtYOx9IVq+V+NPD67aw8BGTIGV9QGFFm6aAq1
   kzFWvdlxtVFcK0NJLM9xFv7J9wtVTn10c7y0/PAaLtOs2MA44m2fa3e9o
   WB1vcN3rD4JuKvJijs0fcxY4FXslDxI8xEICSIpPnXk16pK3STTyf2lSF
   g=;
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 87702937
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zAk9v6xrVqfyFAjacjp6t+e2xyrEfRIJ4+MujC+fZmUNrF6WrkUDy
 GROWTqFOvmPYGL3Kt0gPIW+/EtVupXUn9VjTgA4+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPK4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWRF8
 +QHFm0SUhrAq9nvx73jduZVjO12eaEHPKtH0p1h5RfwKK56BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVkFEZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOkB9pIRebnnhJsqAyUny8RFS9KbgS+ndyi20SHYYh+C
 FNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMS706
 yCHqm45nbp7pcQGzbmh9FbLxTelvIHUTxUd7x/SGGmi62tReomhYIC57EnB2vxJJo2ZU1qps
 WANno6V6+VmMH2WvCmEQeFIELT34f+AaGHYmQQ3Q8Rn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqq8ggZmCnSpSDK6wQ==
IronPort-HdrOrdr: A9a23:ynbWS6gVekjedD9wSXBn1JYqaHBQXssji2hC6mlwRA09TyX4rb
 HMoB1/73SftN9/Yh0dcK+7Scu9qB/nm6KdgrNwAV7BZmTbUQKTRelfBODZrAEIdReeygdV79
 YET5RD
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="87702937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+9gm2UN9/NZcDwww151PtKQxDs7thTet5PvT09zIMnkU1xDndZE2QUy/kbTXZ+FGDxEPZLL9bO45aal9QeooHLsIJG3DsOKA8AWN/RdEo9DebOf9JkuZqzrxGGAcJbq/flNPZvy2RrStfYSYvLp+PewTJjeuDX/Sfv5C/IRwrNmyWu959JzJyk2VVjNtmi9dIT5AyfKal1EoQ9FTuwC062VLoOOORQDx1mdzYhhbwlVuHNK1Tww1QlMzNnNRogNc6rFYM1kXbbBOHJ3i3SD2p2Gm7+ZhBFpu7D/Ak4bKve42nq4OZ6vcvf+Iy5Hvh/uDNULcyU/kpjyxwwPxAcRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iN+POd6iucM0FuIyOncCIlDCt+Sf6dLn+TRP+YnCtpQ=;
 b=eIwo5hhY8YcUnkOUKMjxJLHtG1oQ+Zr4/a2X45US4bxv5XEa+tCm86L93uXvY6KdyZPw7NFR2/PrbS2mWxs8DqhLkworZGH7sLsRXXxYYvo+wq6y/ZlzfSZvhoABVs5of8FKu8a2cw1qT7Hrhhl70BvOJ+oVy7vhbFur1rxNRUT8/VvzVKQGZ0pzbZGS91lGs9O6LgYelYV2rZVMrrBGvWUSBi0P5SliBLQtZN3+W0MFbmxADogzzscwHklERf4/UtjJQfQQ2bEiLV0y4uuQ2ioQxf6X9CihzckZ/mIwjaTzHAFxVK3/MnkFIFN+hHUJoZL6GCQjm1TH81yZShSijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN+POd6iucM0FuIyOncCIlDCt+Sf6dLn+TRP+YnCtpQ=;
 b=aQ/g7r9mVc2HZX09MlILsmQLH2bBffnQr2x1UmuEYdgoc+u34Im8nE3Ti9ZkD3mgaU5bHO6ySfewlkqfvxTAdhNOq2xhYj4zqgQmLPbL8NoHuUT0PY1+Qv2XWjwK2Sjx5staxvETWozHUlfX/UG8ZBM7YC/rCJaGrEfJylqC4Og=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH 2/2] NUMA: replace phys_to_nid()
Thread-Topic: [PATCH 2/2] NUMA: replace phys_to_nid()
Thread-Index: AQHZDudxkldNMZdm+EWY9M6n0vcTdK5wawGA
Date: Fri, 16 Dec 2022 11:49:09 +0000
Message-ID: <3a776bac-08d1-7772-b069-8a11583a4720@citrix.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
In-Reply-To: <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5833:EE_
x-ms-office365-filtering-correlation-id: 31cc8179-2a72-45a0-5200-08dadf5b8b5d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 R8RHULYx/c3jwPC6ZMgfK/ZISFzFlKiDYetfE2qIhuu+RD1nDOoa/5vl0FNjf3u/UjpBa2UBlZITcmn/nn1CdcZzYl+AyglidF256FnOg2Zk4ToYUjkiUQcjBJwZfe59Ok53HPw4/qyE2rrqlyU7nyMIpapzkkR773zFh6RkccTASSnCHqatrVeI92Qzfe4KXqXom34N6vTIsOQdD+gOtIlnMLf5uRNMpS/ECFPGNxmVDd3wXHSFmKF85xiPrhf8nCAUloQKOyNjbrY+40rEvW5mNBc7DsyGyPlcfSW72D8XQbg1yRso6jVy5TKVwGM4Mj5MW/WtrqaGVT+ZnBFJoVtB9uNgi3aPuNq1TXmyk0S5fUNkPCfx/4lwWJFxIBbRIwcQr2Y4Dw6aG+iH1LW5a/pn+t7M+zOXF6l7jddFOjXJClKgnqRuAyHz5GLrzTqUAnPnSBqdsXmsbt2Uyo1uGKmENnSwtWxSUdGdoEM3FrZ6PIlbSaP1GIaNWGhgN8xecFFz8LZ4AHmkszkiVlxzguMnFmxbBc7I7WXFWyi92Yq8iSpTqKUZjOyG4LUDJFWHfmXDaIZmh2MochfDCKvpd7iVv4Y7g7JsZ+eDE7pV9tGAMSfLKNlJi9aq4SMGHoWZhTLhkK4Mkv6kEb/0I4E9sMr9yGrUxa7rwfn3UIcQek10gb8/mDJWUjpIiN3EXAPSrDXTbE0L5B0DQabcrAeSeGYeSe7VpFOSLFoEWPjVXhnl/xz8p85Uma38zaZEJlh1NZ8FD2uycjQ9v9JGPzbRWw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(53546011)(36756003)(41300700001)(8936002)(4326008)(66476007)(54906003)(91956017)(110136005)(316002)(66446008)(66946007)(64756008)(66556008)(8676002)(76116006)(83380400001)(82960400001)(38100700002)(122000001)(38070700005)(478600001)(71200400001)(6486002)(2616005)(26005)(86362001)(31696002)(6506007)(186003)(6512007)(2906002)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K3FwZmM0bXkzQnFZNGpkRTJXRUtuVnB2TFhPbENVRjVvNDYvZWh4M0ZlNVhI?=
 =?utf-8?B?WmNhajBOR0RyVHgyTUtibUxCQWMxWVBVb3BOdXlHd3QydEtQNXV4eXluSnRW?=
 =?utf-8?B?OUpqQjdEMTVyWStzV2t3aGN2eEJ0STE4b1d2VmQ2QU4zVkt2UXJKS2NnUUVH?=
 =?utf-8?B?NDcyNHBKWnEzcW5mNmNacnkzbmpBcGNia2twcjlNNXR1a0VTSUNFWDBMWk9O?=
 =?utf-8?B?RzdPcWtCRzk0ellFOS9oRFhQNDJKYklMLzhnTE1xVy83Z2dlUnZ4bDNOY21T?=
 =?utf-8?B?TlRZUDBrVXlodlkvL3c0Y2c1ckZ6dkYzL2ZTWTEzU1lLZXNleVNHeUFudEg3?=
 =?utf-8?B?KzlCK3ovMlVxd3ExMzJwM3V0MnB5bUpHNEc2c1R1cVlMT1VKNlNYaklvM0hR?=
 =?utf-8?B?ZG5scHY1bE9YVHNjY0FPYk5XakkrTTdwNm5oaGRrZUpsQndieWNNNzZ4cTFR?=
 =?utf-8?B?R0dPbE1qMm1KelB4dXArQXhwTllWVXJabm5DVnlRdmtKd0ZXMGZYbzUxUGZW?=
 =?utf-8?B?VXJEYzRzQ3VvcW1oVzJodWxEWVVBTVkwbEVPaEwzSlplSTQ1d1BRRllPU0xS?=
 =?utf-8?B?K0V1L0xJczlFQVhZN21IMWtDbkx4eXNta3N4bjhoam14QjRzc2d0bW1NV082?=
 =?utf-8?B?Y1Fmc29FUkRXZEZxS3RpV3Q2Qk5jVFZIRnRoU3VKKzVEUFNXaEc4SGM2OEM0?=
 =?utf-8?B?aG5WSXBUdzJhNDZzUEpOUHA0ckFjYm5qVHVmc2ZsaVBRVzY5QmYvNnkwemkr?=
 =?utf-8?B?SU5GcFlIaWVsN0xUUWxRWklrZG5jTFZuRTkraWwreG0zYkJ0dVFrZ2hRNUxw?=
 =?utf-8?B?Z0lYbEtobmdkZTNON1FjODdOTFZPUEhqODg1ME5XMFJIUEM1NzdkUkVRTWtJ?=
 =?utf-8?B?TmRSclorcXFuSzN4VjlJeDZQYmx5RVo2Y25xaXZkeWtqeU82UEhDOE9rczZN?=
 =?utf-8?B?ZXNzc0NTYzVVTVpHUFZGMHROdmhSUXJRTVliMFk4UFN6eHp4L29LMHpZU2VX?=
 =?utf-8?B?cXpFckdVbDY2OWozN3RMTWkySVRtRmlvNG9BQVRlMFNuTXNOUG1sVGRJS3NB?=
 =?utf-8?B?Y0lNMjV0V05vclUwVjZFbFZCdVRac2k4RlNLZnRnZUtuMFhhN3JPZjZiUHVC?=
 =?utf-8?B?MWlTaHl6aHZtUVB5VzU4SFhwMWpqbjVMM2dNdGpRbDQxV1pETjFFVk1tZlFz?=
 =?utf-8?B?c0tVcndpdXgzSXRCRGhLeWNPc2k2K053QWQ0R3lueGh3VzVIR2VTZlRMUktM?=
 =?utf-8?B?UWN6TVFqT2VvdVhQZkpCZDgxQnpuY0x1ZlYreG51YWFZTzcvQXdTbTdXSlVU?=
 =?utf-8?B?aUpHWjBOTThtSEM5ZUdzNmxwbnRiNTQrZlIrMnNmMThuSEV0SlhoNEtLZ3Vh?=
 =?utf-8?B?R1ZMWGtBTTY3TDduSGRTSDl2TWgycXFQYS9qUUdqd0FBU1NJRFVIVEJrb1Jn?=
 =?utf-8?B?RklpZ0o3VmpXV2h3UDVFZ3dZZGpKTzQ4K1EvaU9hcng2b2EwOVVRVlE2L25L?=
 =?utf-8?B?NUx0SWNJdC9hRUptNThRWlNEZ0g2aGdNVDQzSURweXFPSDZPRnUvc1lYSWVL?=
 =?utf-8?B?SnlxRHM0aVYyUDNmb1VoNUs0NGV3bTRwa0kxRUp0NWtyZXNUYXlIbFZhak1r?=
 =?utf-8?B?YWZjTWw0ZjdnS0dyWXdyR0tVRm01ZG16eHh4S3hXRysvV2ZLRnZHTDd3TXdW?=
 =?utf-8?B?YjQrSzRYNmMzTTBzWEp6VmFKOFlCb3h2WDN0QjExUFFCa1lVR2Q3TmNUOTZY?=
 =?utf-8?B?MHp0SWtlREwvc21iQXM1Y21zdndrUlhrL0lmeWJZbkNhMmYrcDJ1OGdhNE5N?=
 =?utf-8?B?S3ZQeGtJdmdUUlgzNE84VkR3a2hNeTV1OXF2VTl2RDh6MUNSM3hzZU5FZGlN?=
 =?utf-8?B?MXA3TkRvVndUdGJoclNMd3VtSSs5NkxGYUkrdkdoejZ3Q0NVNloyc05BTldp?=
 =?utf-8?B?eTU1cTYvNkZlZ05NMHJMV1ExMmg1MUFWZlB5anljRlIxbXRRQ2MrVkZsR3hY?=
 =?utf-8?B?YUZaaERXVWNOdXJ4RHlkLzZiWEQwYzJxcXY4UmNNaldsUHdPVUVpOGpJbjQx?=
 =?utf-8?B?UmpFWDBkMy9vRXIrOTBoVXBkbXRVTFR4eFZ1bVlLcFlUZDFPb3JucS9ZTVFy?=
 =?utf-8?Q?GXRmtKQNovhA7XGyO6ve/e1VS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B7BFE593A554342B25998A68382CB90@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cc8179-2a72-45a0-5200-08dadf5b8b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 11:49:09.9357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rNAMnmLdIbyxF9LiVRimGw5vkVJjJmIriU4g8CukSqoqYB7xxCx1nSwMCkJw4+UVazdOI7JxK/HG8Khac/VYxKUgS57k2xaT9xdydj5pOr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5833

T24gMTMvMTIvMjAyMiAxMTozOCBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFsbCBjYWxsZXJz
IGNvbnZlcnQgZnJhbWUgbnVtYmVycyAocGVyaGFwcyBpbiB0dXJuIGRlcml2ZWQgZnJvbSBzdHJ1
Y3QNCj4gcGFnZV9pbmZvIHBvaW50ZXJzKSB0byBhbiBhZGRyZXNzLCBqdXN0IGZvciB0aGUgZnVu
Y3Rpb24gdG8gY29udmVydCBpdA0KPiBiYWNrIHRvIGEgZnJhbWUgbnVtYmVyIChhcyB0aGUgZmly
c3Qgc3RlcCBvZiBwYWRkcl90b19wZHgoKSkuIFJlcGxhY2UNCj4gdGhlIGZ1bmN0aW9uIGJ5IG1m
bl90b19uaWQoKSBwbHVzIGEgcGFnZV90b19uaWQoKSB3cmFwcGVyIG1hY3JvLiBSZXBsYWNlDQo+
IGNhbGwgc2l0ZXMgYnkgdGhlIHJlc3BlY3RpdmVseSBtb3N0IHN1aXRhYmxlIG9uZS4NCj4NCj4g
V2hpbGUgdGhlcmUgYWxzbyBpbnRyb2R1Y2UgYSAhTlVNQSBzdHViLCBlbGltaW5hdGluZyB0aGUg
bmVlZCBmb3IgQXJtDQo+IChhbmQgcG90ZW50aWFsbHkgb3RoZXIgcG9ydHMpIHRvIGNhcnJ5IG9u
ZSBpbmRpdmlkdWFsbHkuDQoNClRoYW5rcy7CoCBUaGlzIHdpbGwgaGVscCBSSVNDLVYgdG9vLg0K
DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LCBhbGJlaXQg
d2l0aCBvbmUNCmRlbGV0aW9uLg0KDQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL251bWEuaA0KPiBAQCAtMSw2ICsxLDcgQEANCj4gICNpZm5k
ZWYgX1hFTl9OVU1BX0gNCj4gICNkZWZpbmUgX1hFTl9OVU1BX0gNCj4gIA0KPiArI2luY2x1ZGUg
PHhlbi9tbS1mcmFtZS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9udW1hLmg+DQo+ICANCj4gICNkZWZp
bmUgTlVNQV9OT19OT0RFICAgICAweEZGDQo+IEBAIC02OCwxMiArNjksMTUgQEAgc3RydWN0IG5v
ZGVfZGF0YSB7DQo+ICANCj4gIGV4dGVybiBzdHJ1Y3Qgbm9kZV9kYXRhIG5vZGVfZGF0YVtdOw0K
PiAgDQo+IC1zdGF0aWMgaW5saW5lIG5vZGVpZF90IF9fYXR0cmlidXRlX3B1cmVfXyBwaHlzX3Rv
X25pZChwYWRkcl90IGFkZHIpDQo+ICtzdGF0aWMgaW5saW5lIG5vZGVpZF90IF9fYXR0cmlidXRl
X3B1cmVfXyBtZm5fdG9fbmlkKG1mbl90IG1mbikNCj4gIHsNCj4gICAgICBub2RlaWRfdCBuaWQ7
DQo+IC0gICAgQVNTRVJUKChwYWRkcl90b19wZHgoYWRkcikgPj4gbWVtbm9kZV9zaGlmdCkgPCBt
ZW1ub2RlbWFwc2l6ZSk7DQo+IC0gICAgbmlkID0gbWVtbm9kZW1hcFtwYWRkcl90b19wZHgoYWRk
cikgPj4gbWVtbm9kZV9zaGlmdF07DQo+ICsgICAgdW5zaWduZWQgbG9uZyBwZHggPSBtZm5fdG9f
cGR4KG1mbik7DQo+ICsNCj4gKyAgICBBU1NFUlQoKHBkeCA+PiBtZW1ub2RlX3NoaWZ0KSA8IG1l
bW5vZGVtYXBzaXplKTsNCj4gKyAgICBuaWQgPSBtZW1ub2RlbWFwW3BkeCA+PiBtZW1ub2RlX3No
aWZ0XTsNCj4gICAgICBBU1NFUlQobmlkIDwgTUFYX05VTU5PREVTICYmIG5vZGVfZGF0YVtuaWRd
Lm5vZGVfc3Bhbm5lZF9wYWdlcyk7DQo+ICsNCj4gICAgICByZXR1cm4gbmlkOw0KPiAgfQ0KPiAg
DQo+IEBAIC0xMDIsNiArMTA2LDE1IEBAIGV4dGVybiBib29sIG51bWFfdXBkYXRlX25vZGVfbWVt
Ymxrcyhub2QNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90
IHN0YXJ0LCBwYWRkcl90IHNpemUsIGJvb2wgaG90cGx1Zyk7DQo+ICBleHRlcm4gdm9pZCBudW1h
X3NldF9wcm9jZXNzb3Jfbm9kZXNfcGFyc2VkKG5vZGVpZF90IG5vZGUpOw0KPiAgDQo+ICsjZWxz
ZQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIG5vZGVpZF90IF9fYXR0cmlidXRlX3B1cmVfXyBtZm5f
dG9fbmlkKG1mbl90IG1mbikNCj4gK3sNCj4gKyAgICByZXR1cm4gMDsNCj4gK30NCg0KcHVyZSBp
cyB1c2VsZXNzIG9uIGEgc3R1YiBsaWtlIHRoaXMsIHdoZXJlYXMgaXRzIGZhbHNlIG9uIHRoZSBu
b24tc3R1Yg0KZm9ybSAodXNlcyBzZXZlcmFsIG5vbi1jb25zdCB2YXJpYWJsZXMpIGluIGEgd2F5
IHRoYXQgdGhlIGNvbXBpbGVyIGNhbg0KcHJvdmUgKGJlY2F1c2UgaXQncyBzdGF0aWMgaW5saW5l
KSwgYW5kIHdpbGwgZGlzY2FyZC4NCg0KQXMgeW91J3JlIG1vZGlmeWluZyBib3RoIGxpbmVzIGFu
eXdheSwganVzdCBkcm9wIHRoZSBhdHRyaWJ1dGUuDQoNCn5BbmRyZXcNCg==

