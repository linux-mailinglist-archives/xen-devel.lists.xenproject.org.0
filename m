Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A30B50A0A1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:22:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310172.526875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWl7-0006HN-JC; Thu, 21 Apr 2022 13:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310172.526875; Thu, 21 Apr 2022 13:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWl7-0006DR-FK; Thu, 21 Apr 2022 13:22:09 +0000
Received: by outflank-mailman (input) for mailman id 310172;
 Thu, 21 Apr 2022 13:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhWl5-0005Gk-DJ
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:22:07 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0810eb34-c176-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:22:04 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 09:22:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3649.namprd03.prod.outlook.com (2603:10b6:406:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 13:22:01 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:22:01 +0000
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
X-Inumbo-ID: 0810eb34-c176-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650547325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=CWJ3gYXTvrTAejdEzgkAoSP58R+z0deJo29UzhQr/fI=;
  b=DqMGwY7BH7Xu3wpefUB3/3Xd5/BwD5Y7nxYdgfusPwdk465TFyA2yCB2
   iP6c4Gxs7tX0YKvpi7TlMS3nxV3IeVNY0HpWWL+RhifHHBBvxUPQ7rJX9
   fXtgXG4QUrAIdo2BAJ+Z4Y0UDzTgN12q1v8PKRoQRrVV6GNEDIQZY3ipj
   E=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 69007247
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GH0sHaIDsVV6C8DTFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENSgjwHz
 zdOCDqDPPeKN2r9ed93boS+8E0EuJ/XyYVgHlZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 O1AhLKOaCEPArHJscQNCzNjDTp3MrITrdcrIVDn2SCS52vvViK2ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM2FGvqTjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2CinK2IC9A39SawfxnXKzDIv85/WIv3TR9m6ZJlOvHy0n
 zeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPJVGuw+rQuLmqzd5l/DAnBeF2EYLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqTJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:+adrA6D/jRhC9MTlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dNMEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfXHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+06VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qY5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 129lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ9o+a87bWPHAb0cYa
 lT5Jm23ocUTbraVQGVgoBX+q3jYpxpdS32AHTruaSuok1rdT5Cvg4lLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P6krhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="69007247"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgqzFhEMb3REGoM5kPrbozRoN85IkOtykfZYj8C7oQAu+5a3oYhQmH9wUu1eeoTwnVfpGUhMil389n7hHAyReAJFyQvxb7Sj8A9XnHMee3G6aRZC4gcYhGXpeuyB3pz4GV6jFKseQCdWnsbE5IpS83kKre/RYoY4IsupwtebnMPWhfAW+nagQjS1NU/kPe5+5PvJ2ekvfCbZ6To2/+kAczW9rYbCLKsU8vJh3CJjwpzRCqghAYouZ9sV3Dn1F0K4qFcyUSBiODcX1q6aTyakAbeBbcCMwj78VLGyP3tUT3dUJEeZ7GukrRKQyHcTWZh4NcqtPX2c7tlrP2Xvvd8J/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxFBazBOOa4h2EtJ6XIkMMGyor8r9knW0X4Tj/Qkz/w=;
 b=GXC7Hli8iMEYg4R+juHO5HSGW04cb2/O9XFja9NrOOTLnoBHLo3vhXufa7jWF1x0Rhe93RrgBWClcCOVrSO6UZCkLJKakFBTLQ9RfUB1PbFjpxuFhicHMrIP/H5xImTm28XgA5s6dl/fPCoeAZYMJ/VC62Fi4AYn//mvc4yiDT2J1RGeiaByiKOOaeDv9cKPwOpQx2r6aMdehJXa65rgI3I2X9t760evXnI73VFQa5ZQuJ6tU0Ztg0yU2Wtm6Wj7aYgy6EhCJ99+fKqnlHkNj+lHo4XD22R52rBKwlWCdbTslerdDRi3YND1wOrkAKoB87hiwG3afGoRcaSLu3C3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxFBazBOOa4h2EtJ6XIkMMGyor8r9knW0X4Tj/Qkz/w=;
 b=pxPZZwsIJEHX4ag+xFGuRqtcRAC73Flpvb1vt5nRD9c4zJmNMuyt3ymaI56DkUtGR/ib8JKG2yEetq2hKQnaRIFf9MCvcnfDTty0Jh2CO+sKLwYya1PnCTYJ0e33zQQUWmG/G6dXr3Pgd8zfRKsuJ+BhIiiGsxyMq1+ANf8g05w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 3/6] x86/ioapic: RTE modifications must use ioapic_write_entry
