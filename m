Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4974CBCEA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:40:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283206.482153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjow-0007zL-8R; Thu, 03 Mar 2022 11:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283206.482153; Thu, 03 Mar 2022 11:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjow-0007wy-51; Thu, 03 Mar 2022 11:40:34 +0000
Received: by outflank-mailman (input) for mailman id 283206;
 Thu, 03 Mar 2022 11:40:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW1S=TO=citrix.com=prvs=05474af58=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPjov-0007ws-0g
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:40:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8d45f80-9ae6-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 12:40:29 +0100 (CET)
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
X-Inumbo-ID: b8d45f80-9ae6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646307631;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GNhPh5zK22vTogp6ixb+4EDWyAIqgi7sVYcsNHSAfQw=;
  b=SDmgUH9maIXROMZi2U65EfQnJ8XvgEw/Ap9y9is16ln8jqfXNO/47FEf
   CUOvTp08UsLByMl48BXKIYYF3yzVI/p0trsu0F1q01rpsjL4ikX5Q+GTQ
   k+tjBdJuXxmYyNAVLA7sa4E7dbcXy3+jz5r9uHHOhRqv2cfi0x7TZq2IP
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65786655
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QXf2YKoCKDXAjXAhr/xVt34YG05eBmIwZRIvgKrLsJaIsI4StFCzt
 garIBmGa6qNa2LzKt1yOY3n9B9XsZHRnNAyQFNv+31jEyIRopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Yiq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBPonRit1CbyljLzBkL7dB44TgGnS5rpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZdGOWQxMUmojxtnG1oyVKAupceUtHzAdDF0rVSTgfA47D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkGNN2EjzuetHv0gvTImwv0XYsTEPuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDTNPwQhm5q36spQMHVpxbFOhS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 l+tgsHQWgBfi4GEU2CH8ayvigi+PzdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vU9XZj3t3/meZOjvzmpg6f31pAs7CUFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHb1l8FKBva/t3NjgbbhHRcNJG9OFoSPLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp2k/K8S4i0Da+JN7Kih6SdkifdpkmCgmbKggjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeKmeJxI9E+xv8N/goKl
 1nkMnJlJJPErSSvAS2Ba2x5aaOpWpB6rHkhOjcrM0ru0H8mCbtDJo9EH3frVdHLLNBe8MM=
IronPort-HdrOrdr: A9a23:FXsjhKkY/MooGLsadyDyMViNtaHpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1F9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPW9yV0qp/1WH/ebcHkjaRny9Mws/U42uonVrdUlCvgUlLJd1pAZDyHo/I6M0k9
 gsfJ4Y0Y2mdfVmHp6VNN1xMfdfNVa9My4kEFjiV2gPR5t3ck4klfbMkcAIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.90,151,1643691600"; 
   d="scan'208";a="65786655"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4BZ8X4aBCAJja7YkZrL3Z/yHqD0mc2ilLt/+tbQ/s7aGWVcP5wf/wJr+gilkgfoE+urZpVVaZUMaxuGYB7tB/ntvjp9q5ZSJ7nxYVyZt9nAcoBIfQMJmL1PRpmwcYoeKBPzoXVVN0M9NEobXh9X8Xt3mOUKPK9SWC5ojvuQxvX9LsjXAZhbLwFyEIJMl+fNpcM6tY26Gq+FS7KUQG27TDXTO7DpS6nEAbORKVo0KZmH1EkrggKiIbScbUK8pikobFcSG0WL5Pc5yDdZJMjnoj2qvCQdUbmfE+fyQ0AHvcpy1YktSrCASETux6aeDEtIgG54rY4QkaoF9t6fe0ZtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2afSRf0l93cyqrlcjf+nfY+cqdS316hWlfSvgjIrtY=;
 b=A5uN0HHyXjEjvQvXNju28cuxMsMcdPYDtlKW9nvN+tXcrRDc11PPdai5s2ugBS8n3QfOkmno7GIEu4tOg365maz8vOLNU0i03NP7vgXvBMGJxwTP1qWkttLXk1cbcPd9m4Vj+ididjHsOGyLyiKOhrNoRLL/nfBttm9zPqTm/diS4tvnClsqv8HNpqHyw+Oxjz66JgyzD3c3zD+6SIPIKnmdXWzD9gW2CHT7d/0em/xO4plO8L267b6k5/HaUVvI9n6/C3/uQEAeeM4INgn5XCkneOqRB6B1Cfu/WOhp8sIn4hJZ5236+FULOsei6yVyEYqopXHKxA94jvRKmgmq1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2afSRf0l93cyqrlcjf+nfY+cqdS316hWlfSvgjIrtY=;
 b=URGmoHED12znbF7TeJgdXGL68eKLiq07azZqbeTRe3jkHB0l8IyTJkXhyePz3mctnE3WodG6pqUWd6QgDYjgPoeVmj6KjnwWVL0GIR535FPQxFEq4FJ5eWb6U/C0rTdDWyTEOhH2krrZVmi+hqQZe0aim+0r4tS1sB+O1u0Ss8o=