Date: Thu, 21 Apr 2022 15:21:11 +0200
Message-Id: <20220421132114.35118-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421132114.35118-1-roger.pau@citrix.com>
References: <20220421132114.35118-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fc159d7-4677-41c1-b0fa-08da2399eb40
X-MS-TrafficTypeDiagnostic: BN7PR03MB3649:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB36492E595859797E3D28CD4C8FF49@BN7PR03MB3649.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E5TsDMUE/03yaWqirUV8gPSNx13m1xR5/GWs/twknhLFj2g0HdqAlZkWkMIYCMnRlG8gQjAHAfMqGDHXz4tOYrPtOqnuapoyadmFjSuoS7kE0T8ItUJovz/qg6c/ySrawLeAtXthXdlri57GoivJxCyHQxdkuGFy/oEz+JKXU7HZyca3gmy4HIR0Ft82r0ZqfxYV+RYcuAsmcim4D6c1Sd5BD5LrpC/+qkmlg2Fb7up95npII67k6dKdRwAG6GAsoNxPDnjhPihjXCuK+eDlWxrftfaxb1EcNklcoN4PS+VGfYxKVYOtZb+5NaeHXkielLi6N/k+RFiMuQ0U64b4YxTYrQy1WV7cT7Xv9dpnSSHLDVlamI5twMK5j7fQx5yYAUNTUm2EXsbMfc4mTaC8xJle1/V/hJnynytPtIpof6Q/0B6s9iq14D0suVC4XSlryLRo39c7k4edvQzv+mIyAH4j5MObhhUlRWfDnvRD/Hojy3XLaqAOCMgPk7VjD0DXSOHt4fR/UA8TqoS0CSVfgY03qZExo3wmcG5HEVXwMlVGMc7CMp9Z+FM6Zl9WmRbxOuytbA459UUmw4Pv7rRABnmbiAt+inekpGGTagykGdR+yHGJLQGM6x1ujIDKwGOVpvN9kct1wHvY9n+Ui+hsYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6666004)(1076003)(6512007)(316002)(26005)(36756003)(54906003)(6916009)(2616005)(2906002)(6506007)(8676002)(4326008)(83380400001)(38100700002)(82960400001)(8936002)(66476007)(66556008)(66946007)(86362001)(6486002)(5660300002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFU1WmQ3WStZWnlieDRuSmNYYjNyV2p5K21NVWdTemhGdXBPbjhjSHRzOEVR?=
 =?utf-8?B?YmFvdHFDQUd3K3J3SlptN3dqTUZKbFBJQW80RVZoRndCMDJ4QmRUVGVmNVhX?=
 =?utf-8?B?YVYwOHNjUEprajJJbzZVYVRXdmhtVE9iOTVlQkt3OWlLZStyaU1DTEZFU0pR?=
 =?utf-8?B?dStTWnloSkJkdFVGN2dBaHFMS20rdXpZWlFlcU1uaCtkQU9FZ2psaVRCMGh3?=
 =?utf-8?B?YmVZYkE5clNsVWMvbFBQSjJXUUVPVldhRmRWWXB4dFJtZHBCOXVwNVBvb1JN?=
 =?utf-8?B?cVVJeEl4NzN3M3M1dXVQMTF1MWRtWG94UHZzc01panZSUEhieno1bDNUZzJD?=
 =?utf-8?B?cGg2dXRJWXBVakhJWTVwQzQ1UmdKMzNLQ2VpVHBQM3BBQVhyUnRXV25BZ283?=
 =?utf-8?B?V0tZdUUvOGdvdTZna0RQd2VoY0tETzFyS25HSWFmNzlqNk5EaTgvTERhYXlM?=
 =?utf-8?B?bHJkbXJTbjhTWGM2TWVPejh1RW9PYzJQZHF1UlVMZUp5VjdRT2ZMb1IySGtB?=
 =?utf-8?B?L20wVU1pb3A1MFdnVFljZXY2ejduOXg2Y3MvOVQ5b3JkamE5KzdZQlVlNmFk?=
 =?utf-8?B?WmZsdEJNNWErZllZRDdLY3B2eXRDbkxhOE1mNk5aV29zY2VZWS80WUtIeFJl?=
 =?utf-8?B?anc2dStPb1NLZXpSYTZCT3ZXSzRCdlJnZmt4aWVTcEQ1V1BacUovT1BZS0E0?=
 =?utf-8?B?cENONDc0d1BHZnpGL2t3Vy9tcTQ2VlZuYmFzSk1VOE9hU0RMcFBnRXRuUWh4?=
 =?utf-8?B?SE9kVGM0NG9sbmgwd000RmZkYUpwaE9nMHg2WDh1cGc3RXMySEhBRlQ1bHhW?=
 =?utf-8?B?WDlzRGxqT0xBc1NrVHN1T1F2cjJOb09MaFY5TXZRcGdVK3pOOVRKTStYRU9y?=
 =?utf-8?B?V0RWd3hzcUt0R1dyekZOZ252SDFBdDYyVE41YjFjZkVYNVViekl6MU9lblRj?=
 =?utf-8?B?N29IOCswMldJTTA0MWx5OFJtdjRHdmFXS1pwM20yTEJabGRPSFVNY1dHL0ZI?=
 =?utf-8?B?bUdNTkVzbmVtNE5kTFc5ZHh4Zis3MGhrVk9kdTlaQWdhVC9tbnRmM001RjlY?=
 =?utf-8?B?YmpXL0I3UzRTcUdWeXVBUGI2QUpBeWpOaWlrY3ZwUFhOd0VmemlITFdUc2Fs?=
 =?utf-8?B?RjdJNjljeStOdm0zMWNZaWF1eGt5dzYzMXJrU1UwVVhwUU9TN2pJRFNvT0R0?=
 =?utf-8?B?b3ZtbXlDM3ZncWoxUzU0d2F0K3prTFRLaDBhTHVWREFXTHNWeldKczUwM2VF?=
 =?utf-8?B?Z3FPSGdFUGE0bmQ3aWl0WlZjNllTY1NBcEJZTFl4ZlFVUDNySUxMSGxiOW5L?=
 =?utf-8?B?V1hoUitseXNXclZrcFIzcGJIQi9qRHlQYW1wYWhlRW9NUkxMSkJzYzVnc05q?=
 =?utf-8?B?dFR5d2lYMmcvekc1TVV3WUd0MG9YTXAwb0JMVkloZXh0cGpXWGNVbHlXUGZE?=
 =?utf-8?B?eEw1VUQvMkVxRkdPbERqRlFTemRzNTdhTnNZbi92eVBtWXFKaGdHM2xWWTQ5?=
 =?utf-8?B?ZnhjZk5KVDZvUG9LeGhoMVg0WW10VldWYXhTY2tMZlNEVmsxNU9aditOK3E1?=
 =?utf-8?B?RFBGcWhYUTVqa3l0aHV4eXdQelY3YXQ3ZzN3OVdVbXYxOTk4TjREK0FIQ09u?=
 =?utf-8?B?QWYxMDZBdEhobHlnTDlRZWdOckhBTHB4dFhkdUlxQzh4YVd6MGJ4Q0k2SDhl?=
 =?utf-8?B?M3hlY0VSYWlXM2FtSVl0eFdJckNGM2QyRHJKQ0R5ekZhVkNrVmpsdjh4d1V3?=
 =?utf-8?B?ZEZxUlE1ZSszK0NuQjkrdCtYd1JYNzNsVDIwVGt0MW5hemJlOS9zRCt5aFhi?=
 =?utf-8?B?VHdGaXd4TDlYTWVrTkV3V0dIQ2ZhYVl5OWFXUmdjb2xOeVJJYWtjM3ZFUGJq?=
 =?utf-8?B?bWRQc21iM0t3cEF6MSszOElveFdrR3lZN0JOTGZSd3U4VHVSanliWERhYW5i?=
 =?utf-8?B?M3hlVXdhY05QQ0RkZkQvUlJWTndEV3hrVE1PWUJXZFlTQ292TFJuSmlKUmZp?=
 =?utf-8?B?VXBmMzVIVmdjM05QeWRaaTFjc2svc2pmeGpRcGdXays0emV6SkVSR2pPcWlZ?=
 =?utf-8?B?Znd0WUhpY2tLV3paQms3ZzNNWDN4ZGlDcDRDd3VjR3YyUDNXTmZaTjhYMlQ0?=
 =?utf-8?B?Mmx1K1dSZXVmYXJDRzBza0MzbHdWMmZ4Q0FLdFNmWElESFJHaDJkVUxpV0ky?=
 =?utf-8?B?ZjA2RFhFRlRFb3hyc0ZkbXJJM2p5RU5KeEtETG53Z0ZIV0ZSVC94d1hVeGgr?=
 =?utf-8?B?b0wyQjU1LzloZElVRjU5Z0NrVXdqNG5kRFp1TkphclVOTFhTaVZRU2dFRE9s?=
 =?utf-8?B?NWhTS0pSZVU2Mld4VXVUZitXVVpIUVBEVmMrR3dZd1hKTjFqMWxEeGJZdVVG?=
 =?utf-8?Q?OARvAP5s0nbB142s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc159d7-4677-41c1-b0fa-08da2399eb40
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:22:01.2387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zqh+wgA+9lhq4jDd+rqVijPthwzHDjzLTvxyfLlEP4eFq7aBzPCQzaxTm421EPDuAojSPuKeR+N0P3ZKdT95Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3649

Do not allow to write to RTE registers using io_apic_write and instead
require changes to RTE to be performed using ioapic_write_entry.

This is in preparation for passing the full contents of the RTE to the
IOMMU interrupt remapping handlers, so remapping entries for IO-APIC
RTEs can be updated atomically when possible.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/io_apic.h | 15 ++----------
 xen/arch/x86/io_apic.c             | 37 +++++++++++++++---------------
 2 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/include/asm/io_apic.h b/xen/arch/x86/include/asm/io_apic.h
index a558bb063c..c26261aecb 100644
--- a/xen/arch/x86/include/asm/io_apic.h
+++ b/xen/arch/x86/include/asm/io_apic.h
@@ -161,22 +161,11 @@ static inline void __io_apic_write(unsigned int apic, unsigned int reg, unsigned
 
 static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
 {
-    if ( ioapic_reg_remapped(reg) )
-        return iommu_update_ire_from_apic(apic, reg, value);
+    /* RTE writes must use ioapic_write_entry. */
+    BUG_ON(reg >= 0x10);
     __io_apic_write(apic, reg, value);
 }
 
-/*
- * Re-write a value: to be used for read-modify-write
- * cycles where the read already set up the index register.
- */
-static inline void io_apic_modify(unsigned int apic, unsigned int reg, unsigned int value)
-{
-    if ( ioapic_reg_remapped(reg) )
-        return iommu_update_ire_from_apic(apic, reg, value);
-    *(IO_APIC_BASE(apic) + 4) = value;
-}
-
 /* 1 if "noapic" boot option passed */
 extern bool skip_ioapic_setup;
 extern bool ioapic_ack_new;
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 2e5964640b..3a5e3b7872 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -269,15 +269,15 @@ void __ioapic_write_entry(
 {
     union entry_union eu = { .entry = e };
 
-    if ( raw )
+    if ( raw || !iommu_intremap )
     {
         __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
     }
     else
     {
-        io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
-        io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
+        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
     }
 }
 
@@ -433,16 +433,17 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
                                unsigned int disable)
 {
     struct irq_pin_list *entry = irq_2_pin + irq;
-    unsigned int pin, reg;
 
     for (;;) {
-        pin = entry->pin;
+        unsigned int pin = entry->pin;
+        struct IO_APIC_route_entry rte;
+
         if (pin == -1)
             break;
-        reg = io_apic_read(entry->apic, 0x10 + pin*2);
-        reg &= ~disable;
-        reg |= enable;
-        io_apic_modify(entry->apic, 0x10 + pin*2, reg);
+        rte = __ioapic_read_entry(entry->apic, pin, false);
+        rte.raw &= ~(uint64_t)disable;
+        rte.raw |= enable;
+        __ioapic_write_entry(entry->apic, pin, false, rte);
         if (!entry->next)
             break;
         entry = irq_2_pin + entry->next;
@@ -584,16 +585,16 @@ set_ioapic_affinity_irq(struct irq_desc *desc, const cpumask_t *mask)
             dest = SET_APIC_LOGICAL_ID(dest);
         entry = irq_2_pin + irq;
         for (;;) {
-            unsigned int data;
+            struct IO_APIC_route_entry rte;
+
             pin = entry->pin;
             if (pin == -1)
                 break;
 
-            io_apic_write(entry->apic, 0x10 + 1 + pin*2, dest);
-            data = io_apic_read(entry->apic, 0x10 + pin*2);
-            data &= ~IO_APIC_REDIR_VECTOR_MASK;
-            data |= MASK_INSR(desc->arch.vector, IO_APIC_REDIR_VECTOR_MASK);
-            io_apic_modify(entry->apic, 0x10 + pin*2, data);
+            rte = __ioapic_read_entry(entry->apic, pin, false);
+            rte.dest.dest32 = dest;
+            rte.vector = desc->arch.vector;
+            __ioapic_write_entry(entry->apic, pin, false, rte);
 
             if (!entry->next)
                 break;
@@ -2129,10 +2130,8 @@ void ioapic_resume(void)
             reg_00.bits.ID = mp_ioapics[apic].mpc_apicid;
             __io_apic_write(apic, 0, reg_00.raw);
         }
-        for (i = 0; i < nr_ioapic_entries[apic]; i++, entry++) {
-            __io_apic_write(apic, 0x11+2*i, *(((int *)entry)+1));
-            __io_apic_write(apic, 0x10+2*i, *(((int *)entry)+0));
-        }
+        for (i = 0; i < nr_ioapic_entries[apic]; i++, entry++)
+            __ioapic_write_entry(apic, i, true, *entry);
     }
     spin_unlock_irqrestore(&ioapic_lock, flags);
 }
-- 
2.35.1