Date: Thu, 3 Mar 2022 12:40:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Alex Olson
	<this.is.a0lson@gmail.com>
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
Message-ID: <YiCpJfnAskieK/p4@Air-de-Roger>
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-4-roger.pau@citrix.com>
 <c1fafc74-d4d2-5fc5-db38-c75f076d8405@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1fafc74-d4d2-5fc5-db38-c75f076d8405@citrix.com>
X-ClientProxiedBy: LO4P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5ff5996-a67c-4290-2dc1-08d9fd0a9bff
X-MS-TrafficTypeDiagnostic: BY5PR03MB5000:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB50006F7FA5BEDF21018D441D8F049@BY5PR03MB5000.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8Xp0y5EOHxaJdo6EA2seuv8KQRjz/PwspFTc+6PR57B+5sbiuOyv71/1sW/Eu32mjtC9r+ChBAvw6lK6emOCcM/uFkzEV7UMX9gYjTk3OE6I9mynId7boJk4WT/p/yS8ioTtVFHyMiAN+tl+U3Z6G2wHi9eWHe1ka1Oc19agm+JCSmzEZy4E/Ymr3+vumoIMX9SiGmTAJv8Fz2+Rki2J0cDoYk+4i+XbQC7zZDgjQO/hUSB3L8f/ETcJLO1gxU8tvYb18l/vaBmL9X2Nn5G305+nbc6x6O/TblfkxTeWCL1Of7Os3dh+6v8qP72sDsd+3ztto27AFIbfMOflX40xSGzFHxZa+5TCyS88Q4iQc0D5sgfcryfPW2KnOkHkL4bVRyWOrYmY4uI9PHcJ5DDOzjLdEBO+hougbEQ+EasjXRRavqc7CNaXD6t8cvEDylp889kZOGzUiPZ7Nas9jpykS4igtgy/Oi9hA2uUM3lE2b361R9NLdEra7Hk5jKXlE6SZC+PAYoMxliJnGddH8WFOKIHIDluuSHXIq3KiU1d5Ps+5Vr6jxBd4pTlX1KireE+0M4StkqF2wOznZyTqWtQcoy15E6CL1pbC5d8rmcQ8EDnwzMmB/6T08hvEXRy81fEV74AA1DFx3aiiv1GvjY+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(38100700002)(66556008)(66476007)(508600001)(4326008)(86362001)(8676002)(6862004)(6636002)(316002)(82960400001)(5660300002)(6486002)(33716001)(85182001)(8936002)(9686003)(186003)(26005)(83380400001)(6512007)(6666004)(2906002)(54906003)(6506007)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEVocUlEbjBuZUlBZkhTUnFnTlV4SFk4ZStiSkxEQ2Q4UkplUlQzK2pxYlBL?=
 =?utf-8?B?MzR2WE5QMVE1T20yVzZiUHVwazZRaWlKcDQ0eUFrYkJpbFBTb1BIdS9TN2cv?=
 =?utf-8?B?NzRFRnZPcmMzUVlNV2F0Vmhya0orVkY5TzJVajk1VXV5TjNXRGVqdmYvQTFZ?=
 =?utf-8?B?RkNPYjltRzV6c3A0M1M1V1J6am1GdzR0aXpOQ1dqN20xTldUem1USys2cFli?=
 =?utf-8?B?bkhBL2pQblpaOExXQXo1bGlBc1BIV3dtSy9xV3F6QXVEazkxNTNSQUxoQnA2?=
 =?utf-8?B?MExDbmgyRXZkUGVPcGlkTkpVa2RYQ21HbVhxbHowb3JPMEYrWXJtU3NBckJS?=
 =?utf-8?B?RmIrRnVUbGNPN3JkdnBwdVBrdkNwbWF3b0o1N0I2WVNaOHVBOXFBQVFkN09r?=
 =?utf-8?B?VS9VV2QzaE1MenlSUVZsL1pXcTgrVWNwRERzdjl5SSs3MUp1UUhBZEg2RzFM?=
 =?utf-8?B?M3RETWdWT1dzMTE4OWZZSC9RRG8wU2lHMnpwQ0JXTmQ2VWF5ajB3OGdXaDZH?=
 =?utf-8?B?U0RVMmVTTzRHWTd1YnlsdHdUaG1HZTNzYzhnQmhIYmVMS1ZDMG8zU3o0MmZH?=
 =?utf-8?B?aUpJbzJ0U1ZTWFFqZnJRZngwREFqand5VERWYlQxS0RKM3FOTDdSZDZVazFK?=
 =?utf-8?B?Yk5OZ2IzazhBc0x4L0c5cmpvay8zakJhbHVDam4xZEZOQjNTMWV5SWp0WVFr?=
 =?utf-8?B?STVJcGhtazFwNnJ1ZVB6SGh5ajFlN01TR08wOUNiZFN1MURVcXN0TmJndTlU?=
 =?utf-8?B?K2xqU0toQnQyV09YTENwU21Kd2ZzcnZpM294Zjd3aTc2cWFzN0VQdzJ1T2g2?=
 =?utf-8?B?WFJoWUFEY3R6VW1XRUdkdXdtQm5rUUFKTm5pVHEvQ2VvUnhFL0RzZHYzdzFz?=
 =?utf-8?B?dm9GMmVSZmRUQTJLeisvMDJTUHF4cjhPenhWNHBaMzl2d3JkaitZYUdMaUI4?=
 =?utf-8?B?SG1HY21FTnJ0Z2RhOUpqRGpTWldNeUtoQTh2UG5QMnU3eE03L0JtSWVyWHNk?=
 =?utf-8?B?ZFpmbkpCaUE0NDJ4b2RxYWVzVnlibzFzN1p0YVI3VUk5aklEOTFFVkQydG82?=
 =?utf-8?B?ZjVWQTBBOVBINHZza1Y1T0hRbHNDVG5OM1BMTDJoMWRjcHdibFI3RjYvOGN4?=
 =?utf-8?B?TXAvdFRQQVkzNUJZZ2tXenBSNlRQQ1ZtTE5zeDFkbnRrUHdhOTFwQnNWY0Uw?=
 =?utf-8?B?RjVoMTRJK1lhZVIyNzNiRGNKOWpuTDM4KzZKQytLLzhNaUFHVDBabC9zeXFU?=
 =?utf-8?B?eHhqUmlGaTlXMGJpbktKYUw5REdmdFNWNmlrNVdRVGxwVzhyY1U0Zy95eEVP?=
 =?utf-8?B?bE1RZFA2M2NYQm1BM2VrWUJIZ05lelFCOXRXTE5PcFRDWVliVkhoeWZ3aHBU?=
 =?utf-8?B?M0xXdFg1dzVxK0FHVWJ0U01weW83ejVXRHlyelpEYmQ3WHM1K3FRWCsxMEs1?=
 =?utf-8?B?aERqYy83MEJFcHJSQVBUbDVDMU1YTHZ2N0JTU3F0T29qYUlrRzZlQ09YaEho?=
 =?utf-8?B?VnUzdWI5eHZIOHE2MDAzR09vYXZ1Z0p1SnVZMm1qYU1RVWNxcWNlWkw3bmw3?=
 =?utf-8?B?a1Z6Z1RzaGJYcVpBWnJSUGdsdUs5RUtKL2RNUE1udm02YTZuK2JoeDg2Rk5I?=
 =?utf-8?B?d1dzZERRa1AzaUR1NzNOOEFDRjJ0VnEwZEtlbmxmNFhBaFVQcG9hd21Pbkxs?=
 =?utf-8?B?M2hOYWlxdGVPbWQybmc5UHJIR2EwbzNLVW1hdzJvd3JWR0gxeFZ0a253MFp1?=
 =?utf-8?B?NnhIZmZOQ2NEMktFMzd5UG9pRkJuVDZPSDU2N3JJZWRQdm5iSi9LZGlaeDBt?=
 =?utf-8?B?WkpEOHQzQmwycjd3dzM3N1U2TVpYN2dIUVMyOU8wQXJ1cVNTeGVUME84ZXpm?=
 =?utf-8?B?Y3lRM083Zmk3QmhVNzk1QklUdWRISFZnUlpMM1VORmVVYTdmNEd0eU80NmxB?=
 =?utf-8?B?dkZHQ1RFNHpFNmNTSXBad1FiRTk1OHU2cTR2d1hkN2U0ZVBYbnpJT2hOVHVN?=
 =?utf-8?B?dGNmZUpiUjFHNmZVU00rK2ptQ252N2JQZ01uQjUrd2FJUW1TVWVHMVZYRlFn?=
 =?utf-8?B?YmRPZllKbFkrSWcwR0JvZzI1Qk4vSDVzWHF5ckdjOWVhdCtOZ0JSdmMzZkJs?=
 =?utf-8?B?amdlRno3MmVxTlNMKzRIS3Y0TjVOQXFhbjlkdlJoaG9XVHp0U3NnSllDcUYy?=
 =?utf-8?Q?pCf0qozXRQNYIaCQJKx21Zw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ff5996-a67c-4290-2dc1-08d9fd0a9bff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:40:26.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiEzWlbryt9AV/yTT43zooSmK6yMXd7BYGi1cI6SHTODLBh4WUOJC5MVgkOz3c2BAqRIvvN+aV+n+aYxAUv70Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000
X-OriginatorOrg: citrix.com

On Thu, Mar 03, 2022 at 10:45:54AM +0000, Andrew Cooper wrote:
> On 03/03/2022 10:30, Roger Pau Monne wrote:
> > Control domains (including domains having control over a single other
> > guest) need access to PHYSDEVOP_{un,}map_pirq in order to setup
> > bindings of interrupts from devices assigned to the controlled guest.
> >
> > As such relax the check for HVM based guests and allow the usage of
> > the hypercalls for any control domains. Note that further safety
> > checks will be performed in order to assert that the current domain
> > has the right permissions against the target of the hypercall.
> >
> > Reported-by: Alex Olson <this.is.a0lson@gmail.com>
> > Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/hypercall.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> > index 030243810e..9128e4d025 100644
> > --- a/xen/arch/x86/hvm/hypercall.c
> > +++ b/xen/arch/x86/hvm/hypercall.c
> > @@ -87,6 +87,13 @@ static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >      {
> >      case PHYSDEVOP_map_pirq:
> >      case PHYSDEVOP_unmap_pirq:
> > +        /*
> > +         * Control domain (and domains controlling others) need to use
> > +         * PHYSDEVOP_{un,}map_pirq in order to setup interrupts for passthrough
> > +         * devices on behalf of other guests.
> > +         */
> > +        if ( is_control_domain(currd) || currd->target )
> > +            break;
> 
> Hmm.  In a split control/hardware domain model, then qemu is in the
> hardware domain rather than the control domain.  I suspect this wants
> extending with || is_hardware_domain(currd).

The binding of GSIs is exclusively done by the control domain because
those are static and known at domain creation.  The mapping and
binding of MSI interrupts is however done by QEMU at runtime, so it
needs extending to the hardware domain.

However just extending here won't be enough: we would also need to
modify xsm_default_action, as currently XSM_DM_PRIV will only be
allowed if src->target == target or is_control_domain(src).

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 58afc1d589..ac40a24a22 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -88,7 +88,8 @@ static always_inline int xsm_default_action(
         }
         /* fall through */
     case XSM_DM_PRIV:
-        if ( target && evaluate_nospec(src->target == target) )
+        if ( is_hardware_domain(src) ||
+             (target && evaluate_nospec(src->target == target)) )
             return 0;
         /* fall through */
     case XSM_PRIV:

That would however also give the hardware domain access to XSM_TARGET
and XSM_XS_PRIV operations that where previously forbidden.

Or do we just require people with split control/hardware domain model
to also use a different XSM policy?

> Also, the sentence about later safety checks really ought to be in this
> source comment too.

Will add.

Thanks, Roger.

